<%@page import="VO.PetVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>
<%
	MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");
	
	String mem_name = mem_vo.getMem_name();	
	String mem_img = mem_vo.getMem_img();
	
	PetVo pet_vo = (PetVo)request.getAttribute("pet_vo");
	
	String p_name = pet_vo.getP_name();	
	int p_age = pet_vo.getP_age();
	String p_gender = pet_vo.getP_gender();
	String p_type = pet_vo.getP_type();
	String p_op = pet_vo.getP_op();
	int p_weight = pet_vo.getP_weight();
	String p_img = pet_vo.getP_img();
	
	String id = (String)session.getAttribute("id");

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
	    padding: 3px 15px 80px 250px;
	    padding-left: 300px;
	    width: 100%;
	    box-sizing: border-box;
	    text-align: left;
	    min-height: 850px;
		
	} 

	.table{
		width: 100%;
	    border-top: 1px solid #d5d5d5;
	    border-bottom: 1px solid #e9e9e9;
	
	}
	
	.pet1{
		font-size: 25px;
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
		border-top: 1px solid #e9e9e9;
	}

	.img_dd{
		position: relative;
	    float: left;
	    width: 513px;
	    padding: 25px 0 25px 28px;
	    border-top: 1px solid #e9e9e9;
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
	.name_dt,.age_dt,.weight_dt,
	.type_dt,.op_dt,.gender_dt,
	.btn_dt{
		padding-top: 37px;
		border-top: 1px solid #e9e9e9;
	    display: table-cell;
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
	
	.name_dd,.age_dd,.weight_dd,
	.type_dd,.op_dd,.gender_dd,
	.btn_dd{
	    position: relative;
	    float: left;
	    width: 513px;
	    padding: 20px 0 20px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	
	.p_name,.p_age,.p_weight,
	.p_type,.p_op,.p_gender{
		width: 250px;
		height: 36px;
		color: black;
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
		color: black;
		
	}
	
	.blueBtn {
		background: #061f5c;
   		box-sizing: border-box;
		color: #fff;
		border: 1px solid #231815;
		
	}
	
	.saveBtn{
		margin-left: -50px;
	}
	
	.petBtn{
		margin-bottom: 25px;
		margin-left: 28px
	
	}
	
	.Info{
   		border: 0px solid #231815;
		color: #555;
		border-radius: 8px;
   		display: inline-block;
	    text-align: center;
	    transition: all 0.3s ease 0s;
	    height: 43px;
	    line-height: 43px;
	    cursor: pointer;
		width: 190px;
		margin-right: 25px;
		background-color: white;
	}
	
	a:hover {
 	 	text-decoration: none;
	}
	
	.title{
	    margin-bottom: 15px;
    	font-weight: bold;
		font-size: 21px;
	}
	
	
</style>

</head>
<body>
	<form action="<%=contextPath%>/member/petChangePro.me">	
		<div class="pet_total">
			<hr>
			
			<div class="leftBlock">
				<div class= "userInfo">
					<div class="profile">
						<img src="<%=contextPath%>/images/profile.png" class="userImg">
					</div>
				</div>
				<div class="user" >
					<div class="userName"><%=mem_name%>님</div>
					<div class="userId">(<%=id%>)</div>
					<div class="infoBtn">
						<a href="<%=contextPath%>/member/info.me" class="myInfo">내 정보</a>
						<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					</div>
				</div>
			
			</div>
			<div class="rightBlock">
				<div class="title">
					<p>정보 수정</p>
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
					<dt class="name_dt">
						<span>이름</span>
					</dt>
					<dd class="name_dd">
						<div class="name_div">
							<input type="text" name="p_name" class="p_name" value="<%=p_name%>">
						</div>
					</dd>				
					<dt class="age_dt">
						<span>나이</span>
					</dt>
					<dd class="age_dd">
						<div class="age_div">
							<input type="text" name="p_age" class="p_age" value="<%=p_age%>">&nbsp;세
						</div>
					</dd>				
					<dt class="weight_dt">
						<span>몸무게</span>
					</dt>
					<dd class="weight_dd">
						<div class="weight_div">
							<input type="text" name="p_weight" class="p_weight" value="<%=p_weight%>">&nbsp;kg
						</div>
					</dd>				
					<dt class="type_dt">
						<span>견종</span>
					</dt>
					<dd class="type_dd">
						<div class="type_div">
							<input type="text" name="p_type" class="p_type" value="<%=p_type%>">
						</div>
					</dd>				
					
					<dt class="gender_dt">
						<span>성별</span>
					</dt>
					<dd class="gender_dd">
						<div class="gender_div">
							<select class="p_gender" name="p_gender" id="p_gender" value="<%=p_gender%>">
								<option value="남아">남아</option>
								<option value="여아">여아</option>
							</select>
						<input id="hidden_gen" type="hidden" value="<%=p_gender%>">
						</div>
					</dd>				
					
					<dt class="op_dt">
						<span>중성화 수술</span>
					</dt>
					<dd class="op_dd">
						<div class="op_div">
							<select class="p_op" name="p_op" id="p_op" value="<%=p_op%>">
								<option value="했음">했음</option>
								<option value="안했음">안했음</option>
						<input id="hidden_op" type="hidden" value="<%=p_op%>">
							</select>
							
						</div>
					</dd>				
					
					<dt class="btn_dt">
					</dt>
					<dd class="btn_dd">
						<div class="saveBtn">
							<a id="backBtn" href="javascript:history.go(-1);" class="roundBtn whiteBtn">취소하기</a>				
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a id="changeBtn" 
							   href="#" 
							   class="roundBtn blueBtn"
							   onclick="petInfoChange(); return false;"
							   >저장</a>
						</div>
					</dd>				
				
					
				</dl>
			
			
			</div>
		</div>
	</form>
	<script type="text/javascript">
		
		$(function() {
			
			if($("#hidden_gen").val() == "남아" ){

				$("#p_gender").val("남아").prop("selected", true);
					
			}else if ($("#hidden_gen").val() == "여아"){
				
				$("#p_gender").val("여아").prop("selected", true);
				
			}

			if($("#hidden_op").val() == "했음" ){
	
				$("#p_op").val("했음").prop("selected", true);
					
			}else if($("#hidden_op").val() == "안했음"){
				
				$("#p_op").val("안했음").prop("selected", true);
			
				
			}
		});
	
	
		  $("#backBtn").mouseover(function(){

		    $("#backBtn").css("background-color", "#061f5c");
		    $("#backBtn").css("color", "white");
			
		  });

		  $("#backBtn").mouseout(function(){

		    $("#backBtn").css("background-color", "transparent");
		    $("#backBtn").css("color", "#23527c");

		  });
		
		  
		  $("#changeBtn").mouseover(function(){

		    $("#changeBtn").css("background-color", "white");
		    $("#changeBtn").css("color", "#33333");
		  });

		  $("#changeBtn").mouseout(function(){

		    $("#changeBtn").css("background-color", "#061f5c");
		    $("#changeBtn").css("color", "#white");

		  });
	
		  


		  
	
	
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/petJoin.js"></script>
</body>
</html>