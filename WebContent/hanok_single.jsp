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
              <div class="feature-text my-auto">
                <h3 class="heading">규모 : ${hanok_single.scale}</h3>
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
          <div id="map" class="ms-3 mt-4 mb-5" style="width:700px;height:400px;"></div>
          <div class="feature-text text-center"> <h3 class="heading">${hanok_single.addr}</h3></div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h" onclick="location.href='${hanok_facility.page}'">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">홈페이지</h3>
                <p class="text-black-70">
                  <a href="${hanok_facility.page}" target="_blank">${hanok_facility.page}</a>
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
	        center: new kakao.maps.LatLng(${hanok_single.lat}, ${hanok_single.lng}), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		var imageSrc = 'https://cdn-icons-png.flaticon.com/512/2090/2090177.png', // 마커이미지의 주소입니다    
		    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		    markerPosition = new kakao.maps.LatLng(${hanok_single.lat}, ${hanok_single.lng}); // 마커가 표시될 위치입니다
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정 
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
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
