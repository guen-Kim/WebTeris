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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		String userID = null;
			int score;
		if(session.getAttribute("userID") != null) 
		{
			
			userID = (String) session.getAttribute("userID");
			UserDAO userDAO = new UserDAO();
		  	request.setCharacterEncoding("utf-8"); 
		  	score = Integer.parseInt(request.getParameter("param"));
		  	userDAO.addScore(userID, score);	//점수 업데이트
		  	PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'rankList.jsp'");
			script.println("</script>");
		  	
		  
		} else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('랭킹에 등록하려면 로그인이 필요합니다!')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		%>
</body>
</html>