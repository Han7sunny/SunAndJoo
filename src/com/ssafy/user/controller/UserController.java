package com.ssafy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.board.model.dao.ReplyDao;
import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.dto.ReplyDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.BoardServiceImpl;
import com.ssafy.board.model.service.ReplyService;
import com.ssafy.board.model.service.ReplyServiceImpl;
import com.ssafy.user.model.UserDto;
import com.ssafy.user.model.service.UserService;
import com.ssafy.user.model.service.UserServiceImpl;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService;
	private BoardService boardService;
	private ReplyService replyService;

	public UserController() {
		userService = UserServiceImpl.getUserService();
		boardService = BoardServiceImpl.getBoardService();
		replyService = ReplyServiceImpl.getReplyService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		System.out.println("action === " + action);
		String path = "./index.jsp";
		switch (action) {
		case "mvLogin":
			path = "./user/login.jsp";
			forward(request, response, path);
			break;
		case "login":
			path = login(request, response);
			forward(request, response, path);
			break;
		case "mvJoin":
			path = "./user/join.jsp";
			redirect(request, response, path);
			break;
		case "namecheck":
			int cnt1 = nameCheck(request, response);
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out1 = response.getWriter();
			out1.println(cnt1);
			break;
		case "idcheck":
			int cnt2 = idCheck(request, response);
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out2 = response.getWriter();
			out2.println(cnt2);
			break;
		case "join":
			path = join(request, response);
			forward(request, response, path);
			break;
		case "findId":
			path = findId(request, response);
			forward(request, response, path);
			break;
		case "findPwd":
			path = findPwd(request, response);
			forward(request, response, path);
			break;
		case "mvMyPage":
			path = mvMyPage(request, response);
			forward(request, response, path);
			break;
		case "logout":
			path = logout(request, response);
			redirect(request, response, path);
			break;
		case "modify":
			path = modfiy(request, response);
			forward(request,response,path);
			break;
		case "delete":
			path = delete(request, response);
			forward(request,response,path);
			break;
		default:
			redirect(request, response, path);
			break;
		}

	}


	private int nameCheck(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("username");
		try {
			int count = userService.nameCheck(userName);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
	}

	private String mvMyPage(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			UserDto user = (UserDto) session.getAttribute("userInfo");

			if(user.getAdminAuthor()) {
				List<BoardDto> noticeList = boardService.getBoardListById(user.getId(), "공지사항");
				request.setAttribute("noticeSize", noticeList.size());
				request.setAttribute("noticeList", noticeList);
			}
			List<BoardDto> boardList = boardService.getBoardListById(user.getId(), "list");

			request.setAttribute("boardList", boardList);
			request.setAttribute("boardSize", boardList.size());
			
			List<ReplyDto> replyList = replyService.list_by_id(user.getId());
			request.setAttribute("replyList",replyList);
			request.setAttribute("replySize",replyList.size());
			
			return "/user/mypage.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}

	}

	private int idCheck(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userid");
		try {
			int count = userService.idCheck(userId);
			return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 500;
	}

	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private String join(HttpServletRequest request, HttpServletResponse response) {
		UserDto userDto = new UserDto();
		userDto.setId(request.getParameter("userid"));
		userDto.setName(request.getParameter("username"));
		userDto.setPwd(request.getParameter("userpwd"));
		userDto.setEmailId(request.getParameter("emailid"));
		userDto.setEmailDomain(request.getParameter("emaildomain"));
		try {
			userService.joinUser(userDto);
			request.setAttribute("joinId", userDto.getId());
			return "/user?action=mvLogin";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("userInfo");
		return "./index.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("userid");
		String pwd = request.getParameter("userpwd");
		try {
			UserDto userDto = userService.loginUser(id, pwd);
			if (userDto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("userInfo", userDto);
				return "/index.jsp"; // nav에?
			} else {
				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인해주세요.");
				return "/user/login.jsp";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String findId(HttpServletRequest request, HttpServletResponse response) {
		String find_email = request.getParameter("find-email");
		String find_emaildomain = request.getParameter("find-emaildomain");
		String result = null;
		try {
			result = userService.findId(find_email, find_emaildomain);
			request.setAttribute("finded_id", result);
			return "/user/find-id-result.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String findPwd(HttpServletRequest request, HttpServletResponse response) {
		String find_id = request.getParameter("find-id");
		String find_email = request.getParameter("find-email");
		String find_emaildomain = request.getParameter("find-emaildomain");
		String result = null;

		try {
			result = userService.findPwd(find_id, find_email, find_emaildomain);
			if(result != null) {
				// 이메일 보내기
			}
			//request.setAttribute("finded_pwd", result);
			return "/user/find-pwd-result.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String modfiy(HttpServletRequest request, HttpServletResponse response) {
		UserDto userDto = new UserDto();
		userDto.setId(request.getParameter("userpage_id"));
		userDto.setEmailId(request.getParameter("userpage_emailId"));
		userDto.setEmailDomain(request.getParameter("userpage_emailDomain"));
		
		HttpSession session = request.getSession();
	
		try {
			userService.modify(userDto);
			session.setAttribute("userInfo", userDto);
			return "/alert_page/modify_success.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "수정중에러발생");
			return "/error/error.jsp";
		}
	}


	private String delete(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserDto delete_user = (UserDto) session.getAttribute("userInfo");
		String id = delete_user.getId();

		request.getSession().removeAttribute("userInfo");

		try {
			userService.delete(id);
			return "/main?action=mvMyPage";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "삭제중에러발생");
			return "/error/error.jsp";
		}

	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
