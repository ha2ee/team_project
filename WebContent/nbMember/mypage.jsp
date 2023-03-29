<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	String memImgPath = contextPath + "/memImg/";
	
%>

<%
	MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");
	
	String mem_name = mem_vo.getMem_name();
	String mem_img = mem_vo.getMem_img();
	
	TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");

	String tr_name = tr_vo.getTr_name();
	String tr_img = tr_vo.getTr_img();
	String id = (String)session.getAttribute("id");
%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro.jsp</title>

<link rel="stylesheet" href="<%=contextPath%>/nbMember/mypage.css">
</head>
<body>
	 <div class="myPageWrapper">
		 <div class="myPageContainer">
			<div class = "myPageTop">
				<div class ="myPageLeft" style="background-color: #3DB7CC;">
					<div id="myPageLeftTop">
					
					
					<div class="imgBox">
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
					<br><p><%=mem_name + tr_name%>(<%=id%>)</p>
					
					<a href="<%=contextPath%>/member/info.me" class="btn">내 정보 관리</a>
					
					<%
						if(tr_name != ""){
					%>
					
					<%
						}else{
					%>
						<a href="<%=contextPath%>/member/petInfo.me" class="btn">반려동물 정보 관리</a> 
					<%
						}
					%>
					
					
					
					
					</div>
				</div>
				<div class = "myPageRight mptr">
					<div onclick="location.href ='<%=contextPath%>/nb/edu.do?center=/nbShop/trainer.jsp'">
							<img class = "mypageImg" alt="" src="<%=contextPath%>/images/lesson.png">&nbsp;&nbsp;&nbsp;수강 신청
					</div>
					<div onclick="location.href='<%=contextPath%>/nb/cart.do?id=master&center=/nbShop/cart.jsp'">
						<img class = "mypageImg" alt="" src="<%=contextPath%>/images/cart.png">&nbsp;&nbsp;&nbsp;예약 정보
					</div>
					<div onclick="location.href = '<%=contextPath%>/tb/list.bo'">
						<img class = "mypageImg" alt="" src="<%=contextPath%>/images/info.png">&nbsp;&nbsp;&nbsp;훈련사 상담
					</div>
				</div> 
			</div>	 
		 </div>
	 </div>
	 
</body>
</html>