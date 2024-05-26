<%@ page import = "file.fileDAO" %>
<%@ page import = "java.io.File" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <!--  동일한 이름의 파일이 존재하면 이름을 바꿔줌 -->
<%@ page import ="com.oreilly.servlet.MultipartRequest" %> <!--  파일 업로드 수행기능 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>음악 리믹스 커뮤니티 사이트</title>
<style>
 .background-image {
        background-image: url(image/main_image3.jpg);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
    }
</style>
</head>
<body  class="background-image">
	
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

	}else{	
	
	
		String directory = application.getRealPath("/upload/"); // 업로드 파일에 다운로드 파일을 저장하는 객체 application
		int maxSize = 1024 *1024 * 100;
		String encoding = "UTF-8";
		
		
		MultipartRequest multipartRequest 
		= new MultipartRequest(request ,directory , maxSize ,encoding , 
				new DefaultFileRenamePolicy()); // 파일 전송을 위한 객체
		
		String fileName =multipartRequest.getOriginalFileName("file");
		String fileRealName =multipartRequest.getFilesystemName("file");
		
		new fileDAO().upload(fileName , fileRealName);
		
		
	}
	%>
	<div class ="jumbotron">
			<div class ="container">
			<h1 >파일이 성공적으로 업데이트 되었습니다!</h1>
			<input type="button" value="이곳을 클릭하세요!" onclick="history.back()" style ="background:#000000; font-size:20px; color:#ffffff">
			</div>
		</div>
		
	<br>
	
</body>
</html>