package com.ssafy.trip.model;

public class SigunguDto {

	private int areaCode;
	private int sigunguCode;
	private String sigunguName;

	public SigunguDto() {
		super();
	}

	public SigunguDto(int areaCode, int sigunguCode, String sigunguName) {
		super();
		this.areaCode = areaCode;
		this.sigunguCode = sigunguCode;
		this.sigunguName = sigunguName;
	}

	public int getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(int areaCode) {
		this.areaCode = areaCode;
	}

	public int getSigunguCode() {
		return sigunguCode;
	}

	public void setSigunguCode(int sigunguCode) {
		this.sigunguCode = sigunguCode;
	}

	public String getSigunguName() {
		return sigunguName;
	}

	public void setSigunguName(String sigunguName) {
		this.sigunguName = sigunguName;
	}

}
