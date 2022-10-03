package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dao.BoardDaoImpl;
import com.ssafy.board.model.dto.BoardDto;

public class BoardServiceImpl implements BoardService {

	private static BoardService boardService = new BoardServiceImpl();
	private BoardDao boardDao;
	
	private BoardServiceImpl() {
		boardDao = BoardDaoImpl.getBoardDao();
	}
	
	public static BoardService getBoardService() {
		return boardService;
	}
	

	@Override
	public void regist(BoardDto boardDto) throws Exception {
		boardDao.regist(boardDto);
		
	}

	@Override
	public BoardDto view(int article_no) throws Exception {
		return boardDao.view(article_no);
	}

	@Override
	public void modify(BoardDto boardDto) throws Exception {
		boardDao.modify(boardDto);
		
	}

	@Override
	public void delete(int board_no) throws Exception {
		boardDao.delete(board_no);
		
	}

	@Override
	public List<BoardDto> list(String content_type_id) throws Exception {
		return boardDao.list(content_type_id);		
	}

	@Override
	public List<BoardDto> getBoardListById(String id, String board_type_id) throws Exception {
		return boardDao.getBoardListById(id, board_type_id);
	}
	
	@Override
	public List<BoardDto> topReviewList(String content_type_id) throws Exception {
		return boardDao.topReviewList(content_type_id);
		
	}

	@Override
	public List<BoardDto> topMateList(String content_type_id) throws Exception {
		return boardDao.topMateList(content_type_id);
	}

	@Override
	public String[] getLocationName(BoardDto boardDto) throws Exception {
		return boardDao.getLocationName(boardDto);
	}
	
	@Override
	public void updateHit(int board_id) throws Exception {
		boardDao.updateHit(board_id);
	}
}
