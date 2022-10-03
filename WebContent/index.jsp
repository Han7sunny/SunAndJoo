<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<!-- kakao map -->
<style>
.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 350px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: "Malgun Gothic", "맑은 고딕", sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

/* 목록 지도 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: "Malgun Gothic", dotum, "돋움", sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5f5f5f;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/local/${root}/assets/images/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	/* margin: 10px 10px 10px 10px; */
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>

<!-- 메인 화면 start -->
<div class="hero">
	<!-- 배경 이미지   :  전환되는 효과 -->
	<div class="hero-slide">
		<div class="img overlay"
			style="background-image: url('${root}/assets/images/seoul.jpg')"></div>
		<div class="img overlay"
			style="background-image: url('${root}/assets/images/jeju.png')"></div>
		<div class="img overlay"
			style="background-image: url('${root}/assets/images/busan.png')"></div>
	</div>

	<!-- 메인 타이틀 -->
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center">
				<h1 class="heading" data-aos="fade-up">써니앤쥬와 함께 여행을 준비하세요</h1>

				<!-- 마칸 Search Start -->
				<div class="container-fluid mb-5 wow fadeIn" data-aos="fade-up"
					data-wow-delay="0.1s" style="padding: 35px">
					<div class="container">
						<div class="row g-2">
							<div class="col-md-10">
								<div class="row g-2">
									<div class="area col-md-4">
										<!-- 지역 -->
									</div>
									<div class="sigungu col-md-4">
										<!-- 시군구 -->
									</div>
									<div class="contentType col-md-4">
										<!-- 컨텐츠 -->
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<button class="search btn border-0 w-100 py-3 btn-4"
									id="search-btn">Search</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 마칸 Search Start -->
			</div>
		</div>
	</div>
</div>
<!-- 메인 화면 end -->

<!-- 카카오 맵 start -->
<div style="height: 100px" id="map-div"></div>
<div class="container">
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden"></div>
		<div id="menu_wrap" class="bg_white">
			<!-- <hr /> -->
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<div class="container alert alert-warning text-center" role="alert"
		id="null-alert">죄송합니다. 아직 준비되지 않은 여행정보입니다.</div>
</div>
<!-- 카카오 맵 end -->

