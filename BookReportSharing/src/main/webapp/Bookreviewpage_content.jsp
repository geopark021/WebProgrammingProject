<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date currentDate = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 EEEE a hh:mm");
	String formattedDate = dateFormat.format(currentDate);
	session.setAttribute("date", formattedDate);
%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connect Recrods</title>
    <link href="page/css/Bookreviewpage_content.css" rel="stylesheet">


</head>
<body style="margin: 0;">
    <div class="container">
    
    <!-- 헤더 시작 -->
    <header class="header">
        <div class="header_box" style="flex-grow: 2">
            <img src="page/img/Group 13.png" style="height: 100%; padding-top: 5px;"></div>
        <div class="header_box" style="flex-grow: 2;">
            <p class="header_login" style="flex-grow: 3; font-size: 25px; font-weight: 600; color: #3D2500;"> 
                독후감 작성 페이지</p>
        </div>
        <div class="header_mypage"><p class="header_login" style="flex-grow: 3;"> 
            마이 페이지</p> </div>
        <div class="header_mypage"><p class="header_login" style="flex-grow: 3;"> 
            <%=session.getAttribute("id") %></p> </div>
    </header>
    <!-- 헤더 끝 -->

    <!-- 메인 시작 -->
    <div class="main_content">
    <div class="main_adage"><span style="font-size: 20px;">"책 속에서 우리는 또 다른 삶을 산다"</span></div> 
   
    <!-- 작성 폼 시작 -->
    <form action="processContent.jsp" method="post">

        <div class="form-group">
          <label for="name">책 제목</label>
          <input type="text" id="name" name="name" placeholder="책 제목 입력"
            style="width: 725px; font-size: 14px;  padding: 10px;
                border-color: #CDCDCD;"
          >
        </div>
        <div class="form-group">
            <label for="user">작성자</label> <span><%=session.getAttribute("id") %></span>
        </div>
        <div class="form-group">
          <label for="date">작성일자</label> <span><%=formattedDate %></span>
        </div>
        <div class="form-group">
            <label for="content">독후감 내용</label> 
            <textarea id="content" name="content" placeholder="독후감 내용을 작성해주세요"></textarea>
        </div>
  		 <div class="form-group_btn">
            <input class="input_button" type="button" value="취소"  onclick="window.location.href='Mainpage.jsp';" style="background-color:#CAC0B1">
            <input class="input_button" type="submit" value="다음  ->" style="background-color:#7c633d">
            
        </div>
      </form>
    <!-- 작성 폼 끝 -->

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
                <img src="page/img/twit.png">
                <img src="page/img/insta.png">
            </div>

        </div>

    </footer>  
    <!-- 푸터 끝 -->
</div>
<!-- 메인 끝-->

</body>
</html>






