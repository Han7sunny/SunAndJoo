package com.ssafy.board.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.board.model.dto.BoardDto;


public interface BoardService {
	void regist(BoardDto boardDto) throws Exception;
	List<BoardDto> list(String content_type_id) throws Exception;
	BoardDto view(int board_id) throws Exception;
	void modify(BoardDto boardDto) throws Exception;
	void delete(int board_id) throws Exception;
	List<BoardDto> getBoardListById(String id, String board_type_id) throws Exception;
	List<BoardDto> topReviewList(String content_type_id) throws Exception;
	List<BoardDto> topMateList(String content_type_id) throws Exception;
	String[] getLocationName(BoardDto boardDto) throws Exception;
}
