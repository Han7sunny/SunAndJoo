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
				<h1 class="heading" data-aos="fade-up">로그인</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">login</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
</div>

<!-- /.untree_co-section -->

<div class="section">
	<div class="container">
		<div class="row  justify-content-center align-items-center">
			<div class="col-lg-8 text-center" data-aos="fade-up"
				data-aos-delay="200">
				<!-- 로그인 기능 -->

				<div class="mb-5" style="color: red">${msg}</div>

				<form id="form-login" method="POST">
					<input type="hidden" name="action" value="login" />
					<div class="row">
						<div class="col-12 mb-4">
							<input id="userid" name="userid" type="text" class="form-control"
								placeholder="아이디" value="${joinId}" />
						</div>

						<div class="col-12 mb-4">
							<input id="userpwd" name="userpwd" type="password"
								class="form-control" placeholder="비밀번호" />
						</div>
					</div>
					<button type="button" class="btn btn-outline-primary btn-sm"
						id="btn-login">로그인</button>
				</form>
				<div class="col-auto text-center mt-5">
					<button type="button" class="btn btn-sm btn-light mb-3" onClick="location.href='${root}/user/find-id.jsp'">아이디 찾기</button>
					<button type="button" class="btn btn-sm btn-light mb-3"  onClick="location.href='${root}/user/find-pwd.jsp'">비밀번호 찾기</button>
				</div>				
			</div>
		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>

<script>
	document.querySelector("#btn-login").addEventListener("click", function() {
		if (!document.querySelector("#userid").value) {
			alert("아이디를 입력하세요.");
			return;
		} else if (!document.querySelector("#userpwd").value) {
			alert("비밀번호를 입력하세요.");
			return;
		} else {
			let form = document.querySelector("#form-login");
			form.setAttribute("action", "${root}/user");
			form.submit();
		}
	});
</script>

</body>
</html>
