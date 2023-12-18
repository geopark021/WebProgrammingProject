<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록부</title>
</head>
<body>


<%
	// 사용자 입력을 세션에 저장
	session.setAttribute("bookname", request.getParameter("name"));
	session.setAttribute("content", request.getParameter("content"));
	// Bookreviewpage_picture.html로 리다이렉트
	response.sendRedirect("Bookreviewpage_picture.jsp");
%>

</body>
</html>