<!-- 여행 테마 소개 start -->
<div class="section">
	<div class="container">
		<div class="row mt-5 mb-5 align-items-center">
			<div class="col-lg-6">
				<h2 class="font-weight-bold text-primary heading">여행 테마 소개</h2>
			</div>
			<div class="col-lg-6 text-lg-end">
				<p>
					<a href="${root}/main?action=totalTheme" class="learn-more">더
						많은 여행 테마</a>
				</p>
			</div>
			<div class="row mt-5">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
							<div class="property-item"></div>
							<div class="property-item"></div>
							<div class="property-item"></div>
							<div class="property-item"></div>
						</div>

						<div id="property-nav" class="controls" tabindex="0"
							aria-label="Carousel Navigation">
							<span class="prev" data-controls="prev" aria-controls="property"
								tabindex="-1">Prev</span> <span class="next"
								data-controls="next" aria-controls="property" tabindex="-1">Next</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 여행 테마 소개 end -->



	<!-- 여행 메이트 start -->
	<div class="container mb-5">
		<div class="col-lg-6">
			<h2 class="font-weight-bold text-primary heading mt-5 mb-5">여행
				메이트 찾기</h2>
		</div>
		<section class="features-1">
			<div class="container">
				<div class="mateDiv row">
					<!-- 여행 메이트 모집 글  -->
				</div>
			</div>
		</section>
		<!-- 여행 메이트 end -->

		<!-- 여행 후기 start -->

		<div class="section sec-testimonials">
			<div class="container">
				<div class="row mt-5 mb-5 align-items-center">
					<div class="col-md-6">
						<h2
							class="font-weight-bold heading text-primary mt-5 mb-4 mb-md-0">여행
							후기</h2>
					</div>
					<div class="col-md-6 text-md-end">
						<div id="testimonial-nav">
							<span class="prev" data-controls="prev">Prev</span> <span
								class="next" data-controls="next">Next</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-4"></div>
				</div>

				<div class="testimonial-slider-wrap">
					<div class="reviewDiv testimonial-slider">
						<!-- 여행 후기 글 -->

						<div class="item" onmouseover="this.style.cursor='pointer'">
							<div class="testimonial">
								<img src="${root}/assets/images/default-profile.png" alt="Image"
									class="img-fluid rounded-circle w-25 mb-4" />
							</div>
						</div>

						<div class="item" onmouseover="this.style.cursor='pointer'">
							<div class="testimonial">
								<img src="${root}/assets/images/default-profile.png" alt="Image"
									class="img-fluid rounded-circle w-25 mb-4" />
							</div>
						</div>

						<div class="item" onmouseover="this.style.cursor='pointer'">
							<div class="testimonial">
								<img src="${root}/assets/images/default-profile.png" alt="Image"
									class="img-fluid rounded-circle w-25 mb-4" />
							</div>
						</div>

						<div class="item" onmouseover="this.style.cursor='pointer'">
							<div class="testimonial">
								<img src="${root}/assets/images/default-profile.png" alt="Image"
									class="img-fluid rounded-circle w-25 mb-4" />
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


		<!-- 여행 후기 end -->

		<!-- 한옥 start -->
		<div class="section section-4 bg-light">
			<div class="container">
				<div class="row justify-content-center text-center mb-5">
					<div class="col-lg-5">
						<h2 class="font-weight-bold heading text-primary mb-4">
							한국에서만<br /> 경험할 수 있는
						</h2>
						<p class="text-black-50">
							한옥(韓屋)이라는 말은 우리 땅에 들어온 서구 스타일의 집,<br /> 즉 양옥(洋屋)에 대비되는 의미로
							시작되었습니다. <br /> 문화강국의 국격(國格)을 보여주는 한류(韓流)의 주역으로 삼으면서 <br /> 한국을
							대표하는 건축(K-Architecture)이 되어 전 세계에 소개되고 있습니다.
						</p>
					</div>
				</div>
				<div class="row justify-content-between mb-5">
					<div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
						<div class="img-about dots">
							<img src="${root}/assets/images/hanok.jpg" alt="Image"
								class="img-fluid" />
						</div>
					</div>
					<div class="col-lg-4">
						<div class="d-flex feature-h">
							<span class="wrap-icon me-3"> <span class="icon-home2"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading">자연친화적 건축</h3>
								<p class="text-black-50">한옥은 나무와 돌, 흙 등 우리 주위 어디에서나 손쉽게 구할 수
									있는 재료로 만든다는 점에서 자연친화적입니다.</p>
							</div>
						</div>

						<div class="d-flex feature-h">
							<span class="wrap-icon me-3"> <span class="icon-person"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading">인간 친화성</h3>
								<p class="text-black-50">건축 용어로 휴먼 스케일이라 하는 인간 친화성은 공간과 인간의
									상호교감 정도를 의미하는데 한옥에는 심리적 안정을 갖게 하는 인간 친화성이 있습니다.</p>
							</div>
						</div>

						<div class="d-flex feature-h">
							<span class="wrap-icon me-3"> <span class="icon-security"></span>
							</span>
							<div class="feature-text">
								<h3 class="heading">현대적 재해석</h3>
								<p class="text-black-50">현대식 공동주택과 같이 냉·난방 등 에너지관리, 보안, 유지관리
									등 현대 생활에 필요한 주택 주요 기능을 갖추고 있습니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="row section-counter mt-5">
					<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
						data-aos-delay="300">
						<div class="counter-wrap mb-5 mb-lg-0 text-center">
							<span class="number"><span class="countup text-primary">1666</span></span>
							<span class="caption text-black-50">전국 한옥체험업 개수</span>
						</div>
					</div>
					<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
						data-aos-delay="400">
						<div class="counter-wrap mb-5 mb-lg-0 text-center">
							<span class="number"><span class="countup text-primary">735</span></span>
							<span class="caption text-black-50">전주한옥마을 한옥 동수</span>
						</div>
					</div>
					<div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
						data-aos-delay="500">
						<div class="counter-wrap mb-5 mb-lg-0 text-center">
							<span class="number"><span class="countup text-primary">11080572</span></span>
							<span class="caption text-black-50">연간 평균 한옥 마을 방문 관광객</span>
						</div>
					</div>
					<div class="col-6 col-sm-6 col-lg-3" data-aos="fade-up"
						data-aos-delay="600">
						<div class="m-4 text-center">
							<a href="${root}/hanok_single.jsp" class="learn-more">더 많은 한옥
								보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 한옥 end -->

		<div class="section">
			<div class="row justify-content-center footer-cta" data-aos="fade-up">
				<div class="col-lg-7 mx-auto text-center">
					<h2 class="mb-4">EnjoyTrip에서 당신의 다음 여행지를 선택하세요</h2>
					<p>
						<button class="btn btn-2 text-white py-3 px-4" id="searchMore">더
							많은 여행지 검색하기</button>
					</p>
				</div>
				<!-- /.col-lg-7 -->
			</div>
			<!-- /.row -->
		</div>

		<%@ include file="/common/footer.jsp"%>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c69fd4c558034e826ba1e7c22d02e52"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3c69fd4c558034e826ba1e7c22d02e52&libraries=services"></script>
		<script>
      function signUpCheck() {
        let password = document.querySelector("#user-pwd").value;
        let passwordCheck = document.querySelector("#user-pwd-check").value;
        if (password == passwordCheck) {
          form.submit();
          return true;
        } else {
          alert("비밀번호가 일치하지 않습니다.");
          return false;
        }
      }
    </script>
		<script>

		function initSigunguList() {
	    	  let sigunguOptions = document.querySelector(".sigungu>select");
	    	  document.querySelector(".sigungu").removeChild(sigunguOptions);
	    }

    fetch("${root}/main?action=start").then(response => response.json()).then(function (data) {

    	  let areaList = document.querySelector(".area"); // select append
    	  let select = document.createElement("select");
    	  select.setAttribute("class", "form-select border-0 py-3 text-center");

    	  data.areaList.forEach((area) => {
    	    // options
    	    let option = document.createElement("option");
    	    option.setAttribute("value", area.area_code);
    	    if (area.area_code == 1) {
    	      option.setAttribute("selected", true);
    	    }
    	    option.appendChild(document.createTextNode(area.area_name)); // 서울
    	    select.appendChild(option);
    	  });

    	  select.addEventListener("change", function () {
    	    initSigunguList(); // 기존 시군구 select 삭제
    	    let selectedAreaNum = select[select.selectedIndex].value;

    	    fetch("${root}/main?action=getSigunguList&areaCode="+selectedAreaNum)
    	      .then((response) => response.json())
    	      .then((data) => makeSigunguList(data)); // 시군구
    	  });

    	  areaList.appendChild(select); // options 다 들어간 select 넣기

    	  makeSigunguList(data); // 군구

    	  let contentTypeList = document.querySelector(".contentType");
    	  let selectC = document.createElement("select");
    	  selectC.setAttribute("class", "form-select border-0 py-3 text-center");
    	  let option1 = document.createElement("option");
  	      option1.setAttribute("value", "0");
  	    option1.appendChild(document.createTextNode("컨텐츠 선택"));
	      option1.setAttribute("selected", true);
	    selectC.appendChild(option1);

    	  data.contentTypeList.forEach((contentType) => {
    	    let option = document.createElement("option");
    	    option.setAttribute("value", contentType.content_type_id);
    	    option.appendChild(document.createTextNode(contentType.content_type_name));
    	    selectC.appendChild(option);
    	  });

    	  contentTypeList.appendChild(selectC);

    	   // 지도에 띄우기 (초기화 화면)
     	  let url = "${root}/main?action=search&contentTypeId=0&areaCode=1&sigunguCode=1";
    	   fetch(url)
   	    .then((response) => response.json())
   	    .then(function (data) {
   	      kakaoMap(data.areaTripList);
   	    });


    	    // 여행 메이트

    	    let matelist = ``;
    	    let delayCnt = 300;
    	    data.mateList.forEach((mate) => {

    	    	matelist += `
    	    	<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay=`+ delayCnt + `>
				<div class="box-feature">
				<span class="col mb-4 d-block"><img src="${root}/assets/images/Mate_icon.png" style="width:30%"/></span>
				<h3 class="mb-3">` + `\${mate.board_title}` + `</h3><p>` + `\${mate.content}` + `</p><p><a href="${root}/main_community?act=view&board_id=`
				 +`\${mate.board_id}` + `" class="learn-more">자세히 보기</a></p></div></div>`;

    	    	delayCnt += 100;
    	  });
    	   document.querySelector(".mateDiv").innerHTML = matelist;


    	    // 여행 후기

			let ItemDiv = document.querySelectorAll(".item");
			let TestimonialDiv = document.querySelectorAll(".testimonial");
	        let idx = 0;
			data.reviewList.forEach((review) => {
    	    	ItemDiv[idx].setAttribute("onclick","location.href='${root}/main_community?act=view&board_id="+review.board_id+"'");
				
    	    	let div = document.createElement("div");
  	          div.setAttribute("class", "rate");
				for(var i = 0; i < review.score; i++){
					let span = document.createElement("span");
		  	          span.setAttribute("class", "icon-star text-warning");
		  	          div.appendChild(span);
				}
    	    	
    	    	let h3 = document.createElement("h3");
    	          h3.setAttribute("class", "h5 text-primary mt-2 mb-4");
    	          h3.appendChild(document.createTextNode(review.user_id));

      	    	let blockquote = document.createElement("blockquote");
      	    	let pInBlock = document.createElement("p");
      	    	pInBlock.appendChild(document.createTextNode("\""+review.board_title+"\""));
      	    	blockquote.appendChild(pInBlock);

      	    	let p = document.createElement("p");
  	          p.setAttribute("class", "text-black-50");
    	    	p.appendChild(document.createTextNode(review.regist_time));

    	    	TestimonialDiv[idx].appendChild(div);
    	    	TestimonialDiv[idx].appendChild(h3);
    	    	TestimonialDiv[idx].appendChild(blockquote);
    	    	TestimonialDiv[idx].appendChild(p);

				idx++;
    	  });

    	});

    function makeSigunguList(data) {
    	let sigunguList = document.querySelector(".sigungu");
    	  let select = document.createElement("select");
    	  select.setAttribute("class", "form-select border-0 py-3 text-center");
    	  data.sigunguList.forEach((sigungu) => {
    	    let option = document.createElement("option");
    	    option.setAttribute("value", sigungu.sigungu_code);
    	    option.appendChild(document.createTextNode(sigungu.sigungu_name));
    	    select.appendChild(option);
    	  });
    	  sigunguList.appendChild(select);

    	}

    document.querySelector(".search").addEventListener("click", function () {
    	  let area = document.querySelector(".area>select");
    	  let areaNum = area.options[area.selectedIndex].value;

    	  let sigungu = document.querySelector(".sigungu>select");
    	  let sigunguNum = sigungu.options[sigungu.selectedIndex].value;

    	  let contentType = document.querySelector(".contentType>select");
    	  let contentTypeId = contentType.options[contentType.selectedIndex].value;

    	  let url = "${root}/main?action=search&contentTypeId=" + contentTypeId + "&areaCode=" + areaNum + "&sigunguCode=" + sigunguNum;

    	  fetch(url)
    	    .then((response) => response.json())
    	    .then(function (data) {
    	      kakaoMap(data.areaTripList);
    	    });

    	  var scrollTo = document.querySelector("#map-div"); // 지도를 표시할 div
    	  window.scrollBy({ top: scrollTo.getBoundingClientRect().top, behavior: "smooth" });
    	});

    let ThemeUrl = "${root}/main?action=themeTrip";
    fetch(ThemeUrl)
      .then((response) => response.json())
      .then(function (data) {
        let propertyItemDiv = document.querySelectorAll(".property-item");
        let idx = 0;
        data.themeTripList.forEach((theme) => {

          let a = document.createElement("a");
          a.setAttribute("class", "img");
          a.setAttribute("href", "${root}/main?action=themeView&idx="+theme.content_id);

          let image = document.createElement("img");
          image.setAttribute("src", theme.firstImage);
          image.setAttribute("class", "img-fluid");

          a.appendChild(image);
          propertyItemDiv[idx].appendChild(a);

          let propertyContent = document.createElement("div");
          propertyContent.setAttribute("class", "property-content");

          let divEmpty = document.createElement("div");
          let span = document.createElement("span");
          span.setAttribute("class", "city d-block mb-3");
          span.appendChild(document.createTextNode(theme.title));

          let div = document.createElement("div");
          div.setAttribute("class", "specs d-flex mb-4");

          let span1 = document.createElement("span");
          span1.setAttribute("class", "d-block d-flex align-items-center me-3");
          let span2 = document.createElement("span");
          span2.setAttribute("class", "icon-read me-2");
          let i = document.createElement("i");
          i.setAttribute("class", "bi bi-book");
          span2.appendChild(i);
          let span3 = document.createElement("span");
          span3.setAttribute("class", "caption");
          span3.appendChild(document.createTextNode(theme.readCount))

          span1.appendChild(span2);
          span1.appendChild(span3);

          div.appendChild(span1);

          let a1 = document.createElement("a");
          a1.setAttribute("href", "${root}/main?action=themeView&idx="+theme.content_id);
          a1.setAttribute("class", "btn btn-4 py-2 px-3");
          a1.appendChild(document.createTextNode("See detail"));

          divEmpty.appendChild(span);
          divEmpty.appendChild(div);
          divEmpty.appendChild(a1);

          propertyContent.appendChild(divEmpty);

          propertyItemDiv[idx++].appendChild(propertyContent);

        });
      });

    const nullAlert = document.getElementById("null-alert");
    const sleep = (delay) => new Promise((resolve) => setTimeout(resolve, delay));

    function nullAlarm() {
      nullAlert.style.display = "block";
      sleep(3000).then(() => (nullAlert.style.display = "none"));
    }

    function kakaoMap(data) {
      // 마커를 담을 배열입니다
      var markers = [];

      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.5012428, 127.0395859), // 지도의 중심좌표
          level: 4, // 지도의 확대 레벨
        };

      // 지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });
      // 검색 목록과 마커를 표출합니다

      // 공공데이터에서 불러올 data가 없으면 알림창을 띄웁니다
      if (data == undefined || data.length == 0) {
        nullAlarm();
      } else displayPlaces(data); // data

      // 검색 결과 목록과 마커를 표출하는 함수입니다
      function displayPlaces(places) {
        // data

        var listEl = document.getElementById("placesList"),
          menuEl = document.getElementById("menu_wrap"),
          fragment = document.createDocumentFragment(),
          bounds = new kakao.maps.LatLngBounds();

        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();

        // 공공데이터에서 불러올 data가 없으면 알림창을 띄웁니다
        if (places == undefined || places.length == 0) {
          nullAlarm();
        } else {
          for (var i = 0; i < places.length; i++) {
            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].mapY, places[i].mapX),
              marker = addMarker(placePosition, places[i].content_type_id),
              itemEl = getListItem(places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            if (placePosition.La == 0 && placePosition.Ma == 0)
              continue;
            bounds.extend(placePosition);
            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function (marker, title) {
              kakao.maps.event.addListener(marker, "mouseover", function () {
                displayInfowindow(marker, title);
              });

              kakao.maps.event.addListener(marker, "mouseout", function () {
                infowindow.close();
              });

              itemEl.onmouseover = function () {
                displayInfowindow(marker, title);
              };

              itemEl.onmouseout = function () {
                infowindow.close();
              };
            })(marker, places[i].title);

            fragment.appendChild(itemEl);
          }

          // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
          listEl.appendChild(fragment);
          menuEl.scrollTop = 0;

          // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
          // map.setBounds(bounds);
          map.setBounds(bounds);
        }
      }

      // 검색결과 항목을 Element로 반환하는 함수입니다
      function getListItem(places) {
        var el = document.createElement("li");

        var itemStr = '<span class="markerbg"><img src="./assets/images/marker_' + places.content_type_id +
            '.png" style="width:40px;height:40px"></img></span><div class="info"><h5>' +
            places.title +
            `</h5><span>` + places.addr + `</span>`;
        if (places.tel) {
          itemStr += '  <span class="tel">' + places.tel + `</span></div>`;
        }

        el.innerHTML = itemStr;
        el.className = "item";

        return el;
      }

      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
      function addMarker(position, contentTypeId) {
        // https://www.flaticon.com/kr/authors/flat_circular/flat
        var imageSrc="./assets/images/marker_" + contentTypeId + ".png";


          var marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: new kakao.maps.MarkerImage(
              imageSrc,
              new kakao.maps.Size(24, 24)
            ),
          });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker); // 배열에 생성된 마커를 추가합니다

        return marker;
      }

      // 지도 위에 표시되고 있는 마커를 모두 제거합니다
      function removeMarker() {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
        }
        markers = [];
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
        var content = '<div style="width: fit-content;padding:5px;">' + title + "</div>"; //z-index:1;
        infowindow.setContent(content);
        infowindow.open(map, marker);
      }

      // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
          el.removeChild(el.lastChild);
        }
      }
    }


    document.querySelector("#searchMore").addEventListener("click", function () {
  	  window.scrollBy({ top: document.querySelector(".site-nav").getBoundingClientRect().top, behavior: "smooth" });
	  });


    </script>
		</body>
		</html>