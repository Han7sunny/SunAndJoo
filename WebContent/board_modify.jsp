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
            <h1 class="heading" data-aos="fade-up">글 수정</h1>

            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item">
                  <a href="${root}/community.jsp">Community</a>
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

          <div class="community-info">
			<div class="address mt-2">
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
		
		
		<form action="${root}/main_community?act=modify&board_id=${modify_board.board_id}" id="form-modify" method="POST">
			<div class="row">
				<div class="col-12 mb-4">
					<input id="title" name="title" type="text" class="form-control"
						placeholder="${modify_board.board_title}" value="${modify_board.board_title}" />
				</div>
	
				<div class="col-12 mb-4">
					<textarea id="content" name="content" rows="10"
						class="form-control" placeholder="${modify_board.content}">${modify_board.content}</textarea>
				</div>
				<input type="submit" class="btn btn-outline-primary"
				id="btn-login" value="등록하기"/>
			</div>
		</form>
        </div>
      </div>
    </div>

    <%@ include file="/common/footer.jsp" %>


    <script src="${root}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${root}/assets/js/tiny-slider.js"></script>
    <script src="${root}/assets/js/aos.js"></script>
    <script src="${root}/assets/js/navbar.js"></script>
    <script src="${root}/assets/js/counter.js"></script>
    <script src="${root}/assets/js/custom.js"></script>
  </body>
</html>
