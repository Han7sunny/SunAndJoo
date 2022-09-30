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
		<div class="row text-center mt-5 mb-5 pt-5 pb-5">
				<h4 class="mt-5 mb-2">" ${userInfo.name} " 님 이 글을 정말 삭제하시겠습니까?</h4>
		</div>
	    <form action="${root}/main_community?act=delete" method="post" class="row mb-5 mt-5 ms-5 me-5"
	    >
			<div class="col-lg-6 col-sm-12 text-lg-start text-center">
				<input type="submit" class="btn btn-danger" id="delete-btn" value="예"/>
			</div>
	       	<div class="col-lg-6 col-sm-12 text-lg-end  text-center">
				<button type="button" class="btn btn-4" id="back-btn" onclick="history.back()">아니오</button>
			</div>
		</form>
		</div>
	</div>
</div>
</body>
</html>
