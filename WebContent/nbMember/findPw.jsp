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

<style type="text/css">
	
	.total{
   		width: 450px;
	    height: 365px;
	    font-size: 16px;
	    margin-left: 16px;
		margin-top: 55px;
	}
	
	.input{
	    height: 23%;
	    font-size: 16px;
	    margin-top: 4%;
	    margin-left: 22%;
	}

	#id,#hp{
	    padding-left: 4px;
	    width: 160px;
	    height: 21px;
	    margin-left: 28px;
		
	}
	
	.pwBtn {
		width: 84%;
	    height: 50px;
	    margin-left: 98px;
	    margin-top: -14px;
	}
	
	.guide{
		margin-left: 22%;
	}
	
	.checkBtn{
    	width: 300px;
    	height: 50px;
	}
	
	.message{
	    margin-left: 117px;
	    height: 46px;
		}
	
</style>

</head>
<body>

<form action="<%=contextPath%>/member/findPw.me">
 	
 	<div class="total">
		<div class="guide">
	 		<p><strong>비밀번호 찾기</strong></p>
	 	</div>
		<div style="width: 100%">	
		 	<div class="input">
		 		아이디 <input type="text" name="id" id="id" class="id"><br>
				<br>
				
				전화번호 <input type="text" name="hp" class="hp" id="hp" style="margin-left: 12px" placeholder="- 없이 입력하여 주세요.">
	 			
	 		</div>
	 		<div class="message">	
	 			<p id="Message"></p>
	 		</div>
	 		<div class="checkBtn">
 				<input type="button" onclick="find();"  class="pwBtn" value="비밀번호 찾기"/>
 			</div>
	 		
	 		
	 	</div>
 	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--회원정보 수정 유효성 체크  --%>

</form>	
	<script>
	  	function find(){
	  		
   	    	$("form").submit();

	  	}
			
	  		
	</script> 	
</body>
</html>