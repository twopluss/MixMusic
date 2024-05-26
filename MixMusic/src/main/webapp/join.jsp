<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style>
body{
s
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
     .btn-primary.active,
    .btn-primary:active,
    .btn-primary:focus,
    .btn-primary:hover,
    .btn-primary:not(:disabled):not(.disabled).active {
        background-color: #800080;
        border-color: #800080;
    } 
</style>
</head>
<body class="background-image">
	<nav class="navbar navbar-default" style="background-color:#000000; border:#000000">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <!-- 메뉴 오른쪽 아이콘 바 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp" style ="color:#ffffff;">음악 리믹스 커뮤니티 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp" style="background-color:#000000; border:#000000;color:#ffffff;">메인</a>
				<li><a href="bbs.jsp" style="color:#ffffff;">게시판</a>
				<li><a href="fileDownload.jsp" style ="color:#ffffff;">음악저장소</a>
				<li><a href="productionspace.jsp" style ="color:#ffffff;">음악제작소</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="color:#ffffff;">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style ="margin-top:100px; background:#000000">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;color:#ffffff">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons"> <%--data-toggle="buttons" 버튼 그룹 생성 --%>
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off"<%--자동 완성 기능을 사용하지 않도록 설정 --%> value="남자" checked>남자 
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div> 
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일"<%--필드에 힌트 제공 --%> name="userEmail" maxlength="50">
					</div>
					<input type="submit" class="btn btn-primary from-control" value="회원가입" style="background-color:#800080">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>