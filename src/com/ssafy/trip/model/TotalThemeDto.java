package com.ssafy.trip.model;

public class TotalThemeDto {
	int idx;
	String title;
	String lat;
	String lng;
	String overview;
	String calendar;
	String type;
	String dist;
	String time;
	String details;
	
	String img1;
	String img2;
	String readcount;
	String area_code;
	String sigungu_code;
	
	public TotalThemeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getCalendar() {
		return calendar;
	}
	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
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
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getSigungu_code() {
		return sigungu_code;
	}
	public void setSigungu_code(String sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	
	@Override
	public String toString() {
		return "TotalThemeDto [idx=" + idx + ", title=" + title + ", lat=" + lat + ", lng=" + lng + ", overview="
				+ overview + ", calendar=" + calendar + ", type=" + type + ", dist=" + dist + ", time=" + time
				+ ", details=" + details + ", img1=" + img1 + ", img2=" + img2 + ", readcount=" + readcount
				+ ", area_code=" + area_code + ", sigungu_code=" + sigungu_code + "]";
	}
	
	
	
}
