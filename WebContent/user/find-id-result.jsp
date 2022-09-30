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
			<div class="col-lg-8 text-center" data-aos="fade-up"
				data-aos-delay="200">
			<c:if test="${finded_id} != null">
				 회원님의 아이디는 ${finded_id}입니다.
			</c:if>
			<c:if test="${finded_id} == null">
				회원 정보를 찾을 수 없습니다.
			</c:if>
					<input type="submit" class="btn btn-outline-primary btn-sm mt-3"
						id="btn-find-id" value="뒤로 가기"></input>
				</form>		
			</div>
		</div>
								
	</div>
</div>

<%@ include file="/common/footer.jsp"%>


</body>
</html>
