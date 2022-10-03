package com.ssafy.user.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ssafy.user.model.UserDto;
import com.ssafy.util.DBUtil;

public class UserDaoImpl implements UserDao {

	private static UserDao userDao = new UserDaoImpl();
	private DBUtil dbUtil;

	private UserDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static UserDao getUserDao() {
		return userDao;
	}

	@Override
	public UserDto loginUser(String id, String pwd) throws SQLException {
		UserDto userDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from user \n");
			sql.append("where user_id = ? and user_pwd = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto();
				userDto.setId(rs.getString(1));
				userDto.setPwd(rs.getString(2));
				userDto.setName(rs.getString(3));
				userDto.setEmailId(rs.getString(4));
				userDto.setEmailDomain(rs.getString(5));
				userDto.setAdminAuthor(rs.getInt(6) == 1 ? true : false);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return userDto;
	}

	@Override
	public void joinUser(UserDto userDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into user (user_id, user_name, user_pwd, user_email_id, user_email_domain) \n");
			sql.append("values (?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			int idx = 0;
			pstmt.setString(++idx, userDto.getId());
			pstmt.setString(++idx, userDto.getName());
			pstmt.setString(++idx, userDto.getPwd());
			pstmt.setString(++idx, userDto.getEmailId());
			pstmt.setString(++idx, userDto.getEmailDomain());

			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}

	}

	@Override
	public int nameCheck(String name) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select count(user_name) \n");
			sql.append("from user \n");
			sql.append("where user_name = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}
	
	@Override
	public int idCheck(String id) throws SQLException {
		int cnt = 1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select count(user_id) \n");
			sql.append("from user \n");
			sql.append("where user_id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return cnt;
	}
	@Override
	public void modify(UserDto userDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		System.out.println(userDto.toString());
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update user set user_email_id = ?, user_email_domain = ? ");
			sql.append("where user_id = ?");
			
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getEmailId());
			pstmt.setString(2, userDto.getEmailDomain());
			pstmt.setString(3, userDto.getId());
			pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
	}

	@Override
	public void delete(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from user \n");
			sql.append("where user_id = ?");
			
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			int cnt = pstmt.executeUpdate();
			System.out.println(cnt+ " sql결과");
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
		
	}

	@Override
	public String findId(String email, String domain) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_id = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select user_id from user \n");
			sql.append("where user_email_id = ? and user_email_domain = ?");	
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, domain);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				user_id = rs.getString(1);
			System.out.println("id : "+user_id);
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return user_id;
		
	}

	@Override
	public String findPwd(String id, String email, String domain) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_pwd = null;
		
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select user_pwd from user \n");
			sql.append("where user_id = ? and user_email_id = ? and user_email_domain = ?");	
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			pstmt.setString(3, domain);
			rs = pstmt.executeQuery();
			
			if(rs.next())
					user_pwd = rs.getString(1);
			System.out.println("pwd 찾음 " + user_pwd);
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return user_pwd;
	}
	

}
