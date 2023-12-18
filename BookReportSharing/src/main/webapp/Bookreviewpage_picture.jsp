<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Connect Recrods</title>
    <link href="page/css/Bookreviewpage_picture.css" rel="stylesheet">


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
            <a href="Mypage.jsp">마이 페이지</a></p> </div>
        <div class="header_mypage"><p class="header_login" style="flex-grow: 3;"> 
            <%=session.getAttribute("id") %></p> </div>
    </header>
    <!-- 헤더 끝 -->

    <!-- 메인 시작 -->
    <div class="main_content">
    <div class="main_adage"><span style="font-size: 20px; font-weight: 600; color: #3D2500;">그림 선택하기</span></div> 
   
    <!-- 작성 폼 시작 -->
    <form action="processPicture.jsp" method="post">
		<input type="hidden" name="action" value="savePicture"> <!-- 추가된 숨겨진 필드: 작업 유형을 지정 -->
	    <input type="hidden" id="selectedPicture" name="selectedPicture" value=""> <!-- 추가된 숨겨진 필드: 선택된 그림 ID -->

        <div class="form-group">
            <label for="user">해시태그 입력</label>  <input type="text" id="name" name="name" placeholder="#느꼈던 감정을 적어주세요"
            style="width: 725px; font-size: 14px;  padding: 10px;
                border-color: #CDCDCD;"
          >
        </div>
        <div class="form-group">
          <label for="date">작성일자</label> <span style="color:#808080"><%=session.getAttribute("date") %></span>
        </div>
        <hr style="border: 1px #DEDEDE solid; width: 100%;">
        <div class="form-group">
            <label>추천하는 그림</label>
        </div>
        <div class="form-group">
            <div class="bookreview_recommend_picture" value="0" >
            <img class="div-in-picture" src="page/img/image4.jpg" onclick="handleClick(this)">
            </div>
        </div>
        <div class="form-group">
            <label>이 그림은 어떠세요? </label> 
            <button class="refresh_btn">
                <img src="page/img/refresh_outline_24px.png" alt="이미지 설명">
            </button>
        </div>

        <div class="form-group" style="margin-left: 200px;">
            <!-- 첫 번째 자식 div -->
            <div class="child-div" value="1" >
            <img src="page/img/image1.jpg" class="div-in-picture" onclick="handleClick(this)">
            </div>
        
            <!-- 두 번째 자식 div -->
            <div class="child-div" value="2" >
            <img src="page/img/image2.jpg" class="div-in-picture" onclick="handleClick(this)">
            </div>
        
            <!-- 세 번째 자식 div -->
            <div class="child-div" value="3" >
            <img src="page/img/image3.jpg" class="div-in-picture" onclick="handleClick(this)">
            </div>
          </div>

        <div class="form-group_btn">
            <p id="selected_picture"></p>
            <input class="input_button" type="button" value="뒤로" onclick="window.history.back();" style="background-color:#CAC0B1">
            <input class="input_button" type="submit" value="등록  ->" style="background-color:#7c633d">
            
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
<!-- 수정 전
<script>
    let selectedDiv = null; // 선택된 div를 저장하는 변수

    window.onload = function () {
      const initialDiv = document.querySelector('[value="0"]');
      if (initialDiv) {
        handleClick(initialDiv);
      }
    };

    function handleClick(clickedDiv) {
      if (selectedDiv) {
        // 이미 선택된 div가 있다면 선택 해제
        selectedDiv.classList.remove('selected');
      }
      const value = clickedDiv.getAttribute('value');
      console.log('Selected Value:', value);

      // 선택된 div로 설정
      clickedDiv.classList.add('selected');
      selectedDiv = clickedDiv;
    }
  </script>
-->

<script>
    let selectedDiv = null; // 선택된 div를 저장하는 변수

    function handleClick(clickedDiv) {
        // 기존에 선택된 그림이 있으면 선택 해제
        if (selectedDiv) {
            selectedDiv.classList.remove('selected');
        }
        
        // 새로 클릭된 그림을 선택된 것으로 설정
        clickedDiv.classList.add('selected');
        selectedDiv = clickedDiv;
        
        // 숨겨진 필드에 선택된 그림의 value를 설정
        document.getElementById('selectedPictureValue').value = clickedDiv.getAttribute('value');
    }
    
    function isSelecedPicture(){
    	if(selectedDiv == null){
    		return false;
    	}
    }
</script>

</body>
</html>





