package com.ssafy.user.model.service;

import com.ssafy.user.model.UserDto;
import com.ssafy.user.model.dao.UserDao;
import com.ssafy.user.model.dao.UserDaoImpl;

public class UserServiceImpl implements UserService {

	private static UserService userService = new UserServiceImpl();
	private UserDao userDao;

	private UserServiceImpl() {
		userDao = UserDaoImpl.getUserDao();
	}

	public static UserService getUserService() {
		return userService;
	}

	@Override
	public UserDto loginUser(String id, String pwd) throws Exception {
		return userDao.loginUser(id, pwd);
	}

	@Override
	public void joinUser(UserDto userDto) throws Exception {
		userDao.joinUser(userDto);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return userDao.idCheck(id);
	}

	@Override
	public int nameCheck(String name) throws Exception {
		return userDao.nameCheck(name);
	}
	
	@Override
	public void modify(UserDto userDto) throws Exception {
		userDao.modify(userDto);
	}

	@Override
	public void delete(String id) throws Exception {
		userDao.delete(id);
	}

	@Override
	public String findId(String email, String domain) throws Exception {
		return userDao.findId(email, domain);
	}

	@Override
	public String findPwd(String id, String email, String domain) throws Exception {
		return userDao.findPwd(id, email, domain);
	}
}
