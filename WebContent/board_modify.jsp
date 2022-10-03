<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="hero page-inner overlay"
	style="background-image: url('${root}/assets/images/bg-img.jpg')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<h1 class="heading" data-aos="fade-up">글 수정</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="${root}/community.jsp">Community</a>
						</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row justify-content-between">
			

			<form
				action="${root}/main_community?act=modify&board_id=${modify_board.board_id}"
				id="form-modify" method="POST">
				<input type="hidden" name="board_type_id"
					value="${modify_board.board_type_id}">
					<c:if test='${modify_board.board_type_id ne "공지사항" }'>

				<div class="community-info">
					<div class="address mt-2">
						<i class="icon-room"></i>
						<h4 class="mb-2 text-center">Location</h4>
					</div>
					<div class="row mt-5 mb-5">
						<div class="area col-md-6">
							<select class="selectArea form-select border-0 py-3 text-center" name="location_sido">
								<c:forEach var="area" items="${areaList}">
									<c:choose>
										<c:when test="${area.areaCode == modify_board.location_sido}">
											<option value="${area.areaCode}" selected>${area.areaName}</option>
										</c:when>
										<c:otherwise>
											<option value="${area.areaCode}">${area.areaName}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="sigungu col-md-6"></div>
					</div>
				</div>
			</c:if>
					
					
					
					
				<div class="row">
					<div class="col-12 mb-4">
						<input id="title" name="title" type="text" class="form-control"
							placeholder="${modify_board.board_title}"
							value="${modify_board.board_title}" />
					</div>

					<div class="col-12 mb-4">
						<textarea id="content" name="content" rows="10"
							class="form-control" placeholder="${modify_board.content}">${modify_board.content}</textarea>
					</div>
					<input type="submit" class="btn btn-outline-primary" id="btn-login"
						value="등록하기" />
				</div>
			</form>
		</div>
	</div>
</div>
<script>
window.onload =  function (){
	fetch("${root}/main?action=getSigunguList&areaCode=${modify_board.location_sido}")
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
  	  select.setAttribute("name","location_gungu");
  	  data.sigunguList.forEach((sigungu) => {
  	    let option = document.createElement("option");
  	    option.setAttribute("value", sigungu.sigungu_code);
  	    if(sigungu.sigungu_code == ${modify_board.location_gungu}){
  	    	option.selected = true;
  	    }
  	    option.appendChild(document.createTextNode(sigungu.sigungu_name));
  	    select.appendChild(option);
  	  });
  	  sigunguList.appendChild(select);
  	}

  function initSigunguList() {
	  let sigunguOptions = document.querySelector(".sigungu>select");
	  document.querySelector(".sigungu").removeChild(sigunguOptions);
	}
  //document.querySelector("#btn-login").addEventListener("click", function(){
	  
  //});
</script>
<%@ include file="/common/footer.jsp"%>

</body>
</html>
