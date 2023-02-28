<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
	
	
	<%
		request.setCharacterEncoding("utf-8");
		String contextPath = request.getContextPath();
	%>
	
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

 
 
	.login {
		margin-left : auto; 
		margin-right : auto;
		width: 330px;
		height: 350px;
	}



	#memLoginId,#memLoginPw
	,#MemLoginHp
	{
		width: 100%;
		margin-bottom: 10px;
		background: rgba(0, 0, 0, 0.3);
		border: none;
		outline: none;
		padding: 10px;
		font-size: 13px;
		color: #fff;
	 	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
	 	border: 1px solid rgba(0, 0, 0, 0.3); 
	 	border-radius: 4px; 
		box-shadow: inset 0 -5px 45px rgba(100, 100, 100, 0.2), 0 1px 1px 
	 		rgba(255, 255, 255, 0.2); 

	} 

	#loginType{
		width: 330px;
		height: 50px;
		margin-left : auto;
		margin-right : auto;
	
	}
	
	#memLogin,#noMemLogin{
		width: 163px;
		height: 44px;
		margin-left : auto;
		margin-right : auto;
		border-width: 1px 1px 1px 1px;
		color: #333;
	}
	


</style>
<meta charset="UTF-8">
<title>intro.jsp</title>
<style type="text/css">
</style>
</head>
<body>
	
	<h1>Login</h1>
	<div id="loginType">
		<button id="memLogin">
			<p id="p1">회원 로그인</p>
		</button>		
		<button id="noMemLogin">
			<p id="p2">비회원 로그인</p>
		</button>		
			
	</div>
	
	<div class="login">
		
		<form method="post">
			<input id="memLoginId" type="text" name="memLoginId" placeholder="아이디" required="required" /> 
			
			<input id="MemLoginHp" type="text" name="MemLoginHp" placeholder="전화번호" required="required" /> 
			
			<input id="memLoginPw" type="password" name="memLoginPw" placeholder="비밀번호" required="required" />
			 
			
			<a href="<%=contextPath%>/nb_member/loginPro.me" class="btn btn-primary btn-block btn-large">log in.</a>
		</form>
	</div>
</body>
</html>

<script type="text/javascript">
	
	$("#memLogin").click(function() {
		
		$("#memLoginId").show();
		$("#MemLoginHp").hide();
		
	});
	
	$("#noMemLogin").click(function() {
		
		$("#MemLoginHp").show();
		$("#memLoginId").hide();
		
		
	});
	
	$(function(){
		
		$("#memLogin").click();	
		
	});





</script>


