package com.ssafy.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.util.DBUtil;

public class BoardDaoImpl implements BoardDao {

	private static BoardDao boardDao = new BoardDaoImpl();
	private DBUtil dbUtil;

	private BoardDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static BoardDao getBoardDao() {
		return boardDao;
	}

	@Override
	public void regist(BoardDto boardDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		System.out.println(boardDto.toString());

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"insert into board (board_title, board_type_id, user_id, location_sido, location_gungu, content, start_date, end_date, img1, img2, regist_time) \n");
			sql.append("values (?,?,?,?,?,?,?,?,?,?,now())");

			pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, boardDto.getBoard_title());
			pstmt.setString(2, boardDto.getBoard_type_id());
			pstmt.setString(3, boardDto.getUser_id());
			pstmt.setInt(4, boardDto.getLocation_sido());
			pstmt.setInt(5, boardDto.getLocation_gungu());
			pstmt.setString(6, boardDto.getContent());
			pstmt.setString(7, boardDto.getStart_date());
			pstmt.setString(8, boardDto.getEnd_date());
			pstmt.setString(9, boardDto.getImg1());
			pstmt.setString(10, boardDto.getImg2());

			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public List<BoardDto> list(String content_type_id) throws SQLException {
		List<BoardDto> list = new ArrayList<>();
		BoardDto boardDto;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"select board_id, board_title, board_type_id, user_id, content, score, readcount, regist_time from board \n");

			switch (content_type_id) {
			case "1":
			case "3":
				sql.append("where board_type_id = '여행후기' or board_type_id = '여행메이트후기'\n");
				break;
			case "2":
				sql.append("where board_type_id = '여행메이트' \n");
				break;
			case "4":
				sql.append("where board_type_id = '공지사항' \n");
				break;
			}
			sql.append("order by readcount desc");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBoard_id(rs.getInt("board_id"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setUser_id(rs.getString("user_id"));
				boardDto.setBoard_type_id(rs.getString("board_type_id"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setScore(rs.getInt("score"));
				boardDto.setReadcount(rs.getInt("readcount"));
				boardDto.setRegist_time(rs.getString("regist_time"));
				list.add(boardDto);
			}

		} finally {
			dbUtil.close(rs, pstmt, conn); // rs닫기
		}
		return list;
	}

	@Override
	public List<BoardDto> topReviewList(String content_type_id) throws SQLException {
		List<BoardDto> Reviewlist = new ArrayList<>();
		BoardDto boardDto;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"select board_id, board_title, user_id, content, DATE_FORMAT(regist_time, '%Y-%m-%d') as regist_time from board \n");
			sql.append("where board_type_id = '여행후기' or board_type_id = '여행메이트후기' \n");
			sql.append("order by readcount desc limit 4");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBoard_id(rs.getInt("board_id"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setUser_id(rs.getString("user_id"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setRegist_time(rs.getString("regist_time"));
				Reviewlist.add(boardDto);
			}

		} finally {
			dbUtil.close(rs, pstmt, conn); // rs닫기
		}
		return Reviewlist;
	}

	@Override
	public List<BoardDto> topMateList(String content_type_id) throws SQLException {
		List<BoardDto> MateList = new ArrayList<>();
		BoardDto boardDto;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(
					"select board_id, board_title, user_id, content, DATE_FORMAT(regist_time, '%Y-%m-%d') as regist_time from board \n");
			sql.append("where board_type_id = '여행메이트' \n");
			sql.append("order by readcount desc limit 4");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBoard_id(rs.getInt("board_id"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setUser_id(rs.getString("user_id"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setRegist_time(rs.getString("regist_time"));
				MateList.add(boardDto);
			}

		} finally {
			dbUtil.close(rs, pstmt, conn); // rs닫기
		}
		return MateList;
	}

	@Override
	public BoardDto view(int board_id) throws SQLException {
		BoardDto boardDto = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from board \n");
			sql.append("where board_id  = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardDto = new BoardDto();
				boardDto.setBoard_id(rs.getInt("board_id"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_type_id(rs.getString("board_type_id"));
				boardDto.setUser_id(rs.getString("user_id"));
				boardDto.setLocation_sido(rs.getInt("location_sido"));
				boardDto.setLocation_gungu(rs.getInt("location_gungu"));
				boardDto.setContent(rs.getString("content"));
				boardDto.setStart_date(rs.getString("start_date"));
				boardDto.setEnd_date(rs.getString("end_date"));
				boardDto.setImg1(rs.getString("img1"));
				boardDto.setImg2(rs.getString("img2"));
				boardDto.setReadcount(rs.getInt("readcount"));
				boardDto.setRegist_time(rs.getString("regist_time"));
				boardDto.setScore(rs.getInt("score"));
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return boardDto;
	}

	@Override
	public void modify(BoardDto boardDto) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("모디파이 dao");
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("update board \n");
			sql.append("set board_title = ?, content = ?, location_sido = ?, location_gungu = ?, regist_time = now() \n");
			sql.append("where board_id = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, boardDto.getBoard_title());
			pstmt.setString(2, boardDto.getContent());
			pstmt.setInt(3, boardDto.getLocation_sido());
			pstmt.setInt(4, boardDto.getLocation_gungu());
			pstmt.setInt(5, boardDto.getBoard_id());
			pstmt.executeUpdate();
			//System.out.println("결과는" + pstmt.executeUpdate());
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public void delete(int board_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from board \n");
			sql.append("where board_id = ? \n");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, board_id);

			pstmt.executeUpdate();
		} finally {
			dbUtil.close(pstmt, conn);
		}
	}

	@Override
	public List<BoardDto> getBoardListById(String id, String board_type_id) throws SQLException {
		List<BoardDto> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from board \n");
			if(board_type_id.equals("공지사항"))
				sql.append("where user_id = ? and board_type_id = '공지사항' \n");
			else
				sql.append("where user_id = ? and board_type_id != '공지사항' \n");
			sql.append("order by regist_time desc");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDto boardDto = new BoardDto();
				boardDto.setBoard_id(rs.getInt("board_id"));
				boardDto.setBoard_title(rs.getString("board_title"));
				boardDto.setBoard_type_id(rs.getString("board_type_id"));
				boardDto.setUser_id(rs.getString("user_id"));
				boardDto.setReadcount(rs.getInt("readcount"));
				boardDto.setRegist_time(rs.getString("regist_time"));

				list.add(boardDto);
			}

		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return list;
	}

	@Override
	public String[] getLocationName(BoardDto boardDto) throws SQLException {
		String[] Location = new String[2];
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select area_name, sigungu_name from area_code as a right join sigungu_code as s \n");
			sql.append("on a.area_code = s.area_code \n");
			sql.append("where a.area_code = ? and s.sigungu_code = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardDto.getLocation_sido());
			pstmt.setInt(2, boardDto.getLocation_gungu());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				Location[0] = rs.getString("area_name");
				Location[1] = rs.getString("sigungu_name");
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return Location;
	}

}
