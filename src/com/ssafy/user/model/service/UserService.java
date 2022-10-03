package com.ssafy.user.model.service;

import java.sql.SQLException;
import com.ssafy.user.model.UserDto;

public interface UserService {

	UserDto loginUser(String id, String pwd) throws Exception;
	int nameCheck(String name) throws Exception;
	int idCheck(String id) throws Exception;
	void joinUser(UserDto userDto) throws Exception;
	void modify(UserDto userDto) throws Exception;
	void delete(String id) throws Exception;
	String findId(String email, String domain) throws Exception;
	String findPwd(String id, String email, String domain) throws Exception;
}
