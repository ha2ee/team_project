<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>

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
	    padding-left: 360px;
	    width: 100%;
	    box-sizing: border-box;
	    text-align: left;
	    min-height: 650px;
		
	} 

	.pet1{
  	 	padding: 43px 0 0 0;
	}

	.table{width: 100%;
	    border-top: 1px solid #d5d5d5;
	    border-bottom: 1px solid #e9e9e9;
	    background: url(//res.afreecatv.com/images/account/bg_input.gif) repeat-y;
	
	}

	.img_dt{
		padding-top: 93px;
		position: relative;
	    float: left;
	    width: 204px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    color: #555;
	    font-family: 'NGB';
	    font-size: 14px;
	    line-height: 100%;
	}

	.img_dd{
		position: relative;
	    float: left;
	    width: 513px;
	    padding: 25px 0 25px 28px;
	}
	.p_img{
		margin-left: 4px;
  		margin-top: 4px;
		}
	
	.upload{
	    display: inline-block;
	    width: 100%;
		}	
	.imgBtn{
		height: 25px;
		margin-left: 170px;	
		margin-top: -24px;		
	 	color: #fff !important;
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
			
			<div class="pet1">
				<h2>반려견 정보1</h2>
			</div>
			<dl class="teble">
				<dt class="img_dt">
					<span>사진</span>
				</dt>
				<dd class="img_dd">
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
				</dd>
			
			
			</dl>
		
		
		
		
		</div>
	</div>
	
	
	
	
	
</body>
</html>