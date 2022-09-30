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
				<h1 class="heading" data-aos="fade-up">공지사항</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="${root}/index.jsp">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page"><a href="${root}/notice.jsp">notice</a></li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<!-- /.untree_co-section -->

<div class="container">
	<div class="col-auto text-md-end mt-5">
		<button type="button" class="regist btn btn-sm btn-light mb-3">공지사항 등록</button>
	</div>
	<div class="board container mt-5 mb-5 pb-5">
		<table class="table table-hover text-center" data-aos="fade-up">
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col" colspan="2">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${noticeList}" varStatus="status">
					<tr
						onClick="location.href='${root}/main_community?act=view&board_id=${notice.board_id}'">
						<th scope="row">${status.count}</th>
						<td colspan="2">${notice.board_title}</td>
						<td>${notice.user_id}</td>
						<td>${notice.readcount}</td>
						<td>${notice.regist_time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="testimonial-nav"
			class="row justify-content-between align-items-center"
			data-aos="fadeup">
			<span data-controls="prev" class="prev col-1">이전</span> <span
				data-controls="prev" class="prev col-1">다음</span>
		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>

<script>
document.querySelector(".regist").addEventListener("click", function(){
	console.log(${userInfo.adminAuthor});
	if(${userInfo.adminAuthor != true}){
		alert("관리자 권한 기능입니다.");
	 	return;
	}
	else{
	 	location.href = "${root}/main_community?act=mvRegist";
	}
})
</script>
</body>
</html>
