<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
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
 background-color :#000000;
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
		int bbsID =0;
		if(request.getParameter("bbsID")!= null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);


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
		<div class="row">
			
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody style ="background-color:#D3D3D3">
						<tr>
							<td style ="width: 20%">글 제목</td>
							<td colspan ="2"><%=bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td >작성자</td>
							<td colspan ="2"><%=bbs.getUserID() %></td>
						</tr>
						<tr>
							<td >작성일자</td>
							<td colspan ="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
						<tr>
							<td >내용</td>
							<td colspan ="2" style="min-height:200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						
						
					</tbody>					
				</table>
				<a href ="bbs.jsp" class = "btn btn-primary" style ="background:#000000;border:#000000">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
						<a href="update.jsp?bbsID=<%= bbsID%>" class ="btn btn-primary" style ="background:#000000;border:#000000">수정</a>
						<a onclick ="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID%>" class ="btn btn-primary" style ="background:#000000;border:#000000">삭제</a>
				<% 
					}
				
				%>
				<br>
				<br>
				<a href ="fileDownload.jsp" class = "btn btn-primary" style ="background:#000000;border:#000000"><%=bbs.getUserID()%>님의 리믹스 곡 들으러 가기! </a>
		
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>