<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon"
	href="${root}/assets/images/icon/logo_color_symbol_1.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="${root}/assets/fonts/icomoon/style.css" />
<link rel="stylesheet"
	href="${root}/assets/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="${root}/assets/css/tiny-slider.css" />
<link rel="stylesheet" href="${root}/assets/css/aos.css" />
<link rel="stylesheet" href="${root}/assets/css/style.css" />
<script src="https://kit.fontawesome.com/7c5c9bd1a9.js" crossorigin="anonymous"></script>
<title>S&J</title>

</head>
<body>

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<nav class="site-nav">
		<div class="container">
			<div class="menu-bg-wrap btn-2">
				<div class="site-navigation">
					<a href="${root}/index.jsp" class="logo m-0 float-start">S&J</a>

					<ul
						class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
						<li class="active"><a href="${root}/index.jsp">Home</a></li>
						<c:if test="${userInfo eq null}">
							<li><a href="${root}/user?action=mvLogin">로그인</a></li>
							<li><a href="${root}/user?action=mvJoin">회원가입</a></li>
						</c:if>
						<li><a href="${root}/main_community?act=mvList&content_type_id=0">커뮤니티</a></li>
						<li><a href="${root}/main_community?act=notice">공지사항</a></li>
						<c:if test="${userInfo ne null}">
							<li><a href="${root}/user?action=mvMyPage">마이페이지</a></li>
							<li><a href="${root}/user?action=logout">로그아웃</a></li>
						</c:if>
					</ul>

					<a href="#"
						class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
						data-toggle="collapse" data-target="#main-navbar"> <span></span>
					</a>
				</div>
			</div>
		</div>
	</nav>