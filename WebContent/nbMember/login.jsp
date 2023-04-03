<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=contextPath%>/css/login.css">
	
	
	<!-- Bootstrap CSS -->
	<!-- <link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
		crossorigin="anonymous"> -->
	
	
	<%
		request.setCharacterEncoding("utf-8");
		String contextPath = request.getContextPath();
	%>
	
	<meta charset="UTF-8">
	<title>intro.jsp</title>		
	</head>
		<body>
			<h1><i style="font-size: 36px;"  class="fa-solid fa-paw"></i>늘봄</h1>
			<div class="total">
<!-- 		
				<div id="loginType">
					<button id="memLogin">
						<p id="p1">회원 로그인</p>
					</button>
					<button id="noMemLogin">
						<p id="p2">비회원 로그인</p>
					</button>
		
				</div>
		 -->
				<div class="login">
				<form method="post" >
					
					<div>
						<input id="memLoginId" type="text" name="memLoginId" placeholder="아이디" /> 
					</div>	
				
					<div>	
						<input id="memLoginPw" type="password" name="memLoginPw" placeholder="비밀번호" /> 
					</div>	
					<div style="text-align: right;">
						<a class="findId" onclick="findId()">아이디 찾기</a>/
						<a class="findPw" onclick="findPw()">비밀번호 찾기</a>
					</div>
					
					
					<div class="loginDiv">
						<button id="memLoginbtn" type="submit" class="loginBtn">log in.</button> 
					</div>	
						
					<div class="joinDiv">
						<a href="<%=contextPath%>/member/joinCategory.me"  id="joinBtn" class="joinBtn" style="text-decoration: none;"> 
							<p style="margin-top: 9px;">회원가입</p>
						</a>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
	
	<script type="text/javascript">

		  $("#memLoginbtn").mouseover(function(){

	    	$("#memLoginbtn").css("background-color", "#f2deded6");
		    $("#memLoginbtn").css("color", "white");
		    $("#memLoginbtn").css("border", "0px");
				
		  });

		  $("#memLoginbtn").mouseout(function(){

		    $("#memLoginbtn").css("background-color", "transparent");
		    $("#memLoginbtn").css("color", "black");
		    $("#memLoginbtn").css("border", "1px solid #231815");
			  
		  });
	
		  $("#memLoginbtn").click(function(){
		 	
			  $("form").attr("action", "<%=contextPath%>/member/loginPro.me");
				  
		  });
		  
		  
		  
		  $("#joinBtn").mouseover(function(){

	    	$("#joinBtn").css("background-color", "#E0E0F8");
				
			  });

		  $("#joinBtn").mouseout(function(){

		    $("#joinBtn").css("background-color", "white");
			  });
		
	   
		  function findId(){
	        var url = "<%=contextPath%>/nbMember/findId.jsp";
	        var name = "아이디 찾기	";
	        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	        window.open(url, name, option);
	    }
		 
		  function findPw(){
	        var url = "<%=contextPath%>/nbMember/findPw.jsp";
	        var name = "비밀번호 찾기	";
	        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	        window.open(url, name, option);
	    }
		  
	</script>
	
	
