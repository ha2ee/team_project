<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	.total{
   		width: 550px;
	    height: 365px;
	    font-size: 16px;
	    margin-left: -11%;
	    margin-top: 180px;
	}
	
	.input{
		width: 55%;
	    height: 23%;
	    font-size: 16px;
	    margin-top: 4%;
	    margin-left: 22%;
	}

	#pass,#checkpass {
	    padding-left: 4px;
	    width: 160px;
	    height: 21px;
	    margin-left: 22px;
		
	}
	
	.pwBtn {
   	    background-color: #ff00194f;
	    padding: 21px;
	    text-decoration: none;
	    color: black;
	    margin-top: 109px;
	    margin-left: 66px;
	}
	
	.guide{
		margin-left: 22%;
	}
	
	.checkBtn{
		width:	30%; 
		height: 20%; 
		float: right;
	}
	
	.message{
	    margin-left: 117px;
	}
	
</style>

</head>
<body>

<form action="passChange.me">
 	
 	<div class="total">
		<div class="guide">
	 		<p><strong>영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요.</strong></p>
	 	</div>
		<div style="width: 100%">	
		 	<div class="input">
		 		새 비밀번호 <input type="password" name="changePass" id="pass" class="pass"><br>
				<br>
				
				비밀번호 확인<input type="password" class="checkPass" id="checkpass" style="margin-left: 12px">
	 			
	 		</div>
	 		<div class="message">	
	 			<p id="Message"></p>
	 		</div>
	 		<div class="checkBtn">
 				<input type="button" onclick="passChange();"  class="pwBtn" value="변경하기"/>
 			</div>
	 		
	 		
	 	
	 	</div>
 	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--회원정보 수정 유효성 체크  --%>
<script src="<%=request.getContextPath()%>/js/change.js"></script>

</form>	
		
</body>
</html>