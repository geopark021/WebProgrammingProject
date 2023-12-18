<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
// sql 문
String id = (String)session.getAttribute("id");
String get_all_record_sql = "select * from record_tbl"; 

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
   
    stmt= conn.createStatement(); 
    rs = stmt.executeQuery(get_all_record_sql);
    %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connect Recrods</title>
    <link href="page/css/Mainpage.css" rel="stylesheet">


</head>
<body style="margin: 0;">
    <div class="container">
    
    <!-- 헤더 시작 -->
    <header class="header">
        <div class="header_box" style="flex-grow: 3">
            <a href="Mainpage.jsp"><img src="page/img/Group 13.png" style="height: 100%; padding-top: 5px;"></a></div>
        <div class="header_box" style="flex-grow: 2;"></div>
        <div class="header_box"><p class="header_login" style="flex-grow: 3;"> 
            <a href="Mypage.jsp" style="text-decoration: none;">
            <%= id %>
            </a></p></div>
            <% if(id != null ) {%>
        <div class="header_box"><p class="header_login" style="flew-grow : 1"> <a href="Mainpage.jsp"> logout </a> </div>
        <% 
            }%>
    </header>
    <!-- 헤더 끝 -->

    <!-- 메인 시작 -->
    <div class="main_content">
    <button id="write_btn" onclick="window.location.href = 'Bookreviewpage_content.jsp';">+</button>
    <!-- 메인 검색 시작 -->
    <div class="main_search">
        <div class="main_search_box">
        <p style="margin: 0; padding-bottom: 40px; font-size: 40px;">
            Explore Books</p>
        <input class="main_search_input" type="text" placeholder="Enter a keyword.">
        <!-- 값 전달할 변수 이름 아직 정하지 않음-->
        </div>
    </div>
    <!-- 메인 검색 끝 -->

    <!-- 메인 그림 조회 시작 -->
    <div class="main_picutures">
        <div class="main_picutures_today">
            <p> Today's Recommends </p>
            <div class="main_picutures_sub"></div>
            <span class="main_picutures_today_viewmore">Veiw more...</span>
        </div>
        <div class="main_picutures_separator"></div>
        <div class="main_picutures_today">
            <p> Recent Book Reviews </p>
            <div class="main_picutures_sub">
            <table border="1" width="100%">
            <tr>
            	<td width="20%"> 독후감 고유번호</td>
            	<td width="40%"> 독후감 작성자</td>
            	<td width="40%"> 독후감 작성일자</td>
            </tr>
                <% 
    while(rs.next()){
    	String record_id = rs.getString("record_id");
    	String uindex = rs.getString("uindex");
    	String get_name_sql = "select unickname from user_tbl where uindex = " + uindex;
    	stmt= conn.createStatement(); 
        ResultSet rs2 = stmt.executeQuery(get_name_sql);
    	rs2.next();
    	String unickname = rs2.getString("unickname");
    	String date = rs.getString("record_date");
    	%>
    	    <tr>
            	<td width="20%"> <%=record_id %></td>
            	<td width="40%"> <%=unickname %></td>
            	<td width="40%"> <%=date %></td>
            </tr>
    <% 	
    }
    %>
    </table>
    <% 
}
catch(Exception e){
	out.println("DB 연동 오류입니다. : " + e.getMessage());
}
finally{
	
}
	
%>
            </div>
            
            <span class="main_picutures_today_viewmore">Veiw more...</span>
        </div>
    </div>
    <!-- 메인 그림 조회 끝 -->

    </div>
    <!-- 푸터 시작  -->
    <footer class="footer">	
    <div class="footer_box" style="flex-grow: 3">
        <img src="page/img/footer_lang.png" 
        style="padding-top: 15px; padding-left: 15px;"></div>
        <div class="footer_menu">
            <div class="footer_menu_text">
                <p>공지사항</p><p>이용약관</p><p>개인정보처리방침</p><p>고객지원</p>            
            </div>
            <div style="flex-grow: 3;"></div>
            <div class="footer_menu_img">
                <img src="page/img/faceb.png">
                <img src="page/img/yout.png">
                <img src="../img/twit.png">
                <img src="../img/insta.png">
            </div>

        </div>

    </footer>  
    <!-- 푸터 끝 -->
</div>
<!-- 메인 끝-->

<script>
	function redirectToOtherPage(){
		<% %>		
	}
</script>
</body>
</html>




