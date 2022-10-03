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
							alt="Image" class="img-fluid" /> <img
							src="http://tong.visitkorea.or.kr/cms/resource/09/2716609_image2_1.jpg"
							alt="Image" class="img-fluid" /> <img
							src="http://tong.visitkorea.or.kr/cms/resource/23/2654423_image2_1.jpg"
							alt="Image" class="img-fluid" />
					</div>
				</div>
			</div>
			<div class="col-lg-6 mb-3">
				<h2 class="heading text-primary">${detail_board.board_title}</h2>
				<p class="text-black mt-5">${detail_board.content}</p>
			</div>

			<hr>
			<div class="container mt-3">
				<form action="${root}/reply" method="post">
					<input type="hidden" name="act" value="regist" />
					<section class="features-1 row ps-4 pe-4 pb-4">
						<div class="col-10 my-auto">
							<input type="hidden" name="board_id"
								value="${detail_board.board_id}" />
							<div class="">
								<textarea class="form-control" name="content" rows="3"
									cols="130" placeholder="상대방을 존중하는 댓글을 남겨주세요"></textarea>
							</div>
						</div>
						<div class="col-2 my-auto">
							<input type="submit" value="등록" class="btn btn-primary" />
						</div>
					</section>
				</form>
			</div>

			<div class="container mt-5">
				<c:forEach var="replys" items="${total_reply}">
					<div class="pt-3 ps-4 pe-4" class="sigle-reply">
						<div class="row my-auto mb-3 ms-2">
							<form method="post" class="col-10 form-reply">
								<input type="hidden" value="${replys.idx}" class="modified-idx"
									name="reply-idx" />
								<p class="row font-weight-bold text-black">${replys.user_id}
									님의 댓글</p>
								<h6
									class="row origin-reply font-weight-bold text-primary heading mb-4">"
									${replys.reply_content} "</h6>
								<div class="row modify-div" style="display: none">
									<textarea class="form-control mb-4" name="modify-content"
										rows="3">${replys.reply_content}</textarea>
								</div>
							</form>
							<div class="col-2 mb-3 text-center">
								<c:if test="${userInfo.id eq replys.user_id}">
									<input type="button" value="수정"
										class="modify-btn btn-sm btn-primary" />
									<input type="button" value="삭제"
										class="delete-btn btn-sm btn-warning" />
								</c:if>
								<div class="mt-3 mb-3 justify-content-center  float-right">${replys.regist_time}</div>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>

			<c:if test="${detail_board.user_id eq userInfo.id}">
				<button class="btn btn-outline-primary mt-5 mb-3"
					onClick="location.href='${root}/main_community?act=mvModify&board_id=${detail_board.board_id}'">수정하기</button>
				<button class="btn btn-outline-danger mt-3 mb-5"
					onClick="location.href='${root}/main_community?act=mvDelete&board_id=${detail_board.board_id}'">삭제하기</button>
			</c:if>
		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>

</body>

<script>
	let modify_btn = document.querySelectorAll(".modify-btn");
	let delete_btn = document.querySelectorAll(".delete-btn");

	modify_btn.forEach(function(reply) {
		reply.addEventListener("click", function() {
			let form = reply.parentElement.previousElementSibling;
			console.log(form);

			let origin_reply = form.querySelector(".origin-reply");
			let modify_div = form.querySelector(".modify-div");
			let delete_btn = reply.nextElementSibling;

			modify_div.style.display = "block";
			origin_reply.style.display = "none";

			reply.addEventListener("click", function() {
				let idx = form.querySelector(".modified-idx").value;
				let path = "${root}/reply?act=modify&board_id="+${detail_board.board_id}+"&idx="+idx;
				form.setAttribute("action", path);
				form.submit();

				modify_div.style.display = "none";
				origin_reply.style.display = "block";
			});
		});
	});

	delete_btn.forEach(function(delete_reply) {
		delete_reply.addEventListener("click", function() {
			console.log(delete_reply);
			if (confirm("이 댓글을 정말 삭제하시겠습니까?")) {
				let form = delete_reply.parentElement.previousElementSibling;
				let idx = form.querySelector(".modified-idx").value;
				console.log(idx.value + "번호");

				let path = "${root}/reply?act=delete&board_id="+ ${detail_board.board_id}+"&idx=" + idx;
				form.setAttribute("action", path);
				form.submit();
			}
		});
	});
</script>
</html>
