<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>


<div class="hero page-inner overlay"
	style="background-image: url('${root}/assets/images/bg-img.jpg')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">커뮤니티</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="${root}/index.jsp">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">community</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>


<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-lg-6">
			<h2 class="font-weight-bold text-primary heading">여행 후기</h2>
		</div>
		<div class="col-lg-6 text-lg-end">
			<p>
				<a href="${root}/main_community?act=mvList&content_type_id=1" class="learn-more">더
					많은 여행 후기</a>
			</p>
		</div>
	</div>
</div>
<div class="section bg-light">
	<div class="container">
		<div class="row">
		
		<% int delayCnt = 300; %>
		
		<c:forEach var="reviews" items="${top_review}" varStatus="status">
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="${300 + status.index * 100}">
				<div class="box-feature mb-4">
					<div class="row">
						<span class="col mb-4 d-block"><img src="${root}/assets/images/LetsTravel_icon_color.png" style="width:30%"/></span>
						<p class="col" style="text-align:right">${reviews.user_id} 님</p>
					</div>
					<h3 class="text-black mb-3 font-weight-bold">" ${reviews.board_title} "</h3>
					<p class="text-black-50">${reviews.content}</p>
					<p>
						<a href="${root}/main_community?act=view&board_id=${reviews.board_id}" class="learn-more">자세히 보기</a>
					</p>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>

<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col-lg-6">
			<h2 class="font-weight-bold text-primary heading">여행 메이트</h2>
		</div>
		<div class="col-lg-6 text-lg-end">
			<p>
				<a href="${root}/main_community?act=mvList&content_type_id=2" class="learn-more">더
					많은 메이트</a>
			</p>
		</div>
	</div>
</div>

<div class="section bg-light">
	<div class="container">
		<div class="row">
		<c:forEach var="mates" items="${top_mate}" varStatus = "status">
			<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="${300 + status.index * 100}">
				<div class="box-feature mb-4">
					<div class="row">
						<span class="col mb-4 d-block"><img src="${root}/assets/images/Mate_icon.png" style="width:30%"/></span>
						<p class="col" style="text-align:right">${mates.user_id} 님</p>
					</div>
					<h3 class="text-black mb-3 font-weight-bold">" ${mates.board_title} "</h3>
					<p class="text-black-50">${mates.content}</p>
					<p>
						<a href="${root}/main_community?act=view&board_id=${mates.board_id}" class="learn-more">자세히 보기</a>
					</p>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<form method= "post" id = "form-regist" enctype="multipart/form-data">
		<input type="hidden" name="act" value="regist">
			<div class="row">
				<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up"
					data-aos-delay="100">
					<div class="community-info">
						<div class="address mt-2">
							<i class="icon-room"></i>
							<h4 class="mb-2 text-center">Location</h4>
						</div>
						<div class="row mt-3">
							<div class="area col-md-6">
								<select class="selectArea form-select border-0 py-3 text-center">
									<c:forEach var="area" items="${areaList}">
										<option value="${area.areaCode}">${area.areaName}</option>
									</c:forEach>
								</select>
							</div>
						<div class="sigungu col-md-6"></div>
						<div class="row text-center mt-3">
						
						<c:if test="${userInfo.id} ne null">
						<h2 class="font-weight-bold text-primary heading mt-5">
							${userInfo.id}님 </br>이번 여행은</br>어떠셨나요?
						</h2>
						</c:if>
						</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
					<div class="col-12 mb-3">
						<input type="text" class="form-control" placeholder="제목 입력..."
							id="board_title" name="board_title" required/>
					</div>
					<div class="row">
						<div class="col-3 mb-3">
							<input type="date" class="form-control" placeholder="start_Date"
								id="start_date" name="start_date" required />
						</div>
						<div class="col-3 mb-3">
							<input type="date" class="form-control" placeholder="start_Date"
								id="end_date" name="end_date" required />
						</div>
						<div class="col-4 mb-3">
							<select class="form-control form-select text-center"
								id="content_type" name="content_type">
								<option value="1">여행 후기</option>
								<option value="2">여행 메이트</option>
								<option value="3">여행 메이트 후기</option>
							</select>
						</div>
						<div class="col-2 mb-3">
							<select class="form-control form-select text-center"
								id="score" name="score">
								<option value="none">별점</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>

						<div class="col-12 mb-3">
							<textarea id="board_content" name="board_content" id="board_content" cols="30"
								rows="7" class="form-control" placeholder="내용 입력..." required></textarea>
						</div>

						<div class="col-10 mb-3 custom-file">
							<input type="file" class="custom-file-input" id="trip_img1"
								name="trip_img1"> <label class="custom-file-label"
								for="customFile">파일선택</label>
						</div>
						<div class="col-10 mb-3 custom-file">
							<input type="file" class="custom-file-input" id="trip_img2"
								name="trip_img2"> <label class="custom-file-label"
								for="customFile">파일선택</label>
						</div>
						<div class="col-12 offset-md-5 mt-3" data-aos="fade-up">
							<button type="button" class="btn btn-4" id="submitButton">등록하기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>

<script>
	window.onload =  function (){
		console.log("window onload");
	fetch("${root}/main?action=getSigunguList&areaCode=1")
	.then((response) => response.json())
	.then((data) => makeSigunguList(data)); // 시군구
	
	}


    let select = document.querySelector(".selectArea");

    select.addEventListener("change", function () {
    	initSigunguList(); // 기존 시군구 select 삭제
      	let selectedAreaNum = select[select.selectedIndex].value;
    	console.log(selectedAreaNum);

      	fetch("${root}/main?action=getSigunguList&areaCode="+selectedAreaNum)
      	   .then((response) => response.json())
      	   .then((data) => makeSigunguList(data)); // 시군구
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

    function initSigunguList() {
    	let sigunguOptions = document.querySelector(".sigungu>select");
    	document.querySelector(".sigungu").removeChild(sigunguOptions);
    }


    
    let start_date = document.querySelector("#start_date");
    let end_date = document.querySelector("#end_date");
    start_date.addEventListener('change', function(){
    	console.log(start_date.value);
    	let start = start_date.value;
    	end_date.setAttribute("min", start);
    });
    
    document.querySelector("#submitButton").addEventListener("click",function(){
    	let title = document.querySelector("#board_title");
    	let content = document.querySelector("#board_content");
    	let start_date = document.querySelector("#start_date");
    	let end_date = document.querySelector("#end_date");
    	
    	console.log("타이틀:" + title.value);
    	
    	if(${userInfo == null}){
    		alert("로그인 후 글을 작성할 수 있습니다.");
    		location.href = "${root}/user/login.jsp";
    	} else {
    		if(!title.value)
				alert("제목을 입력해주세요");
    		else if(start_date.value == "" || end_date.value == "")
				alert("날짜를 입력해주세요");
    		else if(!content.value)
				alert("내용을 입력해주세요");
    		else {
	    		let form = document.querySelector("#form-regist");
    			form.setAttribute("action","${root}/main_community");
    			form.submit();
    		}
    	}
    });

      
    </script>
</body>
</html>
