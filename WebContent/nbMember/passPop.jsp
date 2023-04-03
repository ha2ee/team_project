<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		request.setCharacterEncoding("UTF-8");
		String contextPath = request.getContextPath();
	%>
	<link rel="stylesheet" href="<%=contextPath%>/css/passPop.css">

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
	
	<script>
	  	function passChange(event) {
		
 				
    	var pass = $("#pass");
    	var passValue = pass.val();
    	
    	var passReg = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/);
    	var resultPass = passReg.test(passValue);

		if(!resultPass){
			$("#Message").text("영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요.").css("color","red");
			pass.focus();
			return false;
		}else{
			$("#Message").text("");
		}
		
		
    	if($("#checkpass").val() != $("#pass").val()){
    		$("#Message").text("비밀번호가 일치하지 않습니다!").css("color","red");
    		$("#checkpass").focus();
    		return false;
    	}else{
    		$("#Message").text("");
    	}

		window.opener.document.getElementById("pw").value = document.getElementById("pass").value;
    	window.close();
  		
		alert("저장을 눌러주세요.");
	}	
	  	
  	</script>  	  	
</body>
</html>