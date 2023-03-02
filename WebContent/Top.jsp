<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
//메인 메뉴에 마우스가 올려지면 토글하는 함수 생성
$(document).ready(function(){
	$(".list_gnb").on("mouseover", function(){
		$("#mega-menu").stop().slideDown("fast");
	})
	
	$("#mega_wrapper").on("mouseleave", function(){
		$("#mega-menu").stop().slideUp("slow");
	})
	
});
</script>
<style>
/*  나눔 고딕 글꼴 임포트 */
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
/* 나눔 고딕 CSS 설정 */
* {
	font-family: 'Nanum Gothic', sans-serif;
}
/* 중앙정렬을 위한 테이블 CSS 설정 */
/*  header 영역이 항상 TOP쪽에 표시될 수 있도록 CSS 추가  */
  
.nb_top {
  position : fixed;
  width : 100%;
  height : 100px;
  margin : 0 auto 0 auto; 
  align-content : center;
  background-color : white;
  text-align: center;
  z-index: 3;
}
/* 커스텀 로고 영역 */
@import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
@import url(https://fonts.googleapis.com/css?family=Lato:400,300,900);
body{
	padding-top : 250px;
}
#center{
	z-index: 2;
}
#header, #middle, #footer {
	width : 100%;
	margin : 0 auto 0 auto;
	text-align: center;
}
#header {
	position : fixed;
	left : 0;
	right : 0;
	top : 0;
	height : 250px;
	background-color : white;
	z-index: 3;
	
}
#middle {
	position : relative;
	display: contents;
	text-align : center;
	z-index: 2;
	
}
#footer {
	top : 500px;
	height: 500px;
	display : contents;
	text-align: center;
	position : relative;
	height : auto;
	z-index: 1;
}
/* Slider */
#textSlider.row {
	position: fixed;
	left : 0;
	right : 0;
	top : 0;
	width : 100%;
	height:100px;
	margin : 0 auto 0 auto;
}
#textSlider div {
	
	left : 0px;
	right : 0;
	position : relative;
	width : 1200px;
	color: black;
	text-transform: uppercase;
	margin : 0 auto 0 auto;
}
.scroller {
   height: 100px;
   overflow: hidden;
}
/* scroller 안에 .inner 클래스 안에 p 태그 지정 해서 line-height: 1.0줌 */
.scroller .inner p{
		
		padding-top : 7px; 
		margin : 0 auto 0 auto;
		line-height: 0.85;
		left: -30px;
		right : 0;
		top : -5px;
		height : 100px;
}
.scroller .inner { 
	
	font-size : 65pt;
	animation: 10s normal infinite running scroll; }
	
@keyframes scroll {
   0%  	{margin-top: 0px;}
   15% 	{margin-top: 0px;}
   25%  {margin-top: -70pt;}
   40%  {margin-top: -70pt;}
   
   50%  {margin-top: -140pt;}
   65%  {margin-top: -140pt;}
   75%  {margin-top: -210pt;}
   90%  {margin-top: -210pt;}
   
   100% {margin-top: 0px;}
}
/* 로고 에 대한 CSS 설정 */
#menu1 {
	
	left : 0;
	right : 0;
	margin : 0 auto 0 auto;
	position : fixed;
	height : 100px;
	width : 100%;
	text-align : center;
	background-color: white;
}
/*  @ 네브바 + 날씨 API CSS 설정 */
#menu2 {
/*   border : 1px solid red; */
	
	position : fixed;
	top : 100px;
	background-color: white;
	width : 100%;
	height : 150px;
	align-items : center;
	list-style : none;
	left : 0;
	right : 0;
}
/* 네브 박스 CSS  설정 */
	
#nav_box {
	height : 100%;
	width : 100%;
	position : relative;
	margin : 0 auto 0 auto;
	z-index : 5;
}
/* @ 네브바에 대한 CSS 설정 */
#main_menu {
/* 	border : 1px solid black; */
	
	left: 0;
	right:0;
	top : 0;
	position: relative;
	height: 150px;
	width : 1200px;
}
/* 로그인에 대한 CSS 설정 */
#nb_login {
	position : fixed;
	top : 0;
	left : 0;
	right : 0;
	height: 100px;
	width : 100%;
}
#nb_box{
	margin : 0 auto 0 auto;
	text-align: center;
	height : 100%;
	width :  1200px;	
	position: relative;
	top : 0;
}
#login_box {
		
		margin : 0 auto 0 auto;
		position: relative;
		width : 250px;
		height : 100px;
		top : -1px;
		left : 475px;
		right : 0;
		text-align: center;
		
}
#login_box > li {
	
	float : left;
	position: relative;
	text-align: center;
	margin : 0 auto 0 auto;
	padding : 10px;
	left : 20px;
}
#login_box > li >a {
	
	color : black;
	font-size : 15px;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
}
	
/* 	1) "메뉴"에 대한 CSS 설정 */
.list_gnb {
/* 	border : 1px solid red; */
	position : relative;
	margin : 0 auto 0 auto;
	padding : 0;
	list-style: none;
	width : 950px;
	height : 150px;
	top : 0;
	left : -125px;
	right : 0;
}
/*  1-1) 메뉴의 정렬에 대한 CSS 설정 */
.list_gnb>li{
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto 0 auto;
	height : 150px;
	width:1200px;
}
/* 1-2) 메뉴 버튼이 활성화 되었을때, CSS 디자인 */
/* 1-3) 버튼 하나하나에 대한 CSS 디자인 */
.list_gnb>li>a {
	
	top : 65px;
	position : relative;
 	font-weight : 400;
 	color : black; 
	text-align: center;
	left : -150px;
	padding : 15px;
	font-size : 37px;
	color : black;
	text-decoration: none;
	left : -130px;
	margin : 15px;
}
/* 1-4) 버튼 하나하나가 활성화 되었을 CSS 디자인 */
 .list_gnb>li>a:hover { 
/*  	border-bottom: 3px solid #ffebcd;  */
	border : silver;
 	background-color: #fff5f3;
 	border-radius: 30px;
 } 
/* 1-5) 나열된 메뉴가 활성화 되었을 때 메가메뉴를 어떻게 컨트롤 할건지에 대한 CSS 디자인 */
/* .list_gnb > li:hover #mega-menu { */
/* 	opacity: 1; */
	
/* } */
/* 드롭  된 큰 메뉴에 대한 스타일 조정 */
#mega-menu {
	
 	font-weight : 900;
	width : 100%;
	height : 170px;
	background: white;
	position : relative;
	top : 250px;
	left : 0;
	right : 0;
	border-radius: 3px;
	display : none;
	
}
#mega_wrapper{
	
/* 	border : 1px solid red; */
	
	left: 0;
	right : 0;
	position : relative;
	top : 0;
	width : 1200px;
	height : 100%;
	margin : 0 auto 0 auto;
	
}
/* 드롭  된 각 메뉴에 대한 스타일 조정 */
#mega_wrapper > ul {
	text-align : center;
	color : black;
	font-size : 16px;
	float : left;
}
/* 드롭 된 메뉴 전체의 스타일 조정 */
#mega_wrapper > ul >li{
	padding : 8px;
	text-align : center;
}
#mega_wrapper > ul >li:hover{
	border-radius :20px;
	background-color : #fff5f3;
	text-align : center;
}
/* 드롭 된 메뉴의 간격 조정 */
.list_lnb_01 {
 	margin-left : 140px;  
 		width: 130px;
}
.list_lnb_02 {
 	margin-left : 90px; 
 	width : 150px;
}
.list_lnb_03 {
 	margin-left : 80px; 
 		width: 130px;
}
.list_lnb_04 {
 	margin-left : 65px; 
 		width: 130px;
}
/* 드롭 된 메뉴의 스타일 조정 */
#mega_wrapper > ul >li > a{
	font-size : 17px;
 	font-weight : inherit;
	text-align : center;
	color : black;
	text-decoration: none;
}
/* 드롭다운 버튼 구현을 위한 style 임포트 끝*/
 .nb_top > .login1 > ul{
	left: 940;
	position :  relative;
	height: 100px;
	width: 200px;
	left :  940px;
	list-style: none;
}
 .nb_top >  .login1 > ul > li > a {
	font-family: 'Nanum Gothic', sans-serif;
	font-size : 15px;
	text-transform: uppercase;
	font-weight : 700;
	padding: 7px 21px;
	margin-bottom : 4px;
	letter-spacing: .75px;
	border-radius : 3px;
	border : transparent;
	transition : all 0.3s;
	position : relative;
	display: inline-block;
	background : #fff;
}
 .nb_top > .login1 > ul > li > a:hover {
	border-radius : 20px;
	background-color : #fff5f3;
}
.inner p {
  background-color :white;
}
/* header 영역 고정 완료 */
/*  날씨 구현 관련 CSS 설정  */
	#weatherWrapper {
	position : relative;
	top : -150px;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 100%;
	height : 150px;
	}
	#weatherbox{
	
/* 	border : 1px solid green; */
	
	position : relative;
	top : 0;
	left : 475px;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 150px;
	}
	
	#todayweather{
	
/* 	border : 1px solid green; */
	
	position : relative;
	text-align : center;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 30px;
	font-size : 20px;
	background : #fff5f3;
	border-radius : 5px;
	color : #9e9e9e;
	}
	
	#topTitle{
	
/* 	border : 1px solid blue; */
	
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 25px;
	border-radius: 5px;
	font-weight : 600;
	}
	
	#topTitle > div{
	
/* 	border : 1px solid red; */
	
	float:left;
	text-align : center;
	position : relative;
	top : 0;
	left : 1px;
	right : 0;
	margin : 0 auto;
	width : calc(96%/4);
	height : 100%;
	}
	
	#weatherBody{
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 250px;
	height : 25px;
	font-size : 13px;
	
	}
	
	#weatherBody > div{
	
/* 	border : 1px solid red; */
	
	float:left;
	text-align : center;
	position : relative;
	top : 0;
	left : 1px;
	right : 0;
	margin : 0 auto;
	width : calc(96%/4);
	height : 100%;
	}
	
	#weatherFooter {
	
/* 	border : 1px solid red; */
	
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 100%;
	height : 65px;
	
	}
	
	
	#weatherResult {
	
/* 	border : 1px solid red; */
	
	text-align : center;
	position : relative;
	top : 0;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 246px;
	height : 100%;
	border-radius: 5px;
	}
	
	
	#weatherResult > img {
	
/* 	border : 1px solid orange; */
	
	text-align : center;
	position : relative;
	top : 2px;
	left : 2px;
	right : 0;
	margin : 0 auto;
	width : 70px;
	height : 96%;
	border-radius: 5px;
	}
	
/* 	날씨에 대한 결과값 계산 후 출력할 곳 */
	
	#weatherzone {
	
/* 	border : 1px solid blue; */
	
	text-align : center;
	position : relative;
	top : -13px;
	left : 0;
	right : 0;
	margin : 0 auto;
	width : 169px;
	height : calc(60px / 2);
	border-radius: 5px;
	border: 1px dotted white;
	
	}
	
	#weatherzone2 {
	
/* 	border : 1px solid blue; */
	
	text-align : center;
	position : relative;
	top : -28px;
	left : 37px;
	right : 0;
	margin : 0 auto;
	width : 169px;
	height : calc(60px / 2);
	border-radius: 5px;
	border: 1px dotted white;
	
	}
	/*  로그인,회원가입,마이페이지,장바구니 버튼 백그라운드 컬러변경 시 사용 */
.btn:hover {
  background: #fff5f3;
  text-decoration: none;
  border-radius: 20px;
}
.btn:focus {
  outline: none;
}
.btn {
	font-family: 'Nanum Gothic', sans-serif;
	font-size : 15px;
	text-transform: uppercase;
	font-weight : 700;
	padding: 7px 21px;
	margin-bottom : 4px;
	letter-spacing: .75px;
	border-radius : 3px;
	border : transparent;
	transition : all 0.3s;
	position : relative;
	display: inline-block;
	background : #fff;
	color : black;
}
</style>


<!--          			# 부트스트랩 플러그인  관련 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Digital marketing courses website template that can help you boost your business courses website and its completely free.">
    <meta name="keywords" content="seo,free website template, free responsive website template, seo marketing, search engine optimization, web analytics">
    <!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <!-- 구글 폰트 -->
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet"> -->
<!--     FontAwesome CSS -->
<%--     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fontello.css"> --%>
<%--     <link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet"> --%>
    <link href="<%=request.getContextPath()%>/css/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/owl.theme.default.css" rel="stylesheet">

<!--          			# 부트스트랩 플러그인  관련 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!--          			# 홈버튼 플러그인  관련 -->
<i class="bi bi-house"></i>
</svg>

<title>Top.jsp</title>

<!--          			# 플러그인  관련 -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/js/menumaker.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/slider.js"></script>
</head>    
<body>    
 <div class="nb_top" >
<!--          			# 메인 로고  관련 -->
<!--  #   menu1 :  슬라이더 + 로그인 버튼 4개  -->
    <div id = "menu1" >
		<div id = "textSlider" class="row">
					<div class="scroller">
							<div class="inner">
								<p align="center">늘 봄</p>
								<p align="center">いつも春</p>
								<p align="center">Always See</p>
								<p align="center">Always Spring</p>
							</div>
					</div>
		</div>
		<!--                  1) 로그인 & 로그아웃 & 마이페이지 & 장바구니 버튼 -->
		<div id = "nb_login">
				<div id = "nb_box">
					<ul id = "login_box">	                    			
		              <%
					//session내장객체 메모리 영역에 session값 얻기
					 String id = (String)session.getAttribute("id");
				
					//session에 값이 저장되어 있지 않으면?
					if(id == null){
				%>	

				   <li><a href="<%=request.getContextPath()%>/member/login.me?center=/nbMember/login.jsp" class="btn">로그인</a></li>
	               <li><a href="<%=request.getContextPath()%>/nb/mypage.me?center=/nbMember/mypage.jsp" class="btn">마이페이지</a></li>
	               <li><a href="<%=request.getContextPath()%>/member/joinCategory.me?center=/nbMember/join.jsp" class="btn">회원가입</a></li>
	               <li><a href="<%=request.getContextPath()%>/nb/cart.member?center=/nbMember/cart.jsp" class="btn">장바구니</a></li>

				<%
					}else{//로그인 O
				%>
				   <li><a href="<%=request.getContextPath()%>/member/logout.me" class="btn">로그아웃</a></li>
	               <li><a href="<%=request.getContextPath()%>/nb/mypage.me?center=/nbMember/mypage.jsp" class="btn">마이페이지</a></li>
	               <li><a href="<%=request.getContextPath()%>/member/joinCategory.me?center=/nbMember/join.jsp" class="btn">회원가입</a></li>
	               <li><a href="<%=request.getContextPath()%>/nb/cart.member?center=/nbMember/cart.jsp" class="btn">장바구니</a></li>

				<%
					}
				%>
					</ul>
				</div>	
			</div>	
	</div>
	
