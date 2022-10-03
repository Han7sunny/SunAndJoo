package com.ssafy.trip.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.trip.model.AreaDto;
import com.ssafy.trip.model.ContentTypeDto;
import com.ssafy.trip.model.HanokDto;
import com.ssafy.trip.model.HanokFacilityDto;
import com.ssafy.trip.model.SigunguDto;
import com.ssafy.trip.model.ThemeTripDto;
import com.ssafy.trip.model.TotalThemeDto;
import com.ssafy.trip.model.TripDto;

public interface TripService {

	List<AreaDto> getAreaList() throws Exception; // 지역 코드 목록

	List<SigunguDto> getSigunguList(int areaCode) throws Exception; // 지역 코드에 해당하는 시군구 정보

	List<ContentTypeDto> getContentTypeList() throws Exception; // 콘텐츠 타입 목록

	List<TripDto> areaTripList(int areaCode, int sigunguCode, int contentTypeId) throws Exception; // 지역, 시군구,
																									// 컨텐츠 선택 시
																									// 지역 정보
																									// 가져오기

	List<ThemeTripDto> getThemeTripList() throws Exception; // 여행 테마 소개

	TotalThemeDto ThemeDetails(int idx) throws Exception;

	List<TotalThemeDto> TotalThemeList()  throws Exception;

	TotalThemeDto joinDB(String title) throws Exception;
	
	
	List<HanokDto> getHanokList() throws Exception;
	
	HanokDto HanokDetails(String zipcode) throws Exception;
	
	HanokFacilityDto getHanokFacility(String zipcode) throws Exception;
}
