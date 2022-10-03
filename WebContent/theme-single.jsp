<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

    <div class="hero page-inner overlay" style="background-image: url('${root}/assets/images/bg-img.jpg')">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">${theme_details.title}</h1>

            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item">
                  <a href="${root}/theme-single.jsp">여행 테마</a>
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>

	<!-- 이미지 추가  -->
    <div class="section mb-5">
      <div class="container mb-5">
			<div class="row section-counter mt-5 mb-5">
				<div class="col-6" data-aos="fade-up"
					data-aos-delay="300">
					<div class="counter-wrap mb-5 mb-lg-0 text-center">
						<span class="number"><span class="text-primary">${theme_details.dist}</span></span>
						<span class="caption text-black-50">총 이동거리</span>
					</div>
				</div>
				<div class="col-6" data-aos="fade-up"
					data-aos-delay="400">
					<div class="counter-wrap mb-5 mb-lg-0 text-center">
						<span class="number"><span class="countup_string text-primary">${theme_details.time}</span></span>
						<span class="caption text-black-50">소요 시간</span>
					</div>
				</div>
			</div>
        <div class="row justify-content-between ms-3 mt-5 mb-5" data-aos="fade-up" data-aos-delay="400">
        </div>
        
        <div class="row justify-content-between mt-5" data-aos="fade-up" data-aos-delay="400">
          <div class="col-lg-5">
            <div id="map" class="ms-3 mt-4 mb-5" style="width:500px;height:400px;"></div>
            <div class="img-property-slide-wrap">
              <div class="img-property-slide">
				<c:if test="${theme.img1 ne null}">
                <img
                  src="${theme.img1}"
                  alt="Image"
                  class="img-fluid"
                />
				</c:if>
				<c:if test="${theme.img2 ne null}">
                <img
                  src="${theme.img2}"
                  alt="Image"
                  class="img-fluid"
                />
				</c:if>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50"></p>
            <br>
            
            <div data-aos="fade-up" data-aos-delay="300">
				<div class="box-feature mb-4">
		            <p class="text-black-50">[ 개요 ]</p>
		            <h3 class="text-black mb-3 font-weight-bold">${theme_details.overview}</h3></br>
				</div>
			</div>
            <br>
            <hr>
            <br>
            <c:forEach var="details" items="${details}">
            <div data-aos="fade-up" data-aos-delay="300">
				<div class="box-feature mb-4">
		            <h3 class="text-black mb-3 font-weight-bold">${details}</h3>
				</div>
			</div>
            
            </c:forEach>
            
        </div>
      </div>
    </div>

    <%@ include file="/common/footer.jsp" %>


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=958886d2b3c6658678dbc5974c84172f"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${theme_details.lat}, ${theme_details.lng}),
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options);
	</script>
	

    <script src="${root}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${root}/assets/js/tiny-slider.js"></script>
    <script src="${root}/assets/js/aos.js"></script>
    <script src="${root}/assets/js/navbar.js"></script>
    <script src="${root}/assets/js/counter.js"></script>
    <script src="${root}/assets/js/custom.js"></script>
  </body>
</html>
