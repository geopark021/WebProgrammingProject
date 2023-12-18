<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Random" %>
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
	Random random = new Random();
	int randomNumber = random.nextInt(10001);
	String record_img_id = Integer.toString(randomNumber);
    // 세션에서 데이터 검색
    String bookName = (String) session.getAttribute("bookname");
	String content = (String) session.getAttribute("content");
	String date = (String)session.getAttribute("date");
	String id = (String)session.getAttribute("id");
	// 세션 id login.id에서 가져오기 - select 이용 
	
  
    // 사용자가 선택한 그림 정보 처리. 사용자가 선택한 그림의 record_img_id를 세션에서 가져오기
    //int record_img_id;//(int) session.getAttribute("selectedPictureValue");
    
    // sql 문
    String set_record_img ="insert into record_img_tbl (record_img_id,record_img) values(?,'asdfasdf')";
    String record_info_sql = "INSERT INTO record_tbl (uindex, book_name, content, record_img_id,record_date) VALUES ( ?, ?, ?, ?,?)";
	String get_user_index_sql = "select uindex from user_tbl where unickname = '" + id + "'"; 
    
    // 객체 초기화
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;
    boolean hasError = false;
    String errorMessage = "";

    try {
    	//
    	// JDBC 연결 설정
    	Class.forName("com.mysql.jdbc.Driver");
        String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
        conn = DriverManager.getConnection(jdbc_url, "root", "1234");
        
        pstmt = conn.prepareStatement(set_record_img);
        pstmt.setString(1,record_img_id);
        pstmt.executeUpdate();
        
        stmt= conn.createStatement(); 
        rs = stmt.executeQuery(get_user_index_sql);
        rs.next();
	
		String uindex = rs.getString("uindex");
        
        pstmt = conn.prepareStatement(record_info_sql);
        pstmt.setString(1,uindex);
        pstmt.setString(2,bookName);
        pstmt.setString(3,content);
        pstmt.setString(4,record_img_id);
        pstmt.setString(5,date);
        
        pstmt.executeUpdate();
    }
    catch(Exception e){
    	out.println("DB 연동 오류입니다. : " + e.getMessage());
    }
    finally{
    	
    }
    
    // 다음 단계로 넘어가거나, 결과 페이지로 리다이렉트
  
    response.sendRedirect("Mainpage.jsp");
%>
</body>
</html>