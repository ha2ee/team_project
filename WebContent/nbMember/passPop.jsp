<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	.total{
   		width: 100%;
  		height: 100px;
		font-size: 16px;
    	margin-left: -7%;
	}
	
	.input{
   		width: 66%;
  		height: 23%;
		font-size: 16px;
		margin-top: 28%;
    	margin-left: 23%;
	}

	#pass {
	    padding-left: 4px;
	    width: 160px;
	    height: 21px;
	    margin-left: 22px;
		
	}
	
	.pwBtn {
	    width: 98px;
	    height: 56px;
	    margin-top: -2%;
	    margin-left: 83%;
	}

</style>

</head>
<body>

<form action="passChange.me">
 	
 	<div class="total">
	 	<div class="input">
	 		새 비밀번호 <input type="password" name="changePass" id="pass" class="pass"><br>
			<br>
			
			비밀번호 확인<input type="password" class="checkPass" id="pass" style="margin-left: 12px">
 			<p class="passInput" >
 		</div>
 		<a href="passChange()" class="pwBtn">변경하기</a>
 	
 	
 	</div>


</form>	

</body>
</html>