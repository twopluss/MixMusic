<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}

li {
	font-family: Hanna;
	font-size: 20px;
}

body {
	background-color: #000000;
}

.background-image {
	background-image: url(image/main_image1.png);
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.jumbotron {
	background-color: rgba(0, 0, 0, 0.5);
}
</style>
</head>
<body class="background-image">
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) { // Bbs.java 에서 가져옴 
		userID = (String) session.getAttribute("userID"); 
	} // 로그인 한 사용자에게 세션을 부여해준다 
	
	int pageNumber = 1; // 기본값 설정
	if (request.getParameter("pageNumber") != null) { //BbsDAO.java 에서 가져옴 
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	} //이 코드는 게시판 페이지에서 사용자가 지정한 페이지 번호를 가져와서 pageNumber 변수에 저장하는 역할을 합니다. 

	
	%>
	<nav class="navbar navbar-default"
		style="background-color: #000000; border: #000000">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<!-- 메뉴 오른쪽 아이콘 바 -->
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp" style="color: #ffffff;">음악 리믹스 커뮤니티 사이트</a>
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
					aria-expanded="false" style="color: #ffffff;">회원관리<span
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
	<div>
		<div class="container" style="border-radius: 20px">
			<div class="row"> <%-- 부트스트랩 그리드 시스템에서 행을 정의하는 클래스입니다 --%>
				<div class="jumbotron">
					
					<table class="table table-striped" <%--- 테이블의 레이아웃과 스타일을 조정하여 보다 향상된 시각적 효과를 제공합니다 --%>
						style="text-align: center; border: 1px solid #000000;">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">번호</th>
								<th style="background-color: #eeeeee; text-align: center;">제목</th>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								

							</tr>
						</thead>
						
						<tbody style="background-color: #D3D3D3">
							<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><%=list.get(i).getBbsID()%></td>
								<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
								<%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
		.replaceAll("\n", "<br>")%></a></td>
								<td><%=list.get(i).getUserID()%></td>
								<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
		+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
								
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					
					<%
					if (pageNumber != 1) {
					%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
						class="btn btn-success btn-arraw-Left"
						style="background-color: #000000; border: #000000">이전</a>
					<%
					}
					if (bbsDAO.nextPage(pageNumber + 1)) {
					%>
					<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
						class="btn btn-success btn-arraw-Left"
						style="background-color: #000000; border: #000000">다음</a>
					<%
					}
					%>
					<a href="write.jsp" class="btn btn-primary pull-right"
						style="background-color: #000000; border: #000000">글쓰기</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>