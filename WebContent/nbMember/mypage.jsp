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

<!-- 왼쪽 상단 버튼 이미지로 수정 예정. 내 정보수정, 반려동물 정보 수정 -->



<style type="text/css">


/*전체 Container*/
.myPageContainer {
	display : flex;
	flex-direction : column;
	justify-content : space-between;
	flex-wrap : wrap;
	position: relative;
	border: 1px solid black;
	width : 1250px;
	height : 750px;
}

/*위,아래로 div박스 크게 2개 나누고*/
.myPageTop {
	width : 100%;
	height : 500px;
	position : relative;
	justify-content : space-between;
	display : flex;
}
.myPageBottom {
	width : 100%;
	height : 200px;
	position : relative;
	justify-content : space-between;
	display : flex;
}

.myPageLeft {
	width : 49%;
	border: 1px solid black;
	display : flex;
	flex-direction: column-reverse;
	justify-content: center;
	align-items: center;
}        

.myPageRight {
	width: 49%;
	border: 1px solid black;
}        

#myPageLeftTop {
	position : relative;
	width : 500px;
	heigth : 200px;
	font-size: 24px;
	text-align: center;

}

.mptr div{
	width : 100%;
	height : 33%;
	border: 1px solid black;
	background-color: #EAEAEA;
	margin : auto;
	display : flex;
	align-items : center;
	justify-content : center;
	font-size: 30px;
	font : bold;
	cursor: pointer;
	overflow: hidden;
}

.mptr div>img {
	width : 100px;
}


/*왼쪽상단 버튼 CSS*/
.myButton {
	box-shadow:inset 0px 1px 3px 0px #91b8b3;
	background:linear-gradient(to bottom, #768d87 5%, #6c7c7c 100%);
	background-color:#768d87;
	border-radius:42px;
	border:1px solid #566963;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:11px 23px;
	text-decoration:none;
	text-shadow:0px -1px 0px #2b665e;
}
.myButton:hover {
	background:linear-gradient(to bottom, #6c7c7c 5%, #768d87 100%);
	background-color:#6c7c7c;
}
.myButton:active {
	position:relative;
	top:1px;
}
/*왼쪽상단 버튼 CSS*/        




</style>
</head>
<body>

	<!-- 	마이페이지  들어갈 항목 -->
	마이페이지 화면. jsp <br>
	 설명 : 회원 로그인 화면 기준으로 필요한 항목들 ( 주문내역 조회, 내정보 수정 , 반려견 정보 수정 , 1:1문의(?))<br>
	 <br>
	 체크사항 : 비회원 로그인 했을 경우 동일한 기능 적용 하기 <br>
	 <br>
	 <br>
	 
	 <div class="myPageContainer">
		<div class = "myPageTop">
			<div class ="myPageLeft" style="background-color: #3DB7CC;">
				<div id="myPageLeftTop">
				<a>가입시 이미지?</a>
				<br><br>ㅇㅇㅇ님 (아이디)<br><br>
				<a href="#" class="myButton">내 정보 관리</a>
				<a href="#" class="myButton">반려동물 정보 관리</a> 
				</div>
			</div>
			<div class = "myPageRight mptr">
				<div>
					<img alt="" src="<%=contextPath%>/images/deli.png">&nbsp;&nbsp;&nbsp;주문 조회
				</div>
				<div>
					<img alt="" src="<%=contextPath%>/images/cart.png">&nbsp;&nbsp;&nbsp;장바구니
				</div>
				<div>
					<img alt="" src="<%=contextPath%>/images/info.png">&nbsp;&nbsp;&nbsp;훈련사 상담
				</div>
			</div> 
		</div>	 
		<div class ="myPageBottom">
			<div class = "myPageLeft">
			레슨 목록 바로가기
			</div>
			<div class ="myPageRight">
			레슨 신청 바로 가기
			</div>
		</div>
	 </div>
	 
	 
</body>
</html>