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
				<h1 class="heading" data-aos="fade-up">비밀번호 찾기</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">Find Password</li>
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

				<form action="${root}/user" method="POST">
					<input type="hidden" name="action" value="findPwd" />
					<div class="row">
						<div class="col-12 mb-4">
							<input id="find-id" name="find-id" type="text" class="form-control"
								placeholder="사용하던 아이디를 입력해주세요" required/>
						</div>

						<div class="col-12 mb-4 input-group">
							<input id="find-name" name="find-email" type="text"
								class="form-control" placeholder="사용하던 이메일을 입력해주세요" required />
							<span class="input-group-text">@</span>
							<select class="form-select"
								id="find-emaildomain" name="find-emaildomain" aria-label="이메일 도메인 선택">
								<option selected>선택</option>
								<option value="ssafy.com">ssafy.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
					<input type="submit" class="btn btn-outline-primary btn-sm mt-5"
						id="btn-find-id" value="비밀번호 찾기"></input>
				</form>		
			</div>
		</div>
								
	</div>
</div>

<%@ include file="/common/footer.jsp"%>


</body>
</html>
