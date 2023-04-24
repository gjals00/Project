<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>    
<% request.setCharacterEncoding("utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유 게시판 | 도박 중독 개선 서비스</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main_board_write.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap');
        </style>
<script type="text/javascript">
        	
     function logout_check() 
     {
    	 
    	 if(confirm("로그아웃 하시겠습니까?"))
    	 {
    		 alert("로그아웃 처리되었습니다.");
    		 location.href='/logout.do';
    	 }   	 
	  }
     
     function my_info() 
     {
    	 location.href='/userlist?user_id=${user_id}';
	 }
     
     function checkBoard() 
     {
    	 var signup = document.signup;
         var board = document.getElementById("wrtie_choice");
         var result = board.options[board.selectedIndex].value;
         
         if(result == "자유")
         {
        	 alert("자유게시판  글 작성이 완료되었습니다.")
             signup.method = "post";
     		 signup.action = "/freewrite.do";
     		 signup.submit(); //자바스크립트에서 서블릿으로 전송
         }
         else
         {
        	 alert("성공사례 게시판 글 작성이 완료되었습니다.")
             signup.method = "post";
     		 signup.action = "/successwrite.do";
     		 signup.submit(); //자바스크립트에서 서블릿으로 전송
         }
	 }
     </script>
</head>
<body>
  <div id="container">
    <header>
        <div id="logo">
            <a href="/main">
                <img src="${pageContext.request.contextPath}/resources/images/main_logo.png" alt="메인 로고">
            </a>
        </div>
        <nav>
            <ul id="topMenu">
                <li><a href="#">예측 분석 <span>▼</span></a>
                <ul>
                  <li><a href="/predictive1">도박 수요 증감 예측</a></li>
                  <li><a href="/predictive2">도박 범죄 유형별 증감 예측</a></li>
                  <li><a href="/predictive3">도박 중독 치유/재활 참여 예측</a></li>
                </ul>
            </li>
            <li><a href="#">커뮤니티<span>▼</span></a>
                <ul>
                    <li><a href="/freeBoard?pageNumber=1">자유 게시판</a></li>
                    <li><a href="/successBoard?pageNumber=1">성공사례 게시판</a></li>
                </ul>
            </li>
            		<li><a href="/map">가까운 센터</a></li>
            		<li><a href="/selfTest">자가진단 테스트</a></li>
            </ul>
           <c:if test="${user_id == null}">
						<div id="login">
          				<a href="/main_login">
              			<img id="main_login" src="${pageContext.request.contextPath}/resources/images/main_login2.png" alt="메인 로그인">
          				</a>
      					</div>
					</c:if> 
					<c:if test="${user_id != null}">
						<div id="login_info">
            			<p>${user_id}님 환영합니다.</p>
        				</div>
        				<div id="login_service">
        				<a onclick="my_info()"><p>내정보</p></a>
            			
             			<a onclick="logout_check()"><p>로그아웃</p></a>
        				</div>
					</c:if>   
        </nav>
    </header>

    <div id="box">
        <h1>커뮤니티 </h1><br>
        <div id="pp">
            <p>게시판을 선택하여 자유롭게 글을 작성해주세요.</p>
        </div>
        <form id="signup" name="signup">
            <h2>글쓰기</h2>
        <ul>
        <div id="write">
            <li>
                <label for="wrtie_choice">게시판 선택</label>
                    <select id="wrtie_choice">
                        <option selected value="자유">자유</option>
                        <option value="성공">성공사례</option>
                    </select>
            </li>
            <li>
                <label for="write_title">제목</label><br>
                <input id="write_title" name="write_title" type="text" placeholder="제목을 입력하세요" required autofocus>
            </li>
            <li>
                <label for="write_text">내용</label><br>
                <textarea id="write_text" name="write_text" type="text" placeholder=" 내용을 입력하세요" required ></textarea>
            </li>
            <li>
            <input type="hidden" id="write_id" name="write_id" value="${user_id}">
            </li>
        <div class="ok">
            <input type="button" onclick="checkBoard()"  value="등록">
        </div>
      </ul>
      </form>
    </div>
        <footer>
            <div id="bottomMenu">
                <ul>
                    <li><a href="#">© Gambling Addiction Improvement Service</a></li>
                    <li><a href="#">개인정보 처리방침</a></li>
                    <li><a href="#">이용 약관</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">데이터 출처</a></li>
                </ul>
            </div>
            <div id="company">
                <p>서울특별시 OO구 OO동 OO로 | 대표전화 : 02-000-1234</p>
            </div>
           </footer>    
</div>
</body>
</html>

</body>
</html>