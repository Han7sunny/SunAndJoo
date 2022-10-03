package com.ssafy.board.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.board.model.dto.ReplyDto;


public interface ReplyService {
	void regist(ReplyDto replyDto) throws Exception;
	List<ReplyDto> list(int board_id) throws Exception;
	List<ReplyDto> list_by_id(String user_id) throws Exception;
	void modify(ReplyDto replyDto) throws Exception;
	void delete(int idx) throws Exception;
}
