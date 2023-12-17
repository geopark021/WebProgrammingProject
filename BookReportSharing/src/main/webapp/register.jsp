<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<%

	// register.jsp
    // form으로 받은 내용 저장 
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String defaultImagePath = "../img/defaultProfile.png"; // 회원가입 후 적용할 사용자 기본 프로필 사진 경로 
    String user_info_sql = "INSERT INTO user_tbl (uemail, password, unickname, profileImg) VALUES (?, ?, ?, ?)";
    
    // 객체 초기화
    Connection conn = null; 
    PreparedStatement pstmt = null;
    boolean hasError = false;
    String errorMessage = "";

    // 유효성 검사 
    if(username == null || email == null || password == null || 
       username.isEmpty() || email.isEmpty() || password.isEmpty()) {
        hasError = true;
        errorMessage = "모든 항목을 빠짐없이 입력해주시키 바랍니다.";
    }

    // 에러 없을 때 user_tbl에 insert 진행
    if (!hasError) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
            conn = DriverManager.getConnection(jdbc_url, "root", "1234"); 

            pstmt 
            = conn.prepareStatement(user_info_sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password); // 실제 구현 시 해시 함수 돌려야함 
            pstmt.setString(3, username);
            pstmt.setString(4, defaultImagePath);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                // 회원가입 성공(데이터베이스에 insert 성공)
                response.sendRedirect("page/html/Loginpage.html");
                return;
            } else {
                // 회원가입 실패 
                errorMessage = "데이터 삽입에 실패했습니다. 다시 시도해주세요.";
            }
        } catch (Exception e) {
            errorMessage = "DB 연동 오류 입니다. : " + e.getMessage();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }

    // 에러 있을 때 표시 
    if (hasError) {
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
    }
%>

</body>
</html>
