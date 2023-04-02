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

	
	
	
	<link rel="stylesheet" href="<%=contextPath%>/css/findId.css">

</head>
<body>

<form action="<%=contextPath%>/member/findId.me"">
 	
 	<div class="total">
		<div class="guide">
	 		<p><strong>아이디 찾기</strong></p>
	 	</div>
		<div style="width: 100%">	
		 	<div class="input">
		 		이름 <input type="text" name="name" id="name" class="name"><br>
				<br>
				
				전화번호 <input type="text" name="hp" class="hp" id="hp" style="margin-left: 12px" placeholder="- 없이 입력하여 주세요.">
	 			
	 		</div>
	 		<div class="message">	
	 			<p id="Message"></p>
	 		</div>
	 		<div class="checkBtn">
 				<input type="button" onclick="find();"  class="idBtn" value="아이디 찾기"/>
 			</div>
	 	
	 	</div>
 	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--회원정보 수정 유효성 체크  --%>
<script src="<%=request.getContextPath()%>/js/change.js"></script>

</form>	
	<script>
	  	function find(){
	  		
   	    	$("form").submit();

	  	}
			
	  		
	  		
	  		
	</script> 	
</body>
</html>