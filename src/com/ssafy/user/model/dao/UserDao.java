package com.ssafy.user.model.dao;

import java.sql.SQLException;

import com.ssafy.user.model.UserDto;

public interface UserDao {

	UserDto loginUser(String id, String pwd) throws SQLException;
	int nameCheck(String name) throws SQLException;
	int idCheck(String id) throws SQLException;
	void joinUser(UserDto userDto) throws SQLException;
	void modify(UserDto userDto) throws SQLException;
	void delete(String id) throws SQLException;
	String findId(String email, String domain) throws SQLException;
	String findPwd(String id, String email, String domain) throws SQLException;
}
