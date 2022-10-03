package com.ssafy.board.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.board.model.dto.ReplyDto;

public interface ReplyDao {
	void regist(ReplyDto replyDto) throws SQLException;
	List<ReplyDto> list(int board_id) throws SQLException;
	List<ReplyDto> list_by_id(String user_id) throws SQLException;
	void modify(ReplyDto replyDto)  throws SQLException;
	void delete(int idx) throws SQLException;
	
}
