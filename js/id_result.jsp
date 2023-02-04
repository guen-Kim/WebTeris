<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    
    
    <%
	request.setCharacterEncoding("utf-8");
	String userID = request.getParameter("num1");
	
	UserDAO userdao = new UserDAO();
		int score	= userdao.getScore(userID);
		
	out.print(score + "점");
	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>