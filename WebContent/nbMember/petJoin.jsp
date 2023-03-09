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

		.pet_total{
		    max-width: 1240px;
		    margin: 0 auto;
		    text-align: center;
		    padding: 0px 20px 0px;
		    box-sizing: border-box;
		    position: relative;
		}
		
		
		#p_name,#p_age,#p_gender,#p_type,
		#p_weight,#p_op{
			width: 350px;
			height: 36px;
			border-radius: 10px;
			border: 1px solid #231815;
			
		}
				
		.leftBlock {
		    width: 220px;
		    margin-right: 30px;
	 	    position: absolute; 
		    box-sizing: border-box;
		    border: 1px solid #d7d7d7;
		    border-top: 3px solid #fff5f3;
		    margin-top: 35px;
		}	
		
		.userInfo{
		    padding: 30px;
				
		}
		
		.userImg{
			border-radius: 70%
		}
		
		.userName,.userId{
			font-size: 15px;
    		color: #555;
    		margin-bottom: 6px;
		}
		
		.user{
			display: inline-block;
    		width: 100%;
  			padding: 0 20px 30px;
		}
		
		.myInfo,.petInfo{
			font-size: 13px;
		    color: #555;
		    float: left;
		    width: 48%;
		    margin-right: 2%;
		    height: 30px;
		    line-height: 28px;
		    background: #eaeaea;
		    border-radius: 50px;
		}
		
		.rightBlock{
		    padding: 35px 15px 80px 250px;
		    padding-left: 250px;
		    width: 100%;
		    box-sizing: border-box;
		    text-align: left;
		    min-height: 650px;
			
		} 
		
		.rightBlock2,.rightBlock3{
	    	width: 40%;
  		  	float: left;		
		    margin-left: 60px;
		}
		
		.pet_add{
		    font-size: 20px;
   	 		display: inline-block;
   			font-weight: bold;
		}
		
		.line{
	    	border-bottom: 1px solid #231815;
 		 	padding-bottom: 15px;
  			 height: 18px;
		}
	
		.p_name,.p_age,.p_gender,.p_type,
		.p_weight,.p_op{
			
			font-size: 15px;
		
		}
		
		
		.upload{
		    display: inline-block;
		    width: 100%;
			
		}

		.imgBtn{
		    line-height: 29px;
			margin-left: 170px;	
			margin-top: -32px;		
  		 	color: #fff !important;
			}
		
		.p_img{
			margin-left: 4px;
    		margin-top: 4;
		}
	
		.saveBtn{
		    padding-top: 30px;
			margin: 30px 0px 0;
	    	text-align: center;
			width: 100%;
   		 	display: inline-block;
    		position: relative;
			margin-left: 97px;
			margin-top: -140px;
		}
		
		a:link{
			text-decoration: none;			
		}
			
		.roundBtn {
			border-radius: 50px;
    		display: inline-block;
		    text-align: center;
		    transition: all 0.3s ease 0s;
		    height: 43px;
		    line-height: 41px;
		    cursor: pointer;
			width: 172px;
		}

		.whiteBtn {
			background: transparent;
    		border: 1px solid #231815;
  			box-sizing: border-box;
		
		}
		
		.blueBtn {
			background: #061f5c;
    		box-sizing: border-box;
   			color: #fff;
		}
		
		
	</style>

</head>
<body>

	<div class="pet_total">
		<hr>
		
		<div class="leftBlock">
			<div class= "userInfo">
				<div class="profile">
					<img src="<%=contextPath%>/images/profile.png" class="userImg">
				</div>
			</div>
			<div class="user" >
				<div class="userName">님</div>
				<div class="userId">()</div>
				<div class="infoBtn">
					<a href="#" class="myInfo">내 정보</a>
					<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
				</div>
			</div>
		
		</div>
		
		<div class="rightBlock">
			<div>
	 			<h2 class="pet_add">반려견 정보 등록</h2>
	 		</div>
			<div class="line"></div>
			<br><br>
			<div class="rightBlock2">	
				
				<div class="p_name">
					<label>반려견 이름</a></label><br>
					<input type="text" name="p_name" id="p_name">
				</div>	
				<br><br><br>
				
				
				<div class="p_age">
					<label>반려견 나이</a></label><br>
					<input type="text" name="p_age" id="p_age">
				</div>		
				<br><br><br>
				
				
				<div class="p_weight">
					<label>반려견 몸무게</a></label><br>
					<input type="text" name="p_weight" id="p_weight">
				</div>		
				<br><br><br>
				
				
				<div class="p_type">
					<label>반려견 견종</a></label><br>
					<input type="text" name="p_type" id="p_type">
				</div>		
				<br><br><br>
			
			
			</div>
			<div class="rightBlock3">
				<div class="p_gender">
					<label>성별</label><br>
						<select class="p_gender" name="p_gender" id="p_gender">
							<option>선택</option>
							<option>남아</option>
							<option>여아</option>
						</select>
				</div>
				<br><br><br>
				
				<div class="p_op">
					<label>중성화 수술 </label><br>
						<select class="p_op" name="p_op" id="p_op">
							<option>선택</option>
							<option>했음</option>
							<option>안했음</option>
						</select>
				</div>
				<br><br><br><br>
				<div class="upload">
					<div style="border: 1px solid #d7d7d7;
				                width: 140px;
				                height: 140px;">
						 <span>  
						    <img id="p_img" class="p_img" src="<%=contextPath%>/images/pet.png">
						 </span>	
				     	
				     	<div class="imgBtn">
					     	<input type="file"  name="imageFileName"  onchange="readURL(this);" />
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="saveBtn">
				<a href="javascript:history.go(-1);" class="roundBtn whiteBtn">취소하기</a>				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="roundBtn blueBtn">저장하기</a>
			</div>
	
	
	</div>
</body>

</html>
	