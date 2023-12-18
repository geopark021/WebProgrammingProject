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
	
  
    // 사용자가 선택한 그림 정보 처리. 사용자가 선택한 그림의 record_img_id를 세션에서 가져오기
    int record_img_id = (int) session.getAttribute("selectedPictureValue");
    
    // sql 문
    String record_info_sql = "INSERT INTO record_tbl (record_id, uindex, book_name, content, record_img_id) VALUES (?, ?, ?, ?, ?)";

    // 객체 초기화
    Connection conn = null; 
    PreparedStatement pstmt = null;
    boolean hasError = false;
    String errorMessage = "";

    try {
    	//
    	// JDBC 연결 설정
    	Class.forName("com.mysql.jdbc.Driver");
        String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
        conn = DriverManager.getConnection(jdbc_url, "root", "1234"); 
		
        pstmt = conn.prepareStatement(user_info_sql);
        
        
    }
    
    // 다음 단계로 넘어가거나, 결과 페이지로 리다이렉트
    // 예: response.sendRedirect("result.jsp");
%>
</body>
</html>