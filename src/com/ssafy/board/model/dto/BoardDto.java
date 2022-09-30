package com.ssafy.board.model.dto;

public class BoardDto {
	private int board_id;
	private String board_title;
	private String board_type_id;
	private String user_id;
	private int location_sido;
	private int location_gungu;
	private String content;
	private int score;
	private String start_date;
	private String end_date;
	private int readcount;
	private String regist_time;
	private String img1;
	private String img2;

	public BoardDto() {
		super();
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_type_id() {
		return board_type_id;
	}

	public void setBoard_type_id(String board_type_id) {
		this.board_type_id = board_type_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getLocation_sido() {
		return location_sido;
	}

	public void setLocation_sido(int location_sido) {
		this.location_sido = location_sido;
	}

	public int getLocation_gungu() {
		return location_gungu;
	}

	public void setLocation_gungu(int location_gungu) {
		this.location_gungu = location_gungu;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getRegist_time() {
		return regist_time;
	}

	public void setRegist_time(String regist_time) {
		this.regist_time = regist_time;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	@Override
	public String toString() {
		return "BoardDto [board_id=" + board_id + ", board_title=" + board_title + ", board_type_id=" + board_type_id
				+ ", user_id=" + user_id + ", location_sido=" + location_sido + ", location_gungu=" + location_gungu
				+ ", content=" + content + ", start_date=" + start_date + ", end_date=" + end_date + ", readcount="
				+ readcount + ", regist_time=" + regist_time + ", img1=" + img1 + ", img2=" + img2 + "]";
	}

}
