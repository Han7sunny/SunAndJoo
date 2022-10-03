<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

    <div
      class="hero page-inner overlay"
      style="background-image: url('${root}/assets/images/hanok.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">${hanok_single.title}</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="${root}/index.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="${root}/hanok_list.jsp">한옥 스테이</a></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <div class="section" data-aos="fade-up"
						data-aos-delay="300">
      <div class="container">
        <div class="row text-left mb-5">
          <div class="col-12">
            <h2 class="font-weight-bold heading text-primary mb-4">소개</h2>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              ${hanok_single.overview}
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0" data-aos="fade-up"
						data-aos-delay="400">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
            <div class="img-about dots">
              <img src="${hanok_single.img}" alt="Image" class="img-fluid" />
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">규모</h3>
                <p class="text-black-50">
                  ${hanok_single.scale}
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">체크인 : ${hanok_single.checkin}</h3>
                <h3 class="heading">체크아웃 : ${hanok_single.checkout}</h3>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">환불정책</h3>
                <p class="text-black-50">
                  ${hanok_single.policy}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0" data-aos="fade-up"
						data-aos-delay="500">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0">
          <div id="map" class="ms-3 mt-4 mb-5" style="width:500px;height:400px;"></div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h" onclick="location.href='${hanok_facility.page}'">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">홈페이지</h3>
                <p class="text-black-50">
                  ${hanok_facility.page}
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-person"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">예약 안내</h3>
                <p class="text-black-50">
                  ${hanok_facility.booking}
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-security"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">부대시설</h3>
                <p class="text-black-50">
                  ${hanok_facility.amenity}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=958886d2b3c6658678dbc5974c84172f"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
			center: new kakao.maps.LatLng(${hanok_sigle.lat}, ${hanok_sigle.lng}),
	        level: 4 // 지도의 확대 레벨
	    };
		
		var kakaoMap = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다
		var markerPosition  = new kakao.maps.LatLng(${hanok_sigle.lat}, ${hanok_sigle.lng});

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(kakaoMap);
	</script>
	
<%@ include file="/common/footer.jsp" %>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>
  </body>
</html>
