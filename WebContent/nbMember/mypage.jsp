<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro.jsp</title>
<link rel="stylesheet" href="<%=contextPath%>/nbMember/mypage.css">
</head>
<body>
	 <div class="myPageWrapper">
		 <div class="myPageContainer">
			<div class = "myPageTop">
				<div class ="myPageLeft" style="background-color: #3DB7CC;">
					<div id="myPageLeftTop">
					<a>가입시 이미지?</a>
					<br><br>ㅇㅇㅇ님 (아이디)<br><br>
					<a href="#" class="btn">내 정보 관리</a>
					<a href="#" class="btn">반려동물 정보 관리</a> 
					</div>
				</div>
				<div class = "myPageRight mptr">
					<div onclick="location.href ='<%=contextPath%>/nbMain.jsp'">
						<img class = "mypageImg" alt="" src="<%=contextPath%>/images/deli.png">&nbsp;&nbsp;&nbsp;주문 조회
					</div>
					<div>
						<img class = "mypageImg" alt="" src="<%=contextPath%>/images/cart.png">&nbsp;&nbsp;&nbsp;장바구니
					</div>
					<div onclick="location.href = '<%=contextPath%>/nbBoard/trainerboard.jsp'">
						<img class = "mypageImg" alt="" src="<%=contextPath%>/images/info.png">&nbsp;&nbsp;&nbsp;훈련사 상담
					</div>
				</div> 
			</div>	 
			<div class ="myPageBottom">
				<div class = "myPageLeft mpbl">
					<div>
					<img class = "mypageImg" alt="" src="<%=contextPath%>/images/lessonlist.png">&nbsp;&nbsp;&nbsp;레슨 목록
					</div>
				</div>
				<div class ="myPageRight mpbr">
					<div>
					<img class = "mypageImg" alt="" src="<%=contextPath%>/images/lesson.png">&nbsp;&nbsp;&nbsp;레슨 신청
					</div>
				</div>
			</div>
		 </div>
	 </div>
	 
</body>
</html>