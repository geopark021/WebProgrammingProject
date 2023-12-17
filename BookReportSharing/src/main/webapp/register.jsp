<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<%
    // Initialize variables
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String defaultImagePath = "../img/defaultProfile.png"; // Adjust path as needed
    String user_info_sql = "INSERT INTO user_tbl (uemail, password, unickname, profileImg) VALUES (?, ?, ?, ?)";
    
    // Initialize resources
    Connection conn = null; 
    PreparedStatement pstmt = null;
    boolean hasError = false;
    String errorMessage = "";

    // Validate input
    if(username == null || email == null || password == null || 
       username.isEmpty() || email.isEmpty() || password.isEmpty()) {
        hasError = true;
        errorMessage = "모든 항목을 빠짐없이 입력해주시키 바랍니다.";
    }

    // If no error, try to register the user
    if (!hasError) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String jdbc_url = "jdbc:mysql://localhost:3306/book_report_sharing?serverTimezone=UTC";
            conn = DriverManager.getConnection(jdbc_url, "root", "1234"); // Use your database credentials

            pstmt 
            = conn.prepareStatement(user_info_sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password); // In a real scenario, password should be hashed
            pstmt.setString(3, username);
            pstmt.setString(4, defaultImagePath);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                // Registration successful
                response.sendRedirect("page/html/Loginpage.html");
                return;
            } else {
                // Registration failed
                errorMessage = "데이터 삽입에 실패했습니다. 다시 시도해주세요.";
            }
        } catch (Exception e) {
            errorMessage = "DB 연동 오류 입니다. : " + e.getMessage();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }

    // Show error message if there was a problem
    if (hasError) {
        out.println("<p style='color: red;'>" + errorMessage + "</p>");
    }
%>
<!-- Registration form or other content goes here -->
</body>
</html>
