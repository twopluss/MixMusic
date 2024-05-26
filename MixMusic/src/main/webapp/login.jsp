<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1"> <!--  반응형 웹에 사용되는 테그 -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style>
body{
 background-color :#000000;
 color :#000000;
 }
li {
	font-family: Hanna;
	font-size: 20px;
}
 .background-image {
        background-image: url(image/main_image3.jpg);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
    }
</style>
</head>
<body class="background-image">
	<nav class="navbar navbar-default" style="background-color:#000000; border:#000000"> <!--  기본적인 스타일을 가진 네비게이션 바를 생성 -->
	<div class="navbar-header">
	<!--  햄버거 버튼  -->
		<button type="button" class="navbar-toggle collapsed" 
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
			aria-expanded="false"> <!--  해당 버튼이 접혀있는 작대기3 개의 작은 버튼  target가 동일한 아이디를 가진 테그를 불러옴 data-toggle="collase"는 크기를 축소 ,확장 기능-->
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
		</button>
	<!-- 좌측 위쪽에 제목 -->
		<a class="navbar-brand" href="main.jsp" style ="color:#ffffff;">음악 리믹스 커뮤니티 사이트</a>
	</div>
	
	
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> 
		<ul class="nav navbar-nav"> <!--class="collapse navbars-collapse"하위 항목을 숨기기 위한 컨테이너   -->
			<li><a href="main.jsp" style="background-color:#000000; border:#000000;color:#ffffff;">메인</a></li>
			<li><a href="bbs.jsp" style="color:#ffffff;">게시판</a></li>
			<li><a href="fileDownload.jsp" style ="color:#ffffff;">음악저장소</a>
			<li><a href="productionspace.jsp" style ="color:#ffffff;">음악제작소</a>
		</ul>
		
		<!--  오른쪽에 접속하기 (회원가입 ,로그인) -->
		<ul class="nav navbar-nav navbar-right">
		<!--class="dropdown-toggle" 드롭다운 기능을 활성화 하기위한 클래스  -->
			<li class="dropdown"><a href="#" class="dropdown-toggle" 
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false" style="color:#ffffff;">접속하기<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li class="active"><a href="login.jsp">로그인</a></li>
					<li><a href="join.jsp">회원가입</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</nav>
<!-- --------------------------------------------------------------------------------------------------------- -->	
	
	<!-- 로그인 화면 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
	
			<div class="jumbotron" style ="margin-top:100px ;background:#000000">
				<form method="post" action="loginAction.jsp">
					<h3 style="text-align: center; color:#ffffff">로그인 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인" style="background-color:#800080">
				</form>
				
			</div>
		<div class="col-lg-4"></div>
		</div>
		
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		
		
</body>
</html>



