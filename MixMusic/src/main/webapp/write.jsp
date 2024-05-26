<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>JSP 게시판 웹 사이트</title>
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
        background-image: url(image/main_image2.jpg);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
    }
    .jumbotron{
	background-color: rgba( 0, 0, 0, 0.5 );
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
	<nav class="navbar navbar-default" style="background-color:#000000; border:#000000" >
		<div class="navbar-header" >
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <!-- 메뉴 오른쪽 아이콘 바 -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp" style ="color:#ffffff;">음악 리믹스 커뮤니티 사이트</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp" style="background-color:#000000; border:#000000;color:#ffffff;">메인</a>
				<li><a href="bbs.jsp" style ="color:#ffffff;">게시판</a>
				<li><a href="fileDownload.jsp" style ="color:#ffffff;">음악저장소</a>
				<li><a href="productionspace.jsp" style ="color:#ffffff;">음악제작소</a>
			</ul>
			<%
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style ="color:#ffffff;">접속하기<span class="caret"></span></a>
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
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
		
	<div class="container">
		<div class="row" >
			<div class="jumbotron" >
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; ">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center; color:#000000">음악 리믹스 커뮤니티 사이트
								</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr style = "background-color:#ffffff">
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>

					</tbody>
				</table>
				
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" style = "background-color:#000000; border:#ffffff"></a>
			</form>
			
			<br>
			<form action="uploadAction.jsp" method="post"
					enctype="multipart/form-data">
					파일 : <input type="file" name="file" style="color:#ffffff"><br> <input
						type="submit" value="업로드" style = "background-color:#000000; color:#ffffff"><br>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>