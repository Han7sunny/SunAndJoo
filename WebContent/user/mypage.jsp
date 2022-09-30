<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>

<div class="page-inner overlay"
	style="background-image: url('${root}/assets/images/hero_bg_1.jpg')">
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center mt-5">
				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<div class="breadcrumb text-center justify-content-center"></div>
				</nav>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container mb-5">
		<div class="boardList text-center">
			<h4 class="mt-5">회원 정보</h4>
		</div>
		<div class="row mt-5">
			<div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up"
				data-aos-delay="100">
				<div class="community-info">
					<div class="user-id mt-4">
						<h4 class="mb-2">닉네임</h4>
					</div>

					<div class="user-name mt-5">
						<h4 class="mb-2">아이디</h4>
					</div>

					<div class="email mt-5">
						<h4 class="mb-2">이메일</h4>
					</div>

				</div>
			</div>


			<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
				<form action="${root}/user" method="POST" id="form-mypage">
				<input type="hidden" name="action" value="modify"/>
					<div class="row">
						<div class="col-12 mb-4">
							<input type="text" class="form-control" name="userpage_name"
								placeholder="${userInfo.name}" value="${userInfo.name}" readonly />
						</div>

						<div class="col-12 mb-4">
							<input type="text" class="form-control" name="userpage_id"
								placeholder="${userInfo.id}" value="${userInfo.id}" readonly/>
						</div>

						<div class="input-group mb-4">
							<input type="text" class="form-control" name="userpage_emailId" value="${userInfo.emailId}"/>
							<span class="input-group-text">@</span>
							<input type="text" class="form-control" name="userpage_emailDomain" value="${userInfo.emailDomain}"/>
						</div>
					</div>
				</form>
			</div>

			<div class="boardList text-center">
				<h4 class="mt-5 mb-2 pt-5 mt-5">최근 작성 글 목록</h4>
			</div>
			<div class="container">
				<div class="container">
					<div class="board container mt-5 mb-5 pb-5">
						<table class="table table-hover text-center" data-aos="fade-up">
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col" colspan="2">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">조회수</th>
									<th scope="col">작성날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${boardList ne null}">
									<c:forEach var="board" items="${boardList}" begin="0"
										end="${boardSize}" step="1" varStatus="status">
										<tr onClick="location.href='${root}/main_community?act=view&board_id=${board.board_id}'">
											<th scope="row">${status.count}</th>
											<td colspan="2">${board.board_title}</td>
											<td>${board.user_id}</td>
											<td>${board.readcount}</td>
											<td>${board.regist_time}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<c:if test="${boardList eq null or boardSize eq 0}">
								<div class="mt-5 text-center">작성된 글이 없습니다.</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
    <div
      class="row mb-5 mt-5"
      data-aos="fadeup"
    >
		<div class="col-lg-6 col-sm-12 text-lg-start text-center" data-aos="fade-up">
			<button type="button" class="btn btn-warning" id="delete-btn">탈퇴하기</button>
		</div>
       	<div class="col-lg-6 col-sm-12 text-lg-end  text-center" data-aos="fade-up">
			<button type="button" class="btn btn-4" id="modify-btn">회원정보 수정하기</button>
		</div>
	</div>
	</div>
</div>

<script>

document.querySelector("#delete-btn").addEventListener("click",function(){
	location.href = "${root}/alert_page/user_delete_check.jsp";
});

document.querySelector("#modify-btn").addEventListener("click",function(){
	let form = document.querySelector("#form-mypage");
		  form.setAttribute("action","${root}/user?act=modify");
		  form.submit();
});
</script>


<%@ include file="/common/footer.jsp"%>

</body>
</html>