<!--  #   menu2 :  네브바 + 날씨 API  -->		

	<div id="menu2" align="center" >
	  <div id = "nav_box">
		<nav id="main_menu">
			<ul class="list_gnb">
				<li style="font-family: 'Nanum Gothic', sans-serif;">
				<!-- 			 1-1)	홈 버튼 -->
				<a id ="homebtn" href="<%=request.getContextPath()%>/nb/Main" title="">
				<svg id="nb_homebtn" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-houses" viewBox="0 0 16 16">
 				<path d="M5.793 1a1 1 0 0 1 1.414 0l.647.646a.5.5 0 1 1-.708.708L6.5 1.707 2 6.207V12.5a.5.5 0 0 0 .5.5.5.5 0 0 1 0 1A1.5 1.5 0 0 1 1 12.5V7.207l-.146.147a.5.5 0 0 1-.708-.708L5.793 1Zm3 1a1 1 0 0 1 1.414 0L12 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l1.854 1.853a.5.5 0 0 1-.708.708L15 8.207V13.5a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 4 13.5V8.207l-.146.147a.5.5 0 1 1-.708-.708L8.793 2Zm.707.707L5 7.207V13.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5V7.207l-4.5-4.5Z"/>
				</svg></a>
				<!-- 			 1-2)	메뉴 버튼 -->
				<a href="<%=request.getContextPath()%>/nb/Intro.do?center=/nbCompany/intro.jsp"> 늘 봄이란?</a>
				<a href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp"> 수강 신청 </a>
				<a href="<%=request.getContextPath()%>/nb/free.bo?center=/nbBoard/freeboard.jsp"> 소통 하기</a>
				<a href="<%=request.getContextPath()%>/nb/pet.shop?center=/nbShop/pet.jsp"> 늘 봄샵</a>



			  </li>
			</ul>
		</nav>
	</div>
		<!-- 					2) 날씨 구현 파트 -->
<div id = "weatherWrapper">
	<div id="weatherbox">
		<div id="todayweather">
			<label>우리동네 날씨는..?</label>
		</div>
		<div id="topTitle">
			<div id="weatherDate">날짜</div>
			<div id="weatherTime">시간</div>
			<div id="weatherTemp">온도</div>
			<div id="weatherWind">바람</div>
		</div>
		<div id="weatherBody">
			<div id="resultDate">준비중</div>
			<div id= "resultTime">준비중</div>
			<div id= "resultTemp">준비중</div>
			<div id="resultWind">준비중</div>
		</div>
		<div id="weatherFooter">
			<div id="weatherResult">
				<img src="#" />
				<input id="weatherzone" type="text" value="날씨정보가 안나올경우" />
				<input id="weatherzone2" type="text" value="위치서비스 동의필요!" />
			</div>
		</div>
	</div>
	  </div>
 </div>

<!--  #   mega-menu :  메가드롭 메뉴  -->
	<div id="mega-menu">
		<div id = mega_wrapper>
			<ul class="list_lnb_01">
				<li><a href="<%=request.getContextPath()%>/nb/Intro.do?center=/nbCompany/intro.jsp">회사 소개</a></li>
				<li><a href="<%=request.getContextPath()%>/nb/ci.do?center=/nbCompany/ci.jsp"> C I</a></li>
				<li><a href="<%=request.getContextPath()%>/nb/navi.do?center=/nbCompany/navi.jsp">오시는 길</a></li>
			</ul>
			<ul class="list_lnb_02">
				<li><a href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp">수강신청 가기</a></li>
			</ul>
			<ul class="list_lnb_03">
				<li><a href="<%=request.getContextPath()%>/freeboard/list.fb?pageNum=1&startRow=1&pageSize=5">자유 게시판</a></li>
				<li><a href="<%=request.getContextPath()%>/tb/list.bo">훈련사 상담</a></li>
				<li><a href="<%=request.getContextPath()%>/nb/review.bo?center=/nbBoard/review.jsp">수강 후기</a></li>
				<li><a href="<%=request.getContextPath()%>/nb/qna.bo?center=/nbBoard/qna.jsp">Q&A</a></li>
			</ul>
			<ul class="list_lnb_04">
				<li><a href="<%=request.getContextPath()%>/nb/pet.shop?center=/nbShop/pet.jsp"> 샵으로 이동 </a></li>
		 </ul>
		 </div>
	</div>	
         
 </div>







