package com.ssafy.user.model;

public class UserDto {

	private String name;
	private String id;
	private String pwd;
	private String emailId;
	private String emailDomain;
	private boolean adminAuthor;

	public UserDto() {
		super();
	}

	public UserDto(String name, String id, String pwd, String emailId, String emailDomain, boolean adminAuthor) {
		super();
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.emailId = emailId;
		this.emailDomain = emailDomain;
		this.adminAuthor = adminAuthor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getEmailDomain() {
		return emailDomain;
	}

	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}

	public boolean getAdminAuthor() {
		return adminAuthor;
	}

	public void setAdminAuthor(boolean adminAuthor) {
		this.adminAuthor = adminAuthor;
	}

	@Override
	public String toString() {
		return "UserDto [name=" + name + ", id=" + id + ", pwd=" + pwd + ", emailId=" + emailId + ", emailDomain="
				+ emailDomain + ", adminAuthor="+adminAuthor+ "]";
	}

}
