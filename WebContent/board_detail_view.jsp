<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>

    <div class="hero page-inner overlay" style="background-image: url('${root}/assets/images/bg-img.jpg')">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">${detail_board.board_type_id}</h1>

            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="${root}/index.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="${root}/community.jsp">Community</a></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <div class="section">
      <div class="container">
        <div class="row justify-content-between">
<c:if test='${detail_board.board_type_id ne "공지사항" }'>
          <div class="community-info">
						<div class="address mt-2 mb-5">
							<i class="icon-room"></i>
							<h4 class="mb-2 text-center">Location</h4>
						</div>
						<div class="row mt-3 mb-5">
							<div class="area col-md-6">
								<select class="selectArea form-select border-0 py-3 text-center">
										<option>${location_sido}</option>
								</select>
							</div>
							<div class="sigungu col-md-6">
								<select class="selectArea form-select border-0 py-3 text-center">
										<option>${location_gungu}</option>
								</select>
							</div>
						</div>
					</div>
					</c:if>
          <div class="col-lg-5">
            <div class="img-property-slide-wrap">
              <div class="img-property-slide">
              <!-- 이미지 있을 때 추가 -->
                <img
                  src="http://tong.visitkorea.or.kr/cms/resource/83/1306383_image2_1.jpg"
                  alt="Image"
                  class="img-fluid"
                />
                <img
                  src="http://tong.visitkorea.or.kr/cms/resource/09/2716609_image2_1.jpg"
                  alt="Image"
                  class="img-fluid"
                />
                <img
                  src="http://tong.visitkorea.or.kr/cms/resource/23/2654423_image2_1.jpg"
                  alt="Image"
                  class="img-fluid"
                />
              </div>
            </div>
          </div>
          <div class="col-lg-6 mb-3">
            <h2 class="heading text-primary">${detail_board.board_title}</h2>
            <p class="text-black mt-5"> 
              ${detail_board.content}
            </p>
          </div>
	<c:if test="${detail_board.user_id eq userInfo.id}">
		  <button class="btn btn-outline-primary mt-5 mb-3" onClick="location.href='${root}/main_community?act=mvModify&board_id=${detail_board.board_id}'">수정하기</button>
		  <button class="btn btn-outline-danger mt-3 mb-5" onClick="location.href='${root}/main_community?act=delete&board_id=${detail_board.board_id}'">삭제하기</button>
	</c:if>

        </div>
      </div>
    </div>

    <%@ include file="/common/footer.jsp" %>

  </body>
</html>
