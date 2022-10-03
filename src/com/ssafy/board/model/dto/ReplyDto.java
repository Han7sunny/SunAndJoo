package com.ssafy.board.model.dto;

public class ReplyDto {
	private int idx;
	private int board_id;
	private String user_id;
	private String reply_content;
	private String regist_time;
	
	
	
	
	public ReplyDto() {
		super();
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}
	
	@Override
	public String toString() {
		return "ReplyDto [idx=" + idx + ", board_id=" + board_id + ", user_id=" + user_id + ", reply_content="
				+ reply_content + ", regist_time=" + regist_time + "]";
	}
	
	
}
