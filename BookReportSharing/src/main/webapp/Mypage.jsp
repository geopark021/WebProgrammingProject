<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connect Recrods</title>
    <link href="page/css//Mypage.css" rel="stylesheet">


</head>
<body style="margin: 0;">
    <div class="container">
    
    <!-- 헤더 시작 -->
    <header class="header">
        <div class="header_box" style="flex-grow: 3">
            <a href="Mainpage.jsp"><img src="page/img/Group 13.png" style="height: 100%; padding-top: 5px;"></a></div>
        <div class="header_box" style="flex-grow: 4;">
            <p class="header_login" style="flex-grow: 4;  font-size: 25px; font-weight: 600; color: #3D2500;"> 
                마이 페이지</p>
        </div>
        <div class="header_mypage"><p class="header_login" style="flex-grow: 1; margin-right:25px"> 
           <%=id %></p> </div>
    </header>
    <!-- 헤더 끝 -->

    <!-- 메인 시작 -->
    <div class="main_content">
    <button id="write_btn">+</button>

    <div class="left-panel">
        <img src="page/img/profile.png" alt="Image">
        <p style="font-weight: 700;"><%=id %></p>
        <p style="margin-top: 50px;">회원 정보 수정</p>
        <p>내 서평 모아보기</p>
        <p>좋아요한 서평 보기</p>
    </div>
    
    <div class="right-panel">
   	 	<div class="post-container" onclick="toggleClicked(this)">
    		<img src="page/img/main_searchbgimg.png" alt="Book Cover">
    		<div class="post-content">
    			<h2>책 제목</h2>
    			<p>일시: 2023-12-17</p>
    			<span>독후감 내용이 여기에 들어갑니다.</span>
    		</div>
    	</div>
	
	
   	 	<div class="post-container" onclick="toggleClicked(this)">
    		<img src="page/img/main_searchbgimg.png" alt="Book Cover">
    		<div class="post-content">
    			<h2>책 제목</h2>
    			<p>일시: 2023-12-17</p>
    			<span>독후감 내용이 여기에 들어갑니다.</span>
    		</div>
    	</div>		
		
	   	 	<div class="post-container" onclick="toggleClicked(this)">
    		<img src="page/img/main_searchbgimg.png" alt="Book Cover">
    		<div class="post-content">
    			<h2>책 제목</h2>
    			<p>일시: 2023-12-17</p>
    			<span>독후감 내용이 여기에 들어갑니다.</span>
    		</div>
    	</div>	
    	
    	   	 	<div class="post-container" onclick="toggleClicked(this)">
    		<img src="page/img/main_searchbgimg.png" alt="Book Cover">
    		<div class="post-content">
    			<h2>책 제목</h2>
    			<p>일시: 2023-12-17</p>
    			<span>독후감 내용이 여기에 들어갑니다.</span>
    		</div>
    	</div>	
    	
    	   	 	<div class="post-container" onclick="toggleClicked(this)">
    		<img src="page/img/main_searchbgimg.png" alt="Book Cover">
    		<div class="post-content">
    			<h2>책 제목</h2>
    			<p>일시: 2023-12-17</p>
    			<span>독후감 내용이 여기에 들어갑니다.</span>
    		</div>
    	</div>		


    </div>
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
                <img src="../img/faceb.png">
                <img src="../img/yout.png">
                <img src="../img/twit.png">
                <img src="../img/insta.png">
            </div>
        </div>
    </footer>  
    <!-- 푸터 끝 -->
</div>
<!-- 메인 끝-->

<script>
  function toggleClicked(element) {
    // 클릭 상태 토글
    element.classList.toggle("clicked");
  }
</script>
</body>
</html>




