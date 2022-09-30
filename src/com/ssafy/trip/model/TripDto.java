package com.ssafy.trip.model;

public class TripDto {

	private String title;
	private int contentTypeId;
	private String addr;
	private String tel;
	private String mapX;
	private String mapY;

	public TripDto() {
		super();
	}

	public TripDto(String title, int contentTypeId, String addr, String tel, String mapX, String mapY) {
		super();
		this.title = title;
		this.contentTypeId = contentTypeId;
		this.addr = addr;
		this.tel = tel;
		this.mapX = mapX;
		this.mapY = mapY;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

}
