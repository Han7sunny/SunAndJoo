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
	<div class="container">
		<div class="row mt-5 pt-5">

			<div class="boardList text-center">
				<h4 class="mt-5 mb-5">${userInfo.id} 님의 회원 정보 수정이 완료되었습니다</h4>
			</div>
				 
			<div class="text-center mt-5 mb-5">
			<button class="btn btn-light" onclick="history.back()">돌아가기</button>
			</div>

		</div>
	</div>
</div>
</body>
</html>
