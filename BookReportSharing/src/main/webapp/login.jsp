<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginJSP</title>
</head>
<body>
<%

	// Loginpage.html에서 사용자로부터 username, password를 입력 받은 것 저장하기
	String input_username = request.getParameter("username");
	String input_password = request.getParameter("password"); 
	boolean isValidUser = false; 
	
	
	// 사용자 입력값 유효성 검사 
	if(input_username != null && input_password !=null){
		
		// 데이터베이스 연동에 필요한 객체 초기화 
		Connection conn = null;
		PreparedStatement pstmt = null; // sql injection 방지용
		ResultSet rs = null;
		
		try {
			// 데이터베이스 연동 
			Class.forName("com.mysql.jdbc.Driver");
	        String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
	        conn = DriverManager.getConnection(jdbc_url, "root", "1234");
	        
	          
	 		// user_tbl로 사용자로부터 입력받은 username의 password값 가져옴
	        String search_sql = "SELECT password FROM user_tbl WHERE unickname = ?";
	        pstmt = conn.prepareStatement(search_sql);  // 쿼리 준비, 실행x
	        pstmt.setString(1, input_username); // ? placeholder에 들어가는 내용
	        		  
	        rs = pstmt.executeQuery();
	          
	        if(rs.next()){
	        	String retrivedPassword = rs.getString("password"); // 데이터베이스에서 조회한 비밀번호
	        	// 데이터베이스에서 조회한 비밀번호와 사용자가 입력한 비밀번호 일치한 경우 
	        	if(retrivedPassword != null && retrivedPassword.equals(input_password)){
	        		isValidUser = true; 
	        	}
	        }
	        
	        // 사용자의 username과 password 가 데이터베이스에 존재하는 경우 
	        if(isValidUser){
	        	out.println("<p> 로그인 성공 ! </p>");
	        }else {
	        	out.println("<p> 로그인 실패. 유효하지 않은 username과 password를 입력했습니다.</p>");
	        }
	        
	        
	          
		} catch(Exception e){
			out.println("<p>Error : " + e.getMessage() + "</p>");
			
		}finally {
			if(rs!= null) try { rs.close();} catch (SQLException e ) {}
			if(pstmt != null) try { pstmt.close();} catch (SQLException e ) {}
			if(conn != null) try { conn.close();} catch (SQLException e ) {}
			
		}
	}
	
%>

</body>
</html>