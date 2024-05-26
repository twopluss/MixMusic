<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %> <%--만든 클래스를 가져온다 --%>
<%@ page import="java.io.PrintWriter" %> <%--  자바 스크립트 문장을 사용하기 위해 만듬--%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" /> <%-- 자바 빈즈 사용법 --%>
<jsp:setProperty name="user" property="userID" /> <%-- 입력받은 id값과 user 에 있는것과 연동 자바 빈즈 사용법 login에 있는 데이터를 가져옴--%>
<jsp:setProperty name="user" property="userPassword" /> <%-- 자바 빈즈 사용법 login에 있는 데이터를 가져옴 --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} // login 을 성공할떄 session 을 부여함으로서 세션곤리가 가능하다 
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO(); // 객체를 생성해야 이 페이지에서 이용이 가능하다 	
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); // 유저 로그인 함수(자바)에다가 아이디와 패스워드 적용헤서 나온값(-2 or 1 or ... ) result저장
		
		if (result == 1) {
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter(); // 스크립트 문장을 유동적으로 사용하기 위한 선언
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>