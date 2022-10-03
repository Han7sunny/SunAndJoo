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
				<h1 class="heading" data-aos="fade-up">아이디 찾기</h1>

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
			<div class="col-lg-8 text-center mt-5 mb-5 pb-5" data-aos="fade-up"
				data-aos-delay="200">

				<h2 class="font-weight-bold text-primary heading mt-5 mb-5">
					<c:if test="${finded_id ne null}">
				 회원님의 아이디는 ${finded_id}입니다.
			</c:if>
					<c:if test="${finded_id eq null}">
				회원 정보를 찾을 수 없습니다.
			</c:if>

				</h2>

				<input type="button" class="btn btn-outline-primary btn-sm mt-3"
					id="btn-find-id" value="뒤로 가기"
					onclick="location.href='${root}/user?action=mvLogin'"></input>

			</div>

		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>


</body>
</html>
