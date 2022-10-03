package com.ssafy.trip.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.trip.model.AreaDto;
import com.ssafy.trip.model.ContentTypeDto;
import com.ssafy.trip.model.SigunguDto;
import com.ssafy.trip.model.ThemeTripDto;
import com.ssafy.trip.model.TotalThemeDto;
import com.ssafy.trip.model.TripDto;

public interface TripDao {

	List<AreaDto> getAreaList() throws SQLException; // 지역 코드 목록

	List<SigunguDto> getSigunguList(int areaCode) throws SQLException; // 지역 코드에 해당하는 시군구 정보

	List<ContentTypeDto> getContentTypeList() throws SQLException; // 컨텐츠 타입 목록

	List<TripDto> areaTripList(int areaCode, int sigunguCode, int contentTypeId) throws SQLException; // 지역,
																										// 시군구,
																										// 컨텐츠
																										// 선택 시
																										// 지역 정보
																										// 가져오기

	List<TotalThemeDto> getThemeTripList() throws SQLException; // 여행 테마 소개

	List<TotalThemeDto> TotalThemeList() throws SQLException;

	TotalThemeDto ThemeDetails(int idx) throws SQLException;

	TotalThemeDto joinDB(String title) throws SQLException;
}
