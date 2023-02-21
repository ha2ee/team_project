<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>

	<br>
	<br>
	<br>
	<br>
	<br>
	
	<!-- 	캘린더  들어갈 항목 -->
	 예약 일정 확인 화면. jsp <br>
	 설명 : 캘린더를 띄워주고, 하단에 가능한 강사를 선택(?), 또는 자동으로 비어있는 강사를 매칭해서 일정 및 금액 확인 페이지로 넘김<br>
	 <br>
	 상단부에 캘린더, 하단부에 캘린더에 원하는 날짜를 클릭 했을때, 훈련사들의 예약내역을 조회 해 와서, 1명이라도 비어있으면 가능하다는 메세지를 띄우고 <br>
	 아무도 없을 경우에는 마감되었다고 메세지를 띄워준다. <br>
	 선택 된 값을 다음 페이지로 전달 시켜서 일정과 금액을 확인시킨다 <br>
	 <br>
	 예약 시작 가능일은 현재 날짜에서 1주일 이후부터 가능 (주문취소,주문수정 가능일이 7일 이내 이기 때문)<br>
	 
	 
	  체크 사항 : 가능한 트레이너를 초이스 하고 일정 or 비어있는 트레이너로 랜덤 배정<br>
	  
	  
	  
	  <a href="<%=request.getContextPath()%>/nb/member.do?center=/nbShop/edu_reservation.jsp" ><button>회원 예약</button></a> / <a href="<%=request.getContextPath()%>/nb/nonMember.do?center=/nbShop/non_edu_reservation.jsp" ><button>비회원 예약</button></a> / <a href="<%=request.getContextPath()%>/nb/calendar.do?center=/nbShop/calendar.jsp" ><button>예약 초기화</button></a>
	 <br>
	 <br>
</body>
</html>