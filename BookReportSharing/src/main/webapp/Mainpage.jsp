<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connect Recrods</title>
    <link href="page/css//Mainpage.css" rel="stylesheet">


</head>
<body style="margin: 0;">
    <div class="container">
    
    <!-- 헤더 시작 -->
    <header class="header">
        <div class="header_box" style="flex-grow: 3">
            <a href="Mainpage.html"><img src="../img/Group 13.png" style="height: 100%; padding-top: 5px;"></a></div>
        <div class="header_box" style="flex-grow: 2;"></div>
        <div class="header_box"><p class="header_login" style="flex-grow: 3;"> 
            <a href="./Loginpage.html" style="text-decoration: none;">
            <%= request.getAttribute("id")
            	
            %></a></p></div>
    </header>
    <!-- 헤더 끝 -->

    <!-- 메인 시작 -->
    <div class="main_content">
    <button id="write_btn">+</button>
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
            <div class="main_picutures_sub"></div>
            <span class="main_picutures_today_viewmore">Veiw more...</span>
        </div>
    </div>
    <!-- 메인 그림 조회 끝 -->

    </div>
    <!-- 푸터 시작  -->
    <footer class="footer">
    <div class="footer_box" style="flex-grow: 3">
        <img src="../img/footer_lang.png" 
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
</body>
</html>




