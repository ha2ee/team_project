<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
	
	
	<!-- Bootstrap CSS -->
	<!-- <link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
		crossorigin="anonymous"> -->
	
	
	<%
			request.setCharacterEncoding("utf-8");
			String contextPath = request.getContextPath();
		%>
	
	<style type="text/css">
	@import url(https://fonts.googleapis.com/css?family=Open+Sans);
	
	.login {
		margin-left: auto;
		margin-right: auto;
		width: 330px;
		height: 350px;
	}
	
	#memLoginId, #memLoginPw, #MemLoginHp {
	    display: inline-block;
	    width: 100%;
	    height: 44px;
	    padding: 0 14px 2px;
	    color: #000;
	    font-size: 14px;
	    line-height: 42px;
	    letter-spacing: -0.01em;
	    font-family: "Noto Sans KR", sans-serif;
	    background-color: #fff;
	    border: 1px solid #d5d5d5;
	    border-radius: 10px;
	    box-sizing: border-box;
	    transition: border-color 0.2s ease-out;
	    outline: none;
	}
	
	#memLoginPw{
	    border-top-left-radius: 0;
   	 	border-top-right-radius: 0;
	    border-top : 0px;
	    
	}
	
	
	#memLoginId,#MemLoginHp{
	   	border-bottom-left-radius: 0;
   	 	border-bottom-right-radius: 0;
	}
	
	#loginType {
		width: 330px;
		height: 50px;
		margin-left: auto;
		margin-right: auto;
	}
	
	#memLogin, #noMemLogin {
		width: 163px;
		height: 44px;
		margin-left: auto;
		margin-right: auto;
		border-width: 1px 1px 1px 1px;
		color: #333;
	}
	
	.total{
	    flex: 1 0 auto;
	    width: 100%;
	    padding: 50px 0 100px;
	    min-height: calc(100vh - 54px - 68px - 250px);
	}
	
	.loginBtn,.joinBtn{
	    color: black;
	    background-color: white ;
	    border: 2px solid #fff;
	    transition: background-color 0.2s ease-out, border-color 0.2s ease-out;
    	width: 100%;
	    height: 50px;
		border-radius: 10px;
	    border: 1px solid #231815;
		font-weight: bold;
	}

	.loginDiv{
	    margin-top: 20px;
	    width: 330px;
	}
	
	.fa-solid,.fa-paw{
		color: lightpink;
	}
	
	.joinBtn{
		width: 100%;
   		display: inline-block;
	    color: #474c98;
    	border: 1px solid #5055b1;
    	background: #fff;
    	transition: background-color 0.2s ease-out, border-color 0.2s ease-out;
		text-decoration: none;
	}
	
	.joinDiv{
	    margin-top: 33px;
	    width: 330px;	
	}
			
			
	
	
	
	</style>
	<meta charset="UTF-8">
	<title>intro.jsp</title>
	<style type="text/css">
	</style>
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
				<form method="post" action="<%=contextPath%>/member/loginPro.me">
					
					<div>
						<input id="memLoginId" type="text" name="memLoginId" placeholder="아이디" /> 
					</div>	
<!-- 					
					<div>	
						<input id="MemLoginHp" type="text" name="memLoginHp" placeholder="전화번호" /> 
					</div>	
 -->
					<div>	
						<input id="memLoginPw" type="password" name="memLoginPw" placeholder="비밀번호" /> 
					</div>	
					
					<div class="loginDiv">
						<button id="memLoginbtn" type="submit" class="loginBtn">log in.</button> 
					</div>	
						
<%-- 					<a href="<%=contextPath%>/member/noMemLoginPro.me"
						id="noMemLoginbtn" class="btn btn-primary btn-block btn-large">log in.</a>
					 --%>
					<div class="joinDiv">
						<button href="<%=contextPath%>/member/joinCategory.me" class="joinBtn">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>
	
	<script type="text/javascript">
	/*		
 		$("#memLogin").click(function() {
			
			$("#memLoginId").show();
			$("#MemLoginHp").hide();
			$("#noMemLoginbtn").hide();
			$("#memLoginbtn").show();
			
		});
		
		$("#noMemLogin").click(function() {
			
			$("#MemLoginHp").show();
			$("#memLoginId").hide();
			$("#memLoginbtn").hide();
			$("#noMemLoginbtn").show();
		});
		
		$(function(){
			$("#MemLoginHp").hide();
			$("#noMemLoginbtn").hide();
			
		});
	 */
	
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
	
	
	</script>
	
	
