package com.ssafy.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.BoardServiceImpl;
import com.ssafy.board.model.service.ReplyService;
import com.ssafy.board.model.service.ReplyServiceImpl;
import com.ssafy.user.model.UserDto;


@WebServlet("/main_community")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService;
	private ReplyService replyService;

	public void init() {
		boardService = BoardServiceImpl.getBoardService();
		replyService = ReplyServiceImpl.getReplyService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");

		String path = "/index.jsp";
		if ("mvRegist".equals(act)) {
			path = "/registNotice.jsp";
			redirect(request, response, path);
		} else if ("regist".equals(act)) {
			path = regist(request, response);
			forward(request, response, path);
		} else if ("mvList".equals(act)) {
			path = mvList(request, response);
			forward(request, response, path);
		} else if ("list".equals(act)) {
			path = list(request, response);
			forward(request, response, path);

		} else if ("view".equals(act)) {
			path = view(request, response);
			System.out.println("보드path: " +path);
			forward(request, response, path);

		} else if ("mvModify".equals(act)) {
			path = mvModify(request, response);
			forward(request, response, path);

		} else if ("modify".equals(act)) {
			path = modify(request, response);
			forward(request, response, path);

		} else if ("delete".equals(act)) {
			path = delete(request, response);
			forward(request, response, path);

		} else if ("notice".equals(act)) {
			path = notice(request, response);
			forward(request, response, path);

		} else {
			redirect(request, response, path);
		}
	}

	private String notice(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<BoardDto> noticeList = boardService.list("4");
			request.setAttribute("noticeList", noticeList);
			return "/notice.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "공지사항 목록을 읽어올 수 없습니다.");
			return "/error/error.jsp";
		}
	}

	private String regist(HttpServletRequest request, HttpServletResponse response) {
		BoardDto boardDto = new BoardDto();

		System.out.println("board action === regist");

		// 글 작성자 아이디를 세션에서 받아온 후 boardDto에 set
		HttpSession session = request.getSession();
		UserDto user = (UserDto) session.getAttribute("userInfo");
		boardDto.setUser_id(user.getId());

		boardDto.setBoard_id(0); // daoImpl에서 default 값
		boardDto.setBoard_title(request.getParameter("board_title"));
		String contentType = request.getParameter("content_type");
		request.setAttribute("content_type", contentType);

		switch (contentType) {
		case "1":
			boardDto.setBoard_type_id("여행후기");
			break;
		case "2":
			boardDto.setBoard_type_id("여행메이트");
			break;
		case "3":
			boardDto.setBoard_type_id("여행메이트후기");
			break;
		case "4":
			boardDto.setBoard_type_id("공지사항");
			break;
		}

		boardDto.setReadcount(0);
		boardDto.setRegist_time("now"); // 디폴트값
		boardDto.setContent(request.getParameter("board_content"));

		if (contentType != "4") {
			// 작성자가 고른 지역과 군구
//		boardDto.setLocation_sido(Integer.parseInt(request.getParameter("")));
//		boardDto.setLocation_gungu("default_location");
			boardDto.setLocation_sido(1);// 임시 지역
			boardDto.setLocation_gungu(1);// 임시 지역

			boardDto.setStart_date(request.getParameter("start_date"));
			boardDto.setEnd_date(request.getParameter("end_date"));

			boardDto.setImg1("default_img1"); // 임시 디폴트값
			boardDto.setImg2("default_img2"); // 임시 디폴트값
			
			
		}
		try {
			boardService.regist(boardDto);
			return "/main_community?act=mvList";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "등록중에러발생");
			return "/error/error.jsp";
		}
	}

	private String mvList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("board action === mvList");

		String content_type = request.getParameter("content_type");
		if (content_type == null) { // url로 content_type_id값이 넘어올때
			content_type = request.getParameter("content_type_id");
		}

		// 게시글 유형에 따라 return path switch
		String by_content_type_path = null;
		switch (content_type) {
		case "0":
			by_content_type_path = "/community.jsp";
			break;
		case "1":
			by_content_type_path = "/community-tripReview.jsp";
			break;
		case "2":
			by_content_type_path = "/community-tripMate.jsp";
			break;
		case "3":
			by_content_type_path = "/community-tripReview.jsp";
			break;
		case "4":
			return "/main_community?act=notice";
		}

		try {
			request.setAttribute("content_type_id", content_type);
			request.setAttribute("list_path", by_content_type_path);

			return "/main_community?act=list";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "게시글 페이지로 이동 중 에러 발생");
			return "/error/error.jsp";
		}
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("board action === list");
		String content_type_id = (String) request.getAttribute("content_type_id");

		try {
			List<BoardDto> list = boardService.list(content_type_id);
			request.setAttribute("total_boards", list);

			List<BoardDto> top_review = boardService.topReviewList(content_type_id);
			List<BoardDto> top_mate = boardService.topMateList(content_type_id);

			boardService.topReviewList(content_type_id);
			boardService.topMateList(content_type_id);
			request.setAttribute("top_review", top_review);
			request.setAttribute("top_mate", top_mate);
			
			return (String) request.getAttribute("list_path");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "목록 처리 중 에러발생");
			return "/error/error.jsp";
		}
	}

	private String view(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("board action === view");
		String[] location = new String[2];
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		try {
			BoardDto boardDto = boardService.view(board_id);
			request.setAttribute("detail_board", boardDto);

			location = boardService.getLocationName(boardDto);
			request.setAttribute("location_sido", location[0]);
			request.setAttribute("location_gungu", location[1]);
			
			request.setAttribute("total_reply", replyService.list(board_id));

			return "/board_detail_view.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "상세페이지 처리 중 에러발생");
			return "/error/error.jsp";
		}
	}

	private String mvModify(HttpServletRequest request, HttpServletResponse response) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));

		System.out.println("수정하려는 글 번호 :  " + board_id);

		try {
			BoardDto boardDto = boardService.view(board_id);

			request.setAttribute("modify_board", boardDto);

//			location = boardService.getLocationName(boardDto);
//			request.setAttribute("location_sido", location[0]);
//			request.setAttribute("location_gungu", location[1]);


			return "/board_modify.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "수정 처리 중 에러발생");
			return "/error/error.jsp";
		}
	}

	private String modify(HttpServletRequest request, HttpServletResponse response) {
		BoardDto boardDto = new BoardDto();
		boardDto.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		boardDto.setBoard_title(request.getParameter("title"));
		String boardTypeId = request.getParameter("board_type_id");
		boardDto.setBoard_type_id(boardTypeId);
		boardDto.setContent(request.getParameter("content"));

		if (!"공지사항".equals(boardTypeId)) {
			boardDto.setLocation_sido(Integer.parseInt(request.getParameter("location_sido")));
			boardDto.setLocation_gungu(Integer.parseInt(request.getParameter("location_gungu")));
		}else {
			boardDto.setLocation_sido(1); // default
			boardDto.setLocation_gungu(1); // default
		}
		System.out.println("컨트롤러" + boardDto.toString());
		System.out.println(boardDto.getLocation_sido() + ", " + boardDto.getLocation_gungu());

		try {
			boardService.modify(boardDto);
			request.setAttribute("board_id", boardDto.getBoard_id());
			return "/user?action=mvMyPage";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "수정 중 에러발생");
			return "/error/error.jsp";
		}
	}

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		System.out.println("삭제하려는 글번호 : " + board_id);

		try {
			boardService.delete(board_id);
			return "/user?action=mvMyPage";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "삭제 중 에러발생");
			return "/error/error.jsp";
		}

	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
