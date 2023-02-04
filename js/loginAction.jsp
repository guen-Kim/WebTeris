<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" /> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		//로그인 된 사람 로그인 막기  session 이용!
		String userID = null;
		if(session.getAttribute("userID") != null) 
		{
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null ) 
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword()); // 로그인 결과 처리
		if (result == 1 ) {
			session.setAttribute("userID", user.getUserID()); // 세션ID 부여
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); // 페이지 이동
			script.println("</script>");
		}
		else if (result == 0 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')"); 	// 비밀번호 틀림
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");			//이전 페이지로 이동 시킴
			script.println("</script>");
		}
		else if (result == -2 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");				//이전 페이지로 이동 시킴
			script.println("</script>");
		}
	%>

</body>
</html>