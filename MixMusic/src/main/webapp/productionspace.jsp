<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니s티 사이트</title>
<style>
body {
	background-color: #000000;
	color: #000000;
}

.jumbotron {
	background-color: rgba(255, 255, 255, 0.5);
}

li {
	font-family: Hanna;
	font-size: 20px;
}

.background-image {
	background-image: url(image/main_image11.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.carousel-inner .item img {
	height: 100%; /* Adjust the height as per your requirement */
	width: 100%; /* Adjust the width as per your requirement */
	object-fit: cover;
}
</style>
</head>
<body class="background-image">
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default"
		style="background-color: #000000; border: #000000">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 메뉴 오른쪽 아이콘 바 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp" style="color: #ffffff;">음악
				리믹스 커뮤니티 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp"
					style="background-color: #000000; border: #000000; color: #ffffff;">메인</a>
				<li><a href="bbs.jsp" style="color: #ffffff;">게시판</a>
				<li><a href="fileDownload.jsp" style="color: #ffffff;">음악저장소</a>
				<li><a href="productionspace.jsp" style="color: #ffffff;">음악제작소</a>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false" style="color: #ffffff;">접속하기<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false" style="color: #ffffff">회원관리<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>이곳은 음악제작소 입니다 !</h1>
				<p style="font-family: Hanna">밑에 나와있는 방법을 참고하여 리믹스 곡을 제작해보세요!</p>
				<p>
					<a class="btn btn-primary btn-pull"
						href="https://audio-joiner.com/ko/" role="button"
						style="background-color: #000000; color: #ffffff; font-size: 20px; font-family: Hanna">123apps
						바로가기!</a>
				</p>
				<p>
					<a class="btn btn-primary btn-pull"
						href="https://www.4shared.com/web/q#category=1" role="button"
						style="background-color: #000000; color: #ffffff; font-size: 20px; font-family: Hanna">4shared
						바로가기!</a>
				</p>

			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators" style="background: #000000">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
				<li data-target="#myCarousel" data-slide-to="6"></li>
				<li data-target="#myCarousel" data-slide-to="7"></li>
				<li data-target="#myCarousel" data-slide-to="8"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="image/produce2.PNG">
				</div>
				<div class="item">
					<img src="image/produce3.PNG">
				</div>
				<div class="item">
					<img src="image/produce4.PNG">
				</div>
				<div class="item">
					<img src="image/produce5.PNG">
				</div>
				<div class="item">
					<img src="image/produce6.PNG">
				</div>
				<div class="item">
					<img src="image/produce7.PNG">
				</div>
				<div class="item">
					<img src="image/produce8.PNG">
				</div>
				<div class="item">
					<img src="image/produce9.PNG">
				</div>
				<div class="item">
					<img src="image/produce10.PNG">
				</div>
			</div>
			<a class="left-carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right-carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>