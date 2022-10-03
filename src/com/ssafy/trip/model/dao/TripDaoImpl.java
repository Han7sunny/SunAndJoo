package com.ssafy.trip.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.trip.model.AreaDto;
import com.ssafy.trip.model.ContentTypeDto;
import com.ssafy.trip.model.HanokDto;
import com.ssafy.trip.model.HanokFacilityDto;
import com.ssafy.trip.model.SigunguDto;
import com.ssafy.trip.model.ThemeTripDto;
import com.ssafy.trip.model.TotalThemeDto;
import com.ssafy.trip.model.TripDto;
import com.ssafy.util.DBUtil;

public class TripDaoImpl implements TripDao {

	private static TripDao tripDao = new TripDaoImpl();
	private DBUtil dbUtil;

	private TripDaoImpl() {
		dbUtil = DBUtil.getInstance();
	}

	public static TripDao getTripDao() {
		return tripDao;
	}

	@Override
	public List<SigunguDto> getSigunguList(int areaCode) throws SQLException {
		List<SigunguDto> sigunguList = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from sigungu_code \n");
			sql.append("where area_code = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, areaCode);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				SigunguDto sigunguDto = new SigunguDto();

				sigunguDto.setAreaCode(rs.getInt(1));
				sigunguDto.setSigunguCode(rs.getInt(2));
				sigunguDto.setSigunguName(rs.getString(3));

				sigunguList.add(sigunguDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return sigunguList;
	}

	@Override
	public List<TripDto> areaTripList(int areaCode, int sigunguCode, int contentTypeId) throws SQLException {
		List<TripDto> areaTripList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select title, content_type_id, addr1, tel, mapx, mapy \n");
			sql.append("from total_area \n");
			if (contentTypeId != 0) {
				sql.append("where area_code = ? and sigungu_code = ? and content_type_id = ? \n");
			}else {
				sql.append("where area_code = ? and sigungu_code = ? \n");
			}
			sql.append("order by readcount desc");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, areaCode);
			pstmt.setInt(2, sigunguCode);
			if(contentTypeId != 0) {
				pstmt.setInt(3, contentTypeId);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TripDto tripDto = new TripDto();

				tripDto.setTitle(rs.getString(1));
				tripDto.setContentTypeId(rs.getInt(2));
				tripDto.setAddr(rs.getString(3));
				tripDto.setTel(rs.getString(4));
				tripDto.setMapX(rs.getString(5));
				tripDto.setMapY(rs.getString(6));

				areaTripList.add(tripDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return areaTripList;
	}

	@Override
	public List<ThemeTripDto> getThemeTripList() throws SQLException {
		List<ThemeTripDto> themeTripList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select content_id, title, first_image, first_image2, readcount \n");
			sql.append("from total_area \n");
			sql.append("where content_type_id = 25 and first_image != \"\" \n");
			sql.append("order by readcount desc limit 16");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ThemeTripDto themeTripDto = new ThemeTripDto();

				themeTripDto.setContentId(rs.getInt(1));
				themeTripDto.setTitle(rs.getString(2));
				themeTripDto.setFirstImage(rs.getString(3));
				themeTripDto.setFirstImage2(rs.getString(4));
				themeTripDto.setReadCount(rs.getString(5));
				themeTripDto.setOverView(""); // 나중에

				themeTripList.add(themeTripDto);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return themeTripList;
	}

	@Override
	public List<AreaDto> getAreaList() throws SQLException {
		List<AreaDto> areaList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from area_code \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AreaDto areaDto = new AreaDto();
				areaDto.setAreaCode(rs.getInt(1));
				areaDto.setAreaName(rs.getString(2));
				areaList.add(areaDto);
			}
			return areaList;
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
	}

	@Override
	public List<ContentTypeDto> getContentTypeList() throws SQLException {
		List<ContentTypeDto> contentTypeList = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * \n");
			sql.append("from content_type_code \n");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ContentTypeDto contentTypeDto = new ContentTypeDto();
				contentTypeDto.setContentTypeId(rs.getInt(1));
				contentTypeDto.setContentTypeName(rs.getString(2));
				contentTypeList.add(contentTypeDto);
			}
			return contentTypeList;
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
	}

	@Override
	public List<TotalThemeDto> TotalThemeList() throws SQLException {
		List<TotalThemeDto> ThemeList = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select idx, title, total_distance, total_time \n");
			sql.append("from theme_info");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TotalThemeDto theme = new TotalThemeDto();
				theme.setIdx(Integer.parseInt(rs.getString("idx")));
				theme.setTitle(rs.getString("title"));
				theme.setDist(rs.getString("total_distance"));
				theme.setTime(rs.getString("total_time"));

				System.out.println(theme.toString());
				ThemeList.add(theme);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return ThemeList;
	}

	@Override
	public TotalThemeDto ThemeDetails(int idx) throws SQLException {
		TotalThemeDto theme = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from theme_info as theme left join (select * from total_area where content_type_id = 25) as total \n");
			sql.append("on theme.title = total.title \n");
			sql.append("where theme.idx  = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, idx);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				theme = new TotalThemeDto();
				theme.setIdx(rs.getInt("idx"));
				theme.setTitle(rs.getString("title"));
				theme.setLat(rs.getString("latitude"));
				theme.setLng(rs.getString("logitude"));
				theme.setOverview(rs.getString("overview"));
				theme.setCalendar(rs.getString("calendar"));
				theme.setType(rs.getString("type"));
				theme.setDist(rs.getString("total_distance"));
				theme.setTime(rs.getString("total_time"));
				theme.setDetails(rs.getString("details"));

				// from join table
				theme.setImg1(rs.getString("first_image"));
				theme.setImg2(rs.getString("first_image"));
				theme.setReadcount(rs.getString("readcount"));
				theme.setArea_code(rs.getString("area_code"));
				theme.setSigungu_code(rs.getString("sigungu_code"));
				
				theme.toString();
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return theme;
	}

	@Override
	public TotalThemeDto joinDB(String title) throws SQLException {

		TotalThemeDto theme = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();	
			sql.append("select * from theme_info as theme left join (select * from total_area where content_type_id = 25) as total \n");
			sql.append("on theme.title = total.title \n");
			sql.append("where theme.title = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, title);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				theme = new TotalThemeDto();
				theme.setIdx(rs.getInt("idx"));
				theme.setTitle(rs.getString("title"));
				theme.setLat(rs.getString("latitude"));
				theme.setLng(rs.getString("logitude"));
				theme.setOverview(rs.getString("overview"));
				theme.setCalendar(rs.getString("calendar"));
				theme.setType(rs.getString("type"));
				theme.setDist(rs.getString("total_distance"));
				theme.setTime(rs.getString("total_time"));
				theme.setDetails(rs.getString("details"));
				
				// from join table
				theme.setImg1(rs.getString("first_image"));
				theme.setImg2(rs.getString("first_image"));
				theme.setReadcount(rs.getString("readcount"));
				theme.setArea_code(rs.getString("area_code"));
				theme.setSigungu_code(rs.getString("sigungu_code"));
				
				System.out.println(theme.getImg1());
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return theme;
	
	}


	@Override
	public List<HanokDto> getHanokList() throws SQLException {
		List<HanokDto> HanokList = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from hanok");
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				HanokDto hanok = new HanokDto();
				hanok.setTitle(rs.getString("title"));
				hanok.setZipcode(rs.getString("zipcode"));
				hanok.setAddr(rs.getString("addr"));
				hanok.setAccept(rs.getString("accept"));
				hanok.setRoom(rs.getString("room"));
				hanok.setImg(rs.getString("img"));

				System.out.println(hanok.toString());
				HanokList.add(hanok);
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return HanokList;
	}

	@Override
	public HanokDto HanokDetails(String zipcode) throws SQLException {
		HanokDto hanok = new HanokDto();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from hanok");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hanok.setTitle(rs.getString("title"));
				hanok.setZipcode(rs.getString("zipcode"));
				hanok.setAddr(rs.getString("addr"));
				hanok.setTel(rs.getString("tel"));
				hanok.setLat(rs.getString("latitude"));
				hanok.setLng(rs.getString("longitude"));
				hanok.setOverview(rs.getString("overview"));
				hanok.setScale(rs.getString("scale"));
				hanok.setCheckin(rs.getString("checkin"));
				hanok.setCheckout(rs.getString("checkout"));
				hanok.setAccept(rs.getString("accept"));
				hanok.setRoom(rs.getString("room"));
				hanok.setRoom_type(rs.getString("room_type"));
				hanok.setPolicy(rs.getString("policy"));
				hanok.setImg(rs.getString("img"));

				System.out.println(hanok.toString());
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return hanok;
	}
	
	public HanokFacilityDto getHanokFacility(String zipcode) throws SQLException {
		HanokFacilityDto hanokFacility = new HanokFacilityDto();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select * from hanok_facility");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				hanokFacility.setZipcode(rs.getString("zipcode"));
				hanokFacility.setParking(rs.getString("parking"));
				hanokFacility.setCooking(rs.getString("cooking"));
				hanokFacility.setBooking(rs.getString("booking"));
				hanokFacility.setPage(rs.getString("bookpage"));
				hanokFacility.setPickup(rs.getString("pickup"));
				hanokFacility.setFood(rs.getString("food"));
				hanokFacility.setAmenity(rs.getString("amenity"));
				hanokFacility.setSeminar(rs.getString("seminar"));
				hanokFacility.setSports(rs.getString("sports"));
				hanokFacility.setSauna(rs.getString("sauna"));
				hanokFacility.setBeauty(rs.getString("beauty"));
				hanokFacility.setBbq(rs.getString("bbq"));
				hanokFacility.setCampfire(rs.getString("campfire"));
				hanokFacility.setBike(rs.getString("bike"));
				hanokFacility.setFitness(rs.getString("fitness"));
				hanokFacility.setPc(rs.getString("pc"));
				hanokFacility.setShower(rs.getString("shower"));
				hanokFacility.setDetails(rs.getString("details"));

				System.out.println(hanokFacility.toString());
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return hanokFacility;
	}
	
	

}