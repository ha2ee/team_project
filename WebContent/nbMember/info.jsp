<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String memImgPath = contextPath + "/memImg/";
%>

<%
	MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");
	
	String mem_nick = mem_vo.getMem_nick();
	String mem_name = mem_vo.getMem_name();
	String mem_hp = mem_vo.getMem_hp();
	String mem_birth = mem_vo.getMem_birth();
	String mem_email = mem_vo.getMem_email();
	String mem_address2 = mem_vo.getMem_address2();
	String mem_address4 = mem_vo.getMem_address4();
	String mem_address5 = mem_vo.getMem_address5();
	String mem_img = mem_vo.getMem_img();
	String mem_id = mem_vo.getMem_id();
	
	String mem_address = mem_address2 + " " +mem_address4 + " " + mem_address5;
	
	TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");
	
	String tr_name = tr_vo.getTr_name();
	String tr_hp = tr_vo.getTr_hp();
	String tr_birth = tr_vo.getTr_birth();
	String tr_email = tr_vo.getTr_email();
	String tr_address2 = tr_vo.getTr_address2();
	String tr_address4 = tr_vo.getTr_address4();
	String tr_address5 = tr_vo.getTr_address5();
	String tr_img = tr_vo.getTr_img();
	String tr_address = tr_address2 + tr_address4 + tr_address5;
	String id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
			<link rel="stylesheet" href="<%=contextPath%>/css/info.css">

</head>

<body>
	<div class="total">
		<hr>
		
		<div class="leftBlock">
			<div class= "userInfo">
				
<%--  				<c:set var="img" value="${mem_vo}"> --%>
<%-- 			<c:set var="img" items="${requestScope.mem_vo}"> --%>
				<div class="profile">
					
					<%
						if(mem_img == "profile.png" || tr_img == "profile.png"){
					%>
  						<img src="<%=contextPath%>/images/profile.png" class="userImg">  
					<%
						}else{
					%>
						<img src="<%=memImgPath+mem_img+tr_img%>" class="userImg">
					<%
						}
					%>
				
				
				
				</div>
				
				
<%-- 				</c:set> --%>
			</div>
			<div class="user" >
				<div class="userName"><%=mem_name + tr_name%>님</div>
				<div class="userId">(<%=id%>)</div>
				<div class="infoBtn">
					<a href="#" class="myInfo">내 정보</a>
					<%
					if(mem_id != ""){
					%>					
					<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					<%
					}else{
					%>
					
					<%
					}
					%>
				</div>
			</div>
		</div>
		<div class="rightBlock">
			<div>
				<p class="title" 
				style="margin-bottom: 15px;
				font-weight: bold;"	
				>회원 정보</p>
			</div>
			<dl class="teble">

				<dt class="dt">
					<span>아이디</span>
				</dt>
				<dd class="dd">
					<div class="id_div">
						<p><%=id%></p>
					</div>
				</dd>
				<dt class="dt">
					<span>이름</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_name + tr_name%></p>
					</div>
				</dd>			
				
				<%
				if(mem_nick != ""){
				%>
				<dt class="dt">
					<span>닉네임</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_nick%></p>
					</div>
				</dd>			
				<%
				} else{
				%>
				
				<%
				}
				%>
				
				
				<dt class="dt">
					<span>생년월일</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_birth + tr_birth%></p>						
					</div>
				</dd>			
				<dt class="dt">
					<span>전화번호</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_hp + tr_hp%></p>					
					</div>
				</dd>			
				<dt class="dt">
					<span>email</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_email + tr_email%></p>
					</div>
				</dd>			
				<dt class="dt">
					<span>주소</span>
				</dt>
				<dd class="dd">
					<div>
						<p><%=mem_address + tr_address%></p>
					</div>
				</dd>			
				<dd class="btn_dd">
					<div class="saveBtn">
						<a id="backBtn" href="<%=request.getContextPath()%>/nb/mypage.me?center=/nbMember/mypage.jsp" class="roundBtn whiteBtn">뒤로가기</a>				
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a id="changeBtn" href="<%=contextPath%>/member/changeInfo.me" class="roundBtn blueBtn">수정하기</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button  id="delBtn" class="roundBtn blueBtn">회원탈퇴</button>
					</div>
				</dd>	
				
			</dl>
		</div>
	</div>


	<script type="text/javascript">
	$(document).ready(function(){

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
 		    $("#changeBtn").css("color", "#23527c");
		  });

		  $("#changeBtn").mouseout(function(){

		    $("#changeBtn").css("background-color", "#061f5c");
		    $("#changeBtn").css("color", "white");

		  });
		
		  
		  
		  $("#delBtn").mouseover(function(){

		    $("#delBtn").css("background-color", "white");
		    $("#delBtn").css("color", "#23527c");
		  });

		  $("#delBtn").mouseout(function(){

		    $("#delBtn").css("background-color", "#061f5c");
		    $("#delBtn").css("color", "white");

		  });
		

		  
		  
		  
		});
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	

	<%--회원정보 수정 유효성 체크  --%>
	<script src="<%=request.getContextPath()%>/js/change.js"></script>
	
</body>
</html>






