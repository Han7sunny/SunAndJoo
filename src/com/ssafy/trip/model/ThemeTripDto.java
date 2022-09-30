package com.ssafy.trip.model;

public class ThemeTripDto {

	private int contentId;
	private String title;
	private String firstImage;
	private String firstImage2;
	private String readCount;
	private String overView;

	public ThemeTripDto() {
		super();
	}

	public ThemeTripDto(int contentId, String title, String firstImage, String firstImage2, String readCount,
			String overView) {
		super();
		this.contentId = contentId;
		this.title = title;
		this.firstImage = firstImage;
		this.firstImage2 = firstImage2;
		this.readCount = readCount;
		this.overView = overView;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstImage() {
		return firstImage;
	}

	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}

	public String getFirstImage2() {
		return firstImage2;
	}

	public void setFirstImage2(String firstImage2) {
		this.firstImage2 = firstImage2;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	public String getOverView() {
		return overView;
	}

	public void setOverView(String overView) {
		this.overView = overView;
	}

}
