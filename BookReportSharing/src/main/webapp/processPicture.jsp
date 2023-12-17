<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // 세션에서 데이터 검색
    String bookName = (String) session.getAttribute("bookname");
    String content = (String) session.getAttribute("content");
    // 사용자가 선택한 그림 정보 처리
    // ...

    // 다음 단계로 넘어가거나, 결과 페이지로 리다이렉트
    // 예: response.sendRedirect("result.jsp");
%>
</body>
</html>