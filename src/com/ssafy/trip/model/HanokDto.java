package com.ssafy.trip.model;

public class HanokDto {
	private String title;
	private String zipcode;
	private String tel;
	private String addr;
	private String lat;
	private String lng;
	private String overview;
	private String scale;
	private String accept;
	private String room;
	private String room_type;
	private String checkin;
	private String checkout;
	private String policy;
	private String img;

	
	
	public HanokDto() {
		super();
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public String getScale() {
		return scale;
	}

	public void setScale(String scale) {
		this.scale = scale;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public String getPolicy() {
		return policy;
	}

	public void setPolicy(String policy) {
		this.policy = policy;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	@Override
	public String toString() {
		return "HanokDto [title=" + title + ", zipcode=" + zipcode + ", tel=" + tel + ", addr=" + addr + ", lat=" + lat
				+ ", lng=" + lng + ", overview=" + overview + ", scale=" + scale + ", accept=" + accept + ", room="
				+ room + ", room_type=" + room_type + ", checkin=" + checkin + ", checkout=" + checkout + ", policy="
				+ policy + ", img=" + img + "]";
	}

	
}