<!-- 날씨 관련 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script type="text/javascript">
navigator.geolocation.getCurrentPosition(showYourLocation, showErrorMsg); 
function showYourLocation(position) {  // 성공했을때 실행
    var userLat = position.coords.latitude;
    var userLng = position.coords.longitude;
    
    console.log("가져온 위도경도값 : "+ userLat , userLng);
    
    // # 위치정보를 동의했을 때 받아오는 위도와 경도값을 기초로 x,y 좌표를 구한다음 해당 지역의 날씨를 api 로 받아오는 설정 
    //
    // LCC DFS 좌표변환을 위한 기초 자료
    //
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0; // 격자 간격(km)
    var SLAT1 = 30.0; // 투영 위도1(degree)
    var SLAT2 = 60.0; // 투영 위도2(degree)
    var OLON = 126.0; // 기준점 경도(degree)
    var OLAT = 38.0; // 기준점 위도(degree)
    var XO = 43; // 기준점 X좌표(GRID)
    var YO = 136; // 기1준점 Y좌표(GRID)
    
    //
    // LCC DFS 좌표변환 ( code : "toXY"(위경도->좌표, v1:위도, v2:경도), "toLL"(좌표->위경도,v1:x, v2:y) )
    //
   // 함수를 실행시키고 리턴 받아온 값들을 출력한다.
   var rs = dfs_xy_conv(userLat, userLng);
    
   console.log("x,y좌표값 : "+ rs.x, rs.y);
   
   // 받아온 값들을 변수에 저장한다.
   var todayx = rs.x;
   var todayy = rs.y;
    function dfs_xy_conv(v1, v2) {
        var DEGRAD = Math.PI / 180.0;
        var RADDEG = 180.0 / Math.PI;
        var re_1 = RE / GRID;
        var slat_1 = SLAT1 * DEGRAD;
        var slat_2 = SLAT2 * DEGRAD;
        var olon_1 = OLON * DEGRAD;
        var olat_1 = OLAT * DEGRAD;
        var sn = Math.tan(Math.PI * 0.25 + slat_2 * 0.5) / Math.tan(Math.PI * 0.25 + slat_1 * 0.5);
        sn = Math.log(Math.cos(slat_1) / Math.cos(slat_2)) / Math.log(sn);
        var sf = Math.tan(Math.PI * 0.25 + slat_1 * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat_1) / sn;
        var ro = Math.tan(Math.PI * 0.25 + olat_1 * 0.5);
        ro = re_1 * sf / Math.pow(ro, sn);
        var rs = {};
            rs['lat'] = v1;
            rs['lng'] = v2;
            
            var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
            ra = re_1 * sf / Math.pow(ra, sn);
       
            var theta = v2 * DEGRAD - olon_1;
            if (theta > Math.PI) {
           	 theta -= 2.0 * Math.PI;
            }
            if (theta < -Math.PI){
           	 theta += 2.0 * Math.PI;
            }
            theta *= sn;
       
            rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
            rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
            
        return rs;
    }
    
    
	// 전역변수로 url에 들어갈 실시간 날짜 받아오기
	var Wdate = new Date();
	var initDate = moment(Wdate).format('YYYYMMDD');
	var initTime = moment(Wdate).format('HH')-1;	
	var koDate = moment(Wdate).format('M월 DD일');
	var KoTime = moment(Wdate).format('HH시');
	
	
	// 만약에 initTime 값이 10보다 작을경우
	if( initTime < 10){
		
		// 2번째 자리수에 0을 붙인다.
		initTime = "0"+initTime;
	}
	
// 3) ajax를 활용해서 현재날씨 데이터 만들기
// 가져올 값 : 1)해당날짜의 시간 2)온도 3)바람세기
$.ajax({
	url: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=SswoUAmXtjH%2FEZIxjrzCxbjXuV0AhAdO5rXvMxXfxqis8wmCcKFciA72WHxnWC1Uyosdebw1T1HP5qH9bEyu7w%3D%3D&pageNo=1&numOfRows=1000&dataType=JSON&base_date="+initDate+"&base_time="+initTime+"00&nx="+todayx+"&ny="+todayy, 
	success: function(result){
		
	// 온도 , 바람, 비	등의 정보를 API 에서 받아오기
	// 11 ~ 15  도 : 산책하기 딱 좋은 날씨!
	//  6 ~ 10  도 : 괜찮지만, 만약을 대비해 조심히 산책!
	//  -1 ~  5 도 : 품종에따른 주의가 필요해요! (방한용품권장)
	//  -2 ~ -4 도 : 산책하기에는 상당히 쌀쌀해요! (방한용품필수)
	//  -5 이후     : 실내활동 권장 (너무 추워요)
	var temp = result.response.body.items.item[3].obsrValue;
	
	// 바람 Max 값 : 14 m /s 이상
	// 4 미만    : 바람이 약하다.
	// 4~ 8      : 바람이 약간 강하다.
	// 9~14미만 : 바람이 강하다.
	// 14 이상  : 바람이 매우 강하다.
	var wind = result.response.body.items.item[7].obsrValue;
	
	// 0 : 없음, 
	// 1 : 비옴, 
	// 2:  비 또는 눈 
	// 3: 눈,
	// 4: 소나기
	var rain = result.response.body.items.item[0].obsrValue;
	
	// console에 출력해보기
// 	console.log(initDate);
// 	console.log(initTime);	
// 	console.log(result);
// 	console.log(temp);
// 	console.log(wind);
// 	console.log(rain);
	
	// 홈페이지를 이동할때마다 변경된 값을 저장시키기
	$("#resultDate").text(koDate);
	$("#resultTime").text(KoTime);
	$("#resultTemp").text(temp+" 도");
	$("#resultWind").text(wind+" m/s");
	
		// 온도와 바람에 따라서 변경 노출 될 이미지와 문구 설정
		
		// #1 온도가 25도 이상일 경우
		if(temp >= 25){
			
			// 온도가 25도 이상이지만 비가올 경우
			if(rain > 0){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
				$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
			
			// 오후 6시 이후일 경우,
			}else if(rain == 0 && initTime >= 18){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
				$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
				
				
				
			// 온도가 26도 이상이고 비가 오지 않을경우,	
			}else{
			
			$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
			$("#weatherzone").attr("value", "무더운 날씨네요").css("font-weight","bold");
			$("#weatherzone2").attr("value", "더위 조심하세요!!").css("color", "#009688").css("font-weight","bold");
			
			}
			
		// #2 온도가 16도 이상 25도 미만일 경우
		}else if(temp >= 16 && temp < 25){
				
				// 온도는 16도 이상 25도 미만이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
					
					
					
				// 온도는 16도 이상 25도 미만이지만 비가 오지 않을경우,	
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "따뜻한 날씨네요").css("font-weight","bold");
				$("#weatherzone2").attr("value", "수분 챙기세요!!").css("color", "#009688").css("font-weight","bold");
				
				}
		
		
		
		// #3) 11도 보다 온도가 높거나 같고, 16도 미만 일 경우
		}else if(temp >= 11 && temp < 16){
			
				// 온도는 11도 이상이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
					
					
					
				// 온도가 11도 이상이고 비가 오지 않을경우,	
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기").css("font-weight","bold");
				$("#weatherzone2").attr("value", "딱 좋은 날씨!").css("color", "#009688").css("font-weight","bold");
				
				}
			
		// #4) 온도가 6도 보다는 높지만, 11도 보다는 낮을때	
		}else if(temp >= 6 && temp < 11){
			
				// 온도는 6도 이상 11도 미만이지만 비가올 경우
				if(rain > 0){
					
					
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
					
				// 온도가 6도 이상 11도 미만에 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기 괜찮지만").css("font-weight","bold");
				$("#weatherzone2").attr("value", "조심히 산책하세요!").css("color", "#8bc34a").css("font-weight","bold");
				
				}
		// #5) 온도가 -1도 이상 6도 미만일때
		}else if(temp >= -1 && temp < 6){
				
				// 온도는 -1도 이상 6도 미만이지만 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
				// 온도가 -1도 이상 6도 미만에 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "방한용품을 권장하고").css("font-weight","bold");
				$("#weatherzone2").attr("value", "많은 주의가 필요합니다!").css("color", "#ff5722").css("font-weight","bold");
				}
			
		// #6) 온도는 -2도보다 낮거나 같고 -4도 미만일 때
		}else if (temp <= -2 && temp > -4){
			
				// 온도는 -2도보다 낮거나 같고 -4도 미만일 때, 비가올 경우
				if(rain > 0){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
					$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
				
				// 오후 6시 이후일 경우,
				}else if(rain == 0 && initTime >= 18){
					
					$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
					$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
					$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
						
					
					
				// 온도는 -2도보다 낮거나 같고 -4도 미만일 때, 비가 안 올 경우
				}else{
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
				$("#weatherzone").attr("value", "산책하기엔 쌀쌀해요").css("font-weight","bold");
				$("#weatherzone2").attr("value", "방한대책 필수에요!!").css("color", "#ff5722").css("font-weight","bold");
				
				}
			
		// #7) 온도가 -4도와 같거나 높을경우	
		}else if(temp >= -4){
			
			// 온도가 -4도와 같거나 높고 비가올 경우
			if(rain > 0){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/rainy.png");
				$("#weatherzone").attr("value", "비가 와요 T,.T! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "집이 안전해요!").css("color", "#2196f3").css("font-weight","bold");
			
			// 오후 6시 이후일 경우,
			}else if(rain == 0 && initTime >= 18){
				
				$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/night.png");
				$("#weatherzone").attr("value", "날이 어두워요 !! ").css("font-weight","bold");
				$("#weatherzone2").attr("value", "꼭 조심하세요!!").css("color", "#ff5722").css("font-weight","bold");
			
			// 온도가 -4도와 같거나 높고 비가 안 올 경우
			}else{
			
			$("#weatherResult > img").attr("src", "<%=request.getContextPath()%>/nbShop/img/sunny.gif");
			$("#weatherzone").attr("value", "실내 놀이를").css("font-weight","bold");
			$("#weatherzone2").attr("value", "적극 권장합니다!!").css("color", "#ff5722").css("font-weight","bold");
			
			}
			
			
			
		}
	
   	},
});
}
function showErrorMsg(error) { // 실패했을때 실행
    switch(error.code) {
        case error.PERMISSION_DENIED:
        loc.innerHTML = "이 문장은 사용자가 Geolocation API의 사용 요청을 거부했을 때 나타납니다!"
        break;
        case error.POSITION_UNAVAILABLE:
        loc.innerHTML = "이 문장은 가져온 위치 정보를 사용할 수 없을 때 나타납니다!"
        break;
        case error.TIMEOUT:
        loc.innerHTML = "이 문장은 위치 정보를 가져오기 위한 요청이 허용 시간을 초과했을 때 나타납니다!"
        break;
        case error.UNKNOWN_ERROR:
        loc.innerHTML = "이 문장은 알 수 없는 오류가 발생했을 때 나타납니다!"
        break;
    }
}
	
</script>
 
<!-- header-close -->
<div id = "center1">

</div>
</body>
</html>