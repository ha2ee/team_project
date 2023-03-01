<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 	 <%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>
 	
 <%-- 
	반응형 웹페이지를 적용해 주는 부분입니다. 모바일이나 데스크탑은 해상도가 다른데,
	각 해상도에 맞춘 웹페이지를 보여주게 설정 하는 코드 입니다.
    content="width=device-width"  이부분은  각 기기의 해상도의 너비에 맞게  사이트 화면의 너비를 자동으로 맞추겠다~라는 뜻	                           
 --%>
   
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	

	
		


	<style type="text/css">

		.join_total{
			width: 1200px;
			margin-left: auto;
			margin-right: auto;
		}
		
		
		.join_top{
			width: 100%px;
			height: 140px;
			padding: 50px;
			background-color: #FBE44F;
			border-radius: 15px;
			
		}
		
		#guide{
			color: black;
			font-size: 22px;
			font-weight: 700px;
		}
		
		.join_mid{
			position:relative;
			width: 100%;
			overflow:hidden;
			box-sizing: border-box;
		
		}
		#join_mid_L,#join_mid_R{
			float: left;
			width: 50%;
			height: 250px;
			box-sizing: border-box;
			font-size: 50px;
			border: none;
			margin-bottom: 50px;
			margin-top: 50px;
		}
	
				
		
			
		
	
	
	</style>

</head>
<body>
	<div class="join_total">
	
		<div>
 			<h2> 회원가입 유형선택</h2>
 		</div>
		<div class="join_top">
			<strong id="guide">일반회원과 트레이너 회원중 원하는 유형을 선택해주세요</strong>
		</div>
	
	
<!--개인회원 -->
		<div class="join_mid">
			
			<a type="button" id="join_mid_L" class="btn btn-outline-info" href="memJoin.me">
				<p style="margin-top: 60px;">일반회원</p>
			</a>	
	
<!-- 트레이너 회원 -->
		
			<a type="button" id="join_mid_R" class="btn btn-outline-info" href="trJoin.me">
				<p style="margin-top: 60px;">훈련사 회원</p>
			</a>
			

		</div>	
	
	
	
	
	
	</div>
</body>
</html>
