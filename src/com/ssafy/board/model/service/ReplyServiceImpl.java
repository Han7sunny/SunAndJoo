package com.ssafy.board.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.board.model.dao.ReplyDao;
import com.ssafy.board.model.dao.ReplyDaoImpl;
import com.ssafy.board.model.dto.ReplyDto;

public class ReplyServiceImpl implements ReplyService {

	private static ReplyService replyService = new ReplyServiceImpl();
	private ReplyDao replyDao;
	
	private ReplyServiceImpl() {
		replyDao = ReplyDaoImpl.getReplyDao();
	}
	
	public static ReplyService getReplyService() {
		return replyService;
	}

	@Override
	public void regist(ReplyDto replyDto) throws Exception {
		replyDao.regist(replyDto);
	}

	@Override
	public List<ReplyDto> list(int board_id) throws Exception {
		return replyDao.list(board_id);
	}

	@Override
	public void modify(ReplyDto replyDto) throws Exception {
		replyDao.modify(replyDto);
	}

	@Override
	public void delete(int idx) throws Exception {
		replyDao.delete(idx);
	}

	@Override
	public List<ReplyDto> list_by_id(String user_id) throws Exception {
		return replyDao.list_by_id(user_id);
	}

	@Override
	public void deleteAll(int board_id) throws Exception {
		replyDao.deleteAll(board_id);
	}

}
