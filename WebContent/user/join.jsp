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
				<h1 class="heading" data-aos="fade-up">회원가입</h1>

				<nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
					<ol class="breadcrumb text-center justify-content-center">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item active text-white-50"
							aria-current="page">join</li>
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
			<div class="col-lg-8 col-md-10 col-sm-12">
				<form id="form-join" method="POST" action="">
					<input type="hidden" name="action" value="join">
					<div class="mb-3">
						<label for="username" class="form-label">이름 : </label> <input
							type="text" class="form-control" id="username" name="username"
							placeholder="이름" />
					</div>
					<div id="namecheck-result"></div>

					<div class="mb-3">
						<label for="userid" class="form-label">아이디 : </label> <input
							type="text" class="form-control" id="userid" name="userid"
							placeholder="아이디" />
					</div>
					<div id="idcheck-result"></div>
					<div class="mb-3">
						<label for="userpwd" class="form-label">비밀번호 : </label> <input
							type="password" class="form-control" id="userpwd" name="userpwd"
							placeholder="비밀번호" />
					</div>
					<div class="mb-3">
						<label for="pwdcheck" class="form-label">비밀번호확인 : </label> <input
							type="password" class="form-control" id="pwdcheck"
							placeholder="비밀번호확인..." />
					</div>
					<div class="mb-3">
						<label for="emailid" class="form-label">이메일 : </label>
						<div class="input-group">
							<input type="text" class="form-control" id="emailid"
								name="emailid" placeholder="이메일 아이디" /> <span
								class="input-group-text">@</span> <select class="form-select"
								id="emaildomain" name="emaildomain" aria-label="이메일 도메인 선택">
								<option selected>선택</option>
								<option value="ssafy.com">ssafy.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="naver.com">naver.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
						</div>
					</div>
					
					<div class="col-auto text-center">
						<button type="button" id="btn-join"
							class="btn btn-outline-success mb-3">회원가입</button>
						<button type="reset" class="btn btn-outline-primary mb-3">초기화</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="/common/footer.jsp"%>

<script>


let isUseName = false;
document.querySelector("#username").addEventListener("keyup", function () {
	 let username = this.value;
	 let resultDiv = document.querySelector("#namecheck-result");
	 
		fetch("${root}/user?action=namecheck&username=" + username)
			.then(response => response.text())
			.then(data => {
  			 if(data == 0) {
  			   resultDiv.setAttribute("class", "mb-3 text-primary");
  		       resultDiv.textContent = username + "는 사용할 수 있습니다.";
  		     isUseName = true;
  			 } else {
  			   resultDiv.setAttribute("class", "mb-3 text-danger");
    		       resultDiv.textContent = username + "는 사용할 수 없습니다.";
    		       isUseName = false;
  			 }
			});
});


let isUseId = false;
document.querySelector("#userid").addEventListener("keyup", function () {
	 let userid = this.value;
	 let resultDiv = document.querySelector("#idcheck-result");
	 if(userid.length < 5 || userid.length > 16) {
		 resultDiv.setAttribute("class", "mb-3 text-dark");
		 resultDiv.textContent = "아이디는 6자 이상 16자 이하 입니다.";
		 isUseId = false;
	 } else {
		fetch("${root}/user?action=idcheck&userid=" + userid)
			.then(response => response.text())
			.then(data => {
				console.log(data);
  			 if(data == 0) {
  			   resultDiv.setAttribute("class", "mb-3 text-primary");
  		       resultDiv.textContent = userid + "는 사용할 수 있습니다.";
  		       isUseId = true;
  			 } else {
  			   resultDiv.setAttribute("class", "mb-3 text-danger");
    		       resultDiv.textContent = userid + "는 사용할 수 없습니다.";
    		       isUseId = false;
  			 }
			});
	 }
});

document.querySelector("#btn-join").addEventListener("click", function () {
    if (!document.querySelector("#username").value) {
      alert("이름을 입력해주세요.");
      return;
    } else if (!document.querySelector("#userid").value) {
      alert("아이디를 입력해주세요.");
      return;
    } else if (!document.querySelector("#userpwd").value) {
      alert("비밀번호을 입력해주세요.");
      return;
    } else if (document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value) {
      alert("비밀번호가 일치하지 않습니다.");
      return;
    } else if (!isUseId) {
      alert("중복된 아이디가 존재합니다.");
      return;
    }else if (!isUseName) {
        alert("중복된 이름이 존재합니다.");
        return;
      } else {
      let form = document.querySelector("#form-join");
      form.setAttribute("action", "${root}/user");
      form.submit();
    }
  });
    </script>

</body>
</html>
