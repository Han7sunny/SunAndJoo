package com.ssafy.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.dto.ReplyDto;
import com.ssafy.util.DBUtil;

public class ReplyDaoImpl implements ReplyDao {

	private static ReplyDao replyDao = new ReplyDaoImpl();
	private DBUtil dbUtil;

	private ReplyDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static ReplyDao getReplyDao() {
		return replyDao;
	}

	@Override
	public void regist(ReplyDto replyDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		System.out.println(replyDto.toString());

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into reply (board_id, user_id, reply_content, regist_time) \n");
			sql.append("values (?,?,?,now())");


			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, replyDto.getBoard_id());
			pstmt.setString(2, replyDto.getUser_id());
			pstmt.setString(3, replyDto.getReply_content());
			pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public List<ReplyDto> list(int board_id) throws SQLException {
		List<ReplyDto> list = new ArrayList<>();
		ReplyDto replyDto;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
	        conn = dbUtil.getConnection();
	        StringBuilder sql = new StringBuilder();
	        
	        sql.append("select * from reply where board_id = ?");
	        pstmt = conn.prepareStatement(sql.toString());
	        pstmt.setInt(1,board_id);
	        rs = pstmt.executeQuery();
      
	        while(rs.next()) {
	        	replyDto = new ReplyDto();
	        	replyDto.setIdx(rs.getInt("idx"));
	        	replyDto.setBoard_id(rs.getInt("board_id"));
	        	replyDto.setUser_id(rs.getString("user_id"));
	        	replyDto.setReply_content(rs.getString("reply_content"));
	        	replyDto.setRegist_time(rs.getString("regist_time"));
	        	list.add(replyDto);
	        }
	    } finally {
	        dbUtil.close(rs, pstmt, conn);
	    }
	    return list;
	}

	@Override
	public List<ReplyDto> list_by_id(String user_id) throws SQLException {
		List<ReplyDto> list = new ArrayList<>();
		ReplyDto replyDto;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
	        conn = dbUtil.getConnection();
	        StringBuilder sql = new StringBuilder();
	        
	        sql.append("select * from reply where user_id = ?");
	        pstmt = conn.prepareStatement(sql.toString());
	        pstmt.setString(1,user_id);
	        rs = pstmt.executeQuery();
      
	        while(rs.next()) {
	        	replyDto = new ReplyDto();
	        	replyDto.setIdx(rs.getInt("idx"));
	        	replyDto.setBoard_id(rs.getInt("board_id"));
	        	replyDto.setUser_id(rs.getString("user_id"));
	        	replyDto.setReply_content(rs.getString("reply_content"));
	        	replyDto.setRegist_time(rs.getString("regist_time"));
	        	list.add(replyDto);
	        }
	    } finally {
	        dbUtil.close(rs, pstmt, conn);
	    }
	    return list;
	}


	@Override
	public void modify(ReplyDto replyDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update reply \n");
			sql.append("set reply_content = ?, regist_time = now() \n");
			sql.append("where idx = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, replyDto.getReply_content());
			pstmt.setInt(2, replyDto.getIdx());

			pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
	}

	@Override
	public void delete(int idx) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from reply \n");
			sql.append("where idx = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, idx);

			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}
}
