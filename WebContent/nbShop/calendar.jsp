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
	<!-- 	캘린더  들어갈 항목 -->
	 예약 일정 확인 화면. jsp <br>
	 설명 : 캘린더를 띄워주고, 하단에 가능한 강사를 선택(?), 또는 자동으로 비어있는 강사를 매칭해서 일정 및 금액 확인 페이지로 넘김<br>
	 <br>
	 상단부에 캘린더, 하단부에 캘린더에 원하는 날짜를 클릭 했을때, 훈련사들의 예약내역을 조회 해 와서, 1명이라도 비어있으면 가능하다는 메세지를 띄우고 <br>
	 아무도 없을 경우에는 마감되었다고 메세지를 띄워준다. <br>
	 선택 된 값을 다음 페이지로 전달 시켜서 일정과 금액을 확인시킨다 <br>
	 
	 <br>
	 <br>
</body>
</html>