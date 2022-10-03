package com.ssafy.trip.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.board.model.dto.BoardDto;
import com.ssafy.board.model.service.BoardService;
import com.ssafy.board.model.service.BoardServiceImpl;
import com.ssafy.trip.model.AreaDto;
import com.ssafy.trip.model.ContentTypeDto;
import com.ssafy.trip.model.SigunguDto;
import com.ssafy.trip.model.ThemeTripDto;
import com.ssafy.trip.model.TotalThemeDto;
import com.ssafy.trip.model.TripDto;
import com.ssafy.trip.model.service.TripService;
import com.ssafy.trip.model.service.TripServiceImpl;

@WebServlet("/main")
public class TripController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TripService tripService;
	private	BoardService boardService;

	public TripController() {
		tripService = TripServiceImpl.getTripService();
		boardService = BoardServiceImpl.getBoardService();
		// 서울 - 강남구 - 컨텐츠 선택 (default)

		// 여행 테마 소개 : 16개, contentTypeId=25

		// 여행 메이트
		// 여행 후기
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String action = req.getParameter("action");

		System.out.println("action === " + action);
		String path = "./index.jsp";
		switch (action) {
		case "start": // 초기화 화면 ( 서울 - 강남구 - 컨텐츠 선택)
			path = initTripData(req, resp);
			forward(req, resp, path);
			break;
		case "search": // Search 클릭 // /main?action=areaTrip
			path = search(req, resp);
			forward(req, resp, path);
			break;
		case "getSigunguList": // 지역 선택 (서울) -> 해당 시군구 목록
			path = getSigunguList(req, resp);
			forward(req, resp, path);
			break;
		case "themeTrip":
			path = getThemeTripList(req, resp);
			forward(req, resp, path);
			break;
		case "totalTheme":
			path = totalTheme(req, resp);
			forward(req, resp, path);
			break;
		case "themeView":
			path = themeView(req, resp);
			forward(req, resp, path);
			break;
		case "joinTheme":
			path = joinTheme(req, resp);
			forward(req, resp, path);
			break;
		default:
			resp.sendRedirect(path);
			break;
		}

	}

	private String joinTheme(HttpServletRequest req, HttpServletResponse resp) {
		try {
			TotalThemeDto theme = new TotalThemeDto();
			
			String title = req.getParameter("total_tb_title");
			
			theme = tripService.joinDB(title);
			req.setAttribute("theme", theme);
			String result = "/main?action=themeView&" + theme.getIdx();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

	private String themeView(HttpServletRequest req, HttpServletResponse resp) {
		int idx = Integer.parseInt(req.getParameter("idx"));
		System.out.println("조회하려는 글 번호 :  " + idx);
		try {
			TotalThemeDto theme = tripService.ThemeDetails(idx);
			req.setAttribute("theme_details", theme);
			
			System.out.println(theme.toString());
			
			String[] whole_details = theme.getDetails().split(":");
			
			
			for (int i = 0; i < whole_details.length; i++) {
				System.out.println(whole_details[i]);
			}
			
			req.setAttribute("details", whole_details);
			
//			
//			HashMap<String, String> map = new HashMap<>();
//			
//			for (int j = 0; j < whole_details.length - 1 ; j+=2) {
//				map.put(whole_details[j],whole_details[j+1]);				
//			}
//			
//			req.setAttribute("details", map);
//			

			theme = tripService.joinDB(theme.getTitle());
			req.setAttribute("theme", theme);
			
			return "/theme-single.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "/error/error.jsp";
		}
	}

	private String totalTheme(HttpServletRequest req, HttpServletResponse resp) {
		List<TotalThemeDto> list = new ArrayList<>();

		try {
			list = tripService.TotalThemeList();
			req.setAttribute("total_theme",list);
			return "/theme-total.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String initTripData(HttpServletRequest req, HttpServletResponse resp) {
		try {
			List<AreaDto> areaList = tripService.getAreaList();
			List<SigunguDto> sigunguList = tripService.getSigunguList(1); // 서울의 군구
			List<ContentTypeDto> contentTypeList = tripService.getContentTypeList();
			List<BoardDto> mateList = boardService.list("2").subList(0, 4);
			List<BoardDto> reviewList = boardService.list("1").subList(0, 16);
			HttpSession session = req.getSession();
			session.setAttribute("areaList", areaList);
			req.setAttribute("sigunguList", sigunguList);
			session.setAttribute("contentTypeList", contentTypeList);
			req.setAttribute("mateList", mateList);
			req.setAttribute("reviewList", reviewList);
			return "./initDataList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String getSigunguList(HttpServletRequest req, HttpServletResponse resp) {
		int areaCode = Integer.parseInt(req.getParameter("areaCode"));

		try {
			List<SigunguDto> sigunguList = tripService.getSigunguList(areaCode);
			req.setAttribute("sigunguList", sigunguList);
			return "./sigungulist.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}

	private String search(HttpServletRequest req, HttpServletResponse resp) { // 지역코드, 시군구코드, 컨텐츠 선택 시 데이터 긁어오기
		
		int areaCode = Integer.parseInt(req.getParameter("areaCode"));
		int sigunguCode = Integer.parseInt(req.getParameter("sigunguCode"));
		int contentTypeId = Integer.parseInt(req.getParameter("contentTypeId"));

		try {
			List<TripDto> areaTripList = tripService.areaTripList(areaCode, sigunguCode, contentTypeId);
			req.setAttribute("areaTripList", areaTripList);
			return "./searchList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			// error 페이지
			return "./error.jsp";
		}
	}

	private String getThemeTripList(HttpServletRequest req, HttpServletResponse resp) {
		try {
			//List<TotalThemeDto> themeTripList = tripService.TotalThemeList("main");
			//List<ThemeTripDto> themeTripList = tripService.getThemeTripList();
			List<TotalThemeDto> themeTripList = tripService.getThemeTripList();
			for (int i = 0; i < 16; i++) {
				System.out.println(themeTripList.get(i).getIdx() +", readcount" + themeTripList.get(i).getReadcount() +", title " + themeTripList.get(i).getTitle());
			}
System.out.println(themeTripList.size());
			req.setAttribute("themeTripList", themeTripList);
			return "./themeTripList.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			return "./error.jsp";
		}
	}
	
	
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doGet(req, resp);
	}

	private void forward(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher(path);
		dispatcher.forward(req, resp);
	}

}