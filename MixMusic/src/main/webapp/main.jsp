<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1"> <!--반응형으로 적용시켜줌 -->
<link rel="stylesheet" href="css/bootstrap.css"> 
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style>
body {
	background-color: #000000;
	color: #000000;
}

.jumbotron {
	background-color: #800080;
}

li {
	font-family: Hanna;
	font-size: 20px;
}

.background-image {
	background-image: url(image/main_image2.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
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
	
	<nav class="navbar navbar-default" style="background-color: #000000; border: #000000">
		<%---- 특징 :배경색,텍스트 스타일,여백등을 기본값으로 설정 부트스트랩에서 제공하는 기본적인 네비바 --%>
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span><!-- 작대기의 개수 -->
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
				<!-- 메뉴 오른쪽 아이콘 바 적대기 세개-->
			</button>
			<a class="navbar-brand" href="main.jsp" style="color: #ffffff;">음악<!--navbar-brand 를 통해 로고글 등록 -->
				리믹스 커뮤니티 사이트</a>
		</div>
		
		<div class="collapse navbar-collapse" <%-- class="collapse navbar-collapse" 메뉴의 내용이 작은 화면에서 숨겨지거나 축소 --%>
			id="bs-example-navbar-collapse-1"> <%-- id="bs-example-navbar-collapse-1" 축소된 화면을 보여주고나 숨길수 있는 제어기능 id --%>
			<ul class="nav navbar-nav">   <%-- class="nav navbar-nav" 메뉴들의 항목을 나타냄 항목들이 수평으로 표시되고, 스타일링되며, 탐색 메뉴의 일부로 인식 --%>
				<li class="active"><a href="main.jsp"
					style="background-color: #000000; border: #000000; color: #ffffff;">메인</a>
				<li><a href="bbs.jsp" style="color: #ffffff;">게시판</a>
				<li><a href="fileDownload.jsp" style="color: #ffffff;">음악저장소</a>
				<li><a href="productionspace.jsp" style="color: #ffffff;">음악제작소</a>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right"> <%-- class="nav navbar-nav navbar-right" 탐색 메뉴의 항목들을 오른쪽 정렬 --%>
				<li class="dropdown"><a href="#" class="dropdown-toggle" <%--  메뉴가 확장되거나 접힐수 있게 도와줌 ,a href ="#"은 따로 어디로 이동하지않고 클릭하면 메뉴가 보임 --%>
					data-toggle="dropdown" role="button" aria-haspopup="true" <%-- data-toggle="dropdown" 동작을 정의 --%>
					aria-expanded="false" style="color: #ffffff;">접속하기<span <%--role="button" aria-haspopup="true" aria-expanded="false"는 접근성(aria) 속성으로, 드롭다운 메뉴와 관련된 역할과 상태를 나타냅니다. --%>
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
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
			<%---- 위쪽에 있는 nav 바이고 user가 널일떄와 아닐때 오른쪽에 뜨는 것이 각각다르다  --%>
	</nav>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>자신만의 리믹스 곡을 만들어보세요!</h1>
				<p style="font-family: Hanna">환영합니다! 이곳은 많은 곡들을 리믹스 하여 새로운 곡으로
					만들고 배포하는 리믹스 커뮤니티 사이트 입니다 나만의 노래를 제작해보고 게시해주세요!</p>
				<p>
					<a class="btn btn-primary" href="productionspace.jsp" <%-- class="btn btn-primary" 부트스트랩에서 제공하는 기본 버튼  --%>
						role="button"
						style="background-color: #9932CC; color: #000000; font-size: 20px; font-family: Hanna">제작
						하러가기!</a>
				</p>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">  <%--  class="carousel slide"이미지나 다른 콘텐츠를 자동으로 전환하거나 사용자 상호작용에 따라 이동 --%>
			<ol class="carousel-indicators">								<%-- data-ride="carousel" 이 설정은 슬라이더를 자동으로 시작하고, 사용자 입력에 따라 슬라이딩을 제어하는 기능 --%>
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li> <%-- active로 시작점울 줌  --%>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner"> <%--  class="carousel-inner" 내부 이미지를 넣게 해주는 컨테이나  --%>
				<div class="item active">
					<img src="image/main_image1.png">
				</div>
				<div class="item">
					<img src="image/main_image2.jpg">
				</div>
				<div class="item">
					<img src="image/main_image3.jpg">
				</div>
				<div class="item">
					<img src="image/main_image10.jpg">
				</div>
			</div>
			
			<a class="left-carousel-control"<%--스타일링을 위해 사용 --%> href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"><%--부트스트랩 아이콘  --%></span> 
			</a> 
			
			<a class="right-carousel-control"<%--스타일링을 위해 사용 --%>  href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"><%--부트스트랩 아이콘  --%></span>
			</a>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>