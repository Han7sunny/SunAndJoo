package com.ssafy.board.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.board.model.dto.BoardDto;

public interface BoardDao {
	void regist(BoardDto boardDto) throws SQLException;
	List<BoardDto> list(String content_type_id) throws SQLException;
	BoardDto view(int board_id) throws SQLException;
	void modify(BoardDto boardDto) throws SQLException;
	void delete(int board_id) throws SQLException;
	List<BoardDto> getBoardListById(String id, String board_type_id) throws SQLException;
	List<BoardDto> topReviewList(String content_type_id) throws SQLException;
	List<BoardDto> topMateList(String content_type_id) throws SQLException;
	String[] getLocationName(BoardDto boardDto) throws SQLException;
	void updateHit(int board_id) throws SQLException;
}
