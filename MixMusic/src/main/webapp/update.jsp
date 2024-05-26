<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
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
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
	%>
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
				<li><a href="bbs.jsp" style ="color:#ffffff;">게시판</a>
				<li><a href="fileDownload.jsp" style ="color:#ffffff;">음악저장소</a>
				<li><a href="productionspace.jsp" style ="color:#ffffff;">음악제작소</a>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style ="color:#ffffff;">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			
		</div>
	</nav>
	
	<div class="container">
		<div class="row">
		<div class="jumbotron" >
			<form method="post" action="updateAction.jsp?bbsID=<%=bbsID%>">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">음악 리믹스 커뮤니티 사이트</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value ="<%=bbs.getBbsTitle() %>"></td>
						</tr>
						<tr style = "background-color:#ffffff">
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%=bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글수정" style = "background-color:#000000; border:#ffffff"></a>
			</form>
			<form action="uploadAction.jsp" method="post"
					enctype="multipart/form-data">
					파일 : <input type="file" name="file"><br> <input
						type="submit" value="업로드" style = "background-color:#000000;color:#ffffff"><br>
				</form>
			</div>	
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>