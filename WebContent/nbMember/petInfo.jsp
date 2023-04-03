<%@page import="VO.PetVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String memImgPath = contextPath + "/memImg/";
	String petImgPath = contextPath + "/petImg/";
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
		<link rel="stylesheet" href="<%=contextPath%>/css/petInfo.css">
</head>
<body>
	<form method="post">
		<div class="pet_total">
			<hr>
			
			<div class="leftBlock">
				<div class= "userInfo">
					<div class="profile">
						<%
							if(mem_img == "profile.png"){
						%>
	  						<img id="preview" src="<%=contextPath%>/images/profile.png" class="userImg">  
						<%
							}else{
						%>
							<img id="preview" src="<%=memImgPath+mem_img%>" class="userImg">
						<%
							}
						%>
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
			
			
			<%
			if(p_name == ""){
			%>	
				<h1> 애완견 정보를 등록하여 주세요</h1>
			
			<% 	
			}	
			%>
			
			<div class="rightBlock">
				

				
			
				
			 	<p class="title">반려견 정보</p>
				
				
				<dl class="teble">
					<dt class="img_dt">
						<span>사진</span>
					</dt>
					<dd class="img_dd">
						<div class="upload">
							<span>  
							
							<%
								if(p_img == "" || p_img == null){
							%>
 							    <img id="p_img" class="p_img" src="<%=contextPath%>/images/pet.png"> 
							<%
								}else{
							%>
							
								<img src="<%=petImgPath+p_img%>" class="p_img" id="p_img"> 
							<%
								}
							%>
							
							</span>	
<!-- 
							<div class="imgBtn">
								<label for="images" class="drop-container">
					     		<input id="imgBtn" type="file"  name="petImageFileName"  onchange="readURL(this);" />
							   	</label>
								<button id="petImgSave" class="petImgSave">저장</button>
							</div>
-->
						</div>
					</dd>
					<dt class="name_dt">
						<span>이름</span>
					</dt>
					<dd class="name_dd">
						<div class="name_div">
							<p name="p_name" class="p_name" ><%=p_name%></p>
						</div>
					</dd>				
					<dt class="age_dt">
						<span>나이</span>
					</dt>
					<dd class="age_dd">
						<div class="age_div">
							<p type="text" name="p_age" class="p_age">&nbsp;<%=p_age%>세</p>
						</div>
					</dd>				
					<dt class="weight_dt">
						<span>몸무게</span>
					</dt>
					<dd class="weight_dd">
						<div class="weight_div">
							<p type="text" name="p_weight" class="p_weight" >&nbsp;<%=p_weight%>kg</p>
						</div>
					</dd>				
					<dt class="type_dt">
						<span>견종</span>
					</dt>
					<dd class="type_dd">
						<div class="type_div">
							<p type="text" name="p_type" class="p_type" ><%=p_type%></p>
						</div>
					</dd>				
					
					<dt class="gender_dt">
						<span>성별</span>
					</dt>
					<dd class="gender_dd">
						<div class="gender_div">
							<p class="p_gender" name="p_gender" id="p_gender"><%=p_gender%></p>
							</select>
						</div>
					</dd>				
					
					<dt class="op_dt">
						<span>중성화 수술</span>
					</dt>
					<dd class="op_dd">
						<div class="op_div">
							<p class="p_op" name="p_op" id="p_op"><%=p_op%></p>
							</select>
							
						</div>
					</dd>				
					
					<dt class="btn_dt">
					</dt>
					<dd class="btn_dd">
<%-- 						
						<div class="saveBtn">
							
														
							<%
								if(p_name == "" || p_name == null){
							%>
							
							<%
								}else{
							%>
								<a id="backBtn" href="<%=contextPath%>/member/petChange.me" class="roundBtn whiteBtn">정보 수정하기</a>				
							<%
								}
							%>
							
							
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a id="changeBtn" href="<%=contextPath%>/member/petJoin.me" class="roundBtn blueBtn">애완견 등록하기</a>
						</div>
 --%>
					</dd>				
				</dl> 
			
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
	
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
	
		  
		  
		  
		 
		  $("#Info1").mouseover(function(){

		    $("#Info1").css("background-color", "lightpink");
		    $("#Info1").css("color", "white");
			
		  });

		  $("#Info1").mouseout(function(){

		    $("#Info1").css("background-color", "white");
		    $("#Info1").css("color", "black");

		  });
		
		 
		  $("#Info2").mouseover(function(){

		    $("#Info2").css("background-color", "lightpink");
		    $("#Info2").css("color", "white");
			
		  });

		  $("#Info2").mouseout(function(){

		    $("#Info2").css("background-color", "white");
		    $("#Info2").css("color", "black");

		  });
		
		 
		  $("#Info3").mouseover(function(){

		    $("#Info3").css("background-color", "lightpink");
		    $("#Info3").css("color", "white");
			
		  });

		  $("#Info3").mouseout(function(){

		    $("#Info3").css("background-color", "white");
		    $("#Info3").css("color", "black");

		  });
		

		
	

	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>