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
import com.ssafy.trip.model.dao.TripDao;
import com.ssafy.trip.model.dao.TripDaoImpl;

public class TripServiceImpl implements TripService {

	private static TripService tripService = new TripServiceImpl();
	private TripDao tripDao;

	private TripServiceImpl() {
		tripDao = TripDaoImpl.getTripDao();
	}

	public static TripService getTripService() {
		return tripService;
	}

	@Override
	public List<TripDto> areaTripList(int areaCode, int sigunguCode, int contentTypeId) throws Exception {
		return tripDao.areaTripList(areaCode, sigunguCode, contentTypeId);
	}

	@Override
	public List<ThemeTripDto> getThemeTripList() throws Exception {
		return tripDao.getThemeTripList();
	}

	@Override
	public List<SigunguDto> getSigunguList(int areaCode) throws Exception {
		return tripDao.getSigunguList(areaCode);
	}

	@Override
	public List<AreaDto> getAreaList() throws Exception {
		return tripDao.getAreaList();
	}

	@Override
	public List<ContentTypeDto> getContentTypeList() throws Exception {
		return tripDao.getContentTypeList();
	}

	@Override
	public TotalThemeDto ThemeDetails(int idx) throws SQLException {
		return tripDao.ThemeDetails(idx);
	}

	@Override
	public List<TotalThemeDto> TotalThemeList() throws SQLException {
		return tripDao.TotalThemeList();
	}

	@Override
	public TotalThemeDto joinDB(String title) throws SQLException {
		return tripDao.joinDB(title);
	}

	@Override
	public List<HanokDto> getHanokList() throws Exception {
		return tripDao.getHanokList();
	}

	@Override
	public HanokDto HanokDetails(String zipcode) throws Exception {
		return tripDao.HanokDetails(zipcode);
	}

	@Override
	public HanokFacilityDto getHanokFacility(String zipcode) throws Exception {
		return tripDao.getHanokFacility(zipcode);
	}
}

