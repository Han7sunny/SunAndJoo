package com.ssafy.trip.model;

public class ContentTypeDto {

	private int contentTypeId;
	private String contentTypeName;

	public ContentTypeDto() {
		super();
	}

	public ContentTypeDto(int contentTypeId, String contentTypeName) {
		super();
		this.contentTypeId = contentTypeId;
		this.contentTypeName = contentTypeName;
	}

	public int getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeId(int contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getContentTypeName() {
		return contentTypeName;
	}

	public void setContentTypeName(String contentTypeName) {
		this.contentTypeName = contentTypeName;
	}

}
