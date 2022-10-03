package com.ssafy.board.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.board.model.dto.ReplyDto;
import com.ssafy.board.model.service.ReplyService;
import com.ssafy.board.model.service.ReplyServiceImpl;
import com.ssafy.user.model.UserDto;

@WebServlet("/reply")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReplyService replyService;

	public void init() {
		replyService = ReplyServiceImpl.getReplyService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");

		String path = "/index.jsp";
		if ("regist".equals(act)) {
			path = regist(request, response);
			forward(request, response, path);
		} else if ("modify".equals(act)) {
			path = modify(request, response);
			forward(request, response, path);		
		} else if ("delete".equals(act)) {
			path = delete(request, response);
			forward(request, response, path);
		} 
		else {
			redirect(request, response, path);
		}
	}


	private String regist(HttpServletRequest request, HttpServletResponse response) {
		ReplyDto replyDto = new ReplyDto();

		System.out.println("cmt action === regist");

		// 글 작성자 아이디를 세션에서 받아온 후 commentDto에 set
		HttpSession session = request.getSession();
		UserDto user = (UserDto) session.getAttribute("userInfo");
		replyDto.setUser_id(user.getId());
		replyDto.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		replyDto.setReply_content(request.getParameter("content"));
		
		System.out.println("regist 함수 " + replyDto.toString());
		

		try {
			replyService.regist(replyDto);
			return "/main_community?act=view&board_id="+replyDto.getBoard_id();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "등록중에러발생");
			return "/error/error.jsp";
		}
	}
	


	private String modify(HttpServletRequest request, HttpServletResponse response) {
		ReplyDto replyDto = new ReplyDto();
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		
		replyDto.setIdx(Integer.parseInt(request.getParameter("idx")));
		replyDto.setBoard_id(board_id);
		replyDto.setReply_content(request.getParameter("modify-content"));
		
		try {
			replyService.modify(replyDto);
			return "/main_community?act=view&board_id="+board_id;
		} catch (Exception e) {	
			e.printStackTrace();
			request.setAttribute("msg", "등록중에러발생");
			return "/error/error.jsp";
		}
	}
	

	private String delete(HttpServletRequest request, HttpServletResponse response) {
		int board_id = Integer.parseInt(request.getParameter("board_id"));
		int idx = Integer.parseInt(request.getParameter("reply-idx"));
		
		try {
			replyService.delete(idx);
			return "/main_community?act=view&board_id="+board_id;
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "등록중에러발생");
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
