<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style>
body {
	background-color: #000000;
	color: #000000;
}

li {
	font-family: Hanna;
	font-size: 20px;
}

.background-image {
	background-image: url(image/main_image1.png);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.file-list-wrapper {
	height: 400px;
	overflow-y: scroll;
	margin-top: 100px;
	background: #000000;
	margin-left: 20px;
}

.file-list {
	text-align: center;
	font-size: 18px;
}

.jumbotron {
	background-color: rgba(255, 255, 255, 0.5);
}

.file-list a {
	text-decoration: none; /* 밑줄 제거 */
	color: #ffffff; /* 글씨를 하얀색으로 설정 */
}

.file-list-wrapper::-webkit-scrollbar {
	width: 0.5em;
}

.file-list-wrapper::-webkit-scrollbar-track {
	background-color: transparent;
}

.file-list-wrapper::-webkit-scrollbar-thumb {
	background-color: #888;
	border-radius: 0.5em;
}
</style>
</head>
<body class="background-image">

	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");

	}
	%>
	<nav class="navbar navbar-default"
		style="background-color: #000000; border: #000000">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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

	<div class="jumbotron">
		<H1 style="color: #ffffff; text-align: center;">리믹스 음악저장소</H1>
		<div class="file-list-wrapper">

			<div class="file-list">
				<%
				String directory = application.getRealPath("/upload/"); // 업로드 파일을 가져와서 directory담는다
				String files[] = new File(directory).list();
				
				for (int i = files.length-1; i >= 0; i--) {
				    String file = files[i];
					out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
					+ java.net.URLEncoder.encode(file, "UTF-8") + "\">" + file + "</a><br><hr>");
				}
				%>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>