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
            <h1 class="heading" data-aos="fade-up">공지사항</h1>

            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                <li class="breadcrumb-item"><a href="${root}/community.jsp">notice</a></li>
                <li class="breadcrumb-item"><a href="#">regist</a></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>

    <div class="section">
      <div class="container">
        <div class="row justify-content-between">
		
		<form action="${root}/main_community?act=regist" id="form-modify" method="POST">
		<input type="hidden" name="content_type" value="4">
			<div class="row">
				<div class="col-12 mb-4">
					<input id="title" name="board_title" type="text" class="form-control"
						placeholder="공지사항 제목" value="${modify_board.board_title}" />
				</div>
				
				<div class="col-12 mb-4">
					<textarea id="content" name="board_content" rows="10"
						class="form-control" placeholder="공지사항 내용">${modify_board.content}</textarea>
				</div>
				<div class="col-10 mb-3 custom-file">
							<input type="file" class="custom-file-input" id="trip_img1"
								name="trip_img1"> 
						</div>
				<input type="submit" class="btn btn-outline-primary"
				id="btn-login" value="등록하기"/>
			</div>
		</form>
        </div>
      </div>
    </div>

    <%@ include file="/common/footer.jsp" %>

  </body>
</html>
