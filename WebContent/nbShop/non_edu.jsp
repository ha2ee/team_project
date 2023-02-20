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

	<!-- 	수강 신청  들어갈 항목 -->
	 수강 신청 "비회원" 예약 화면. jsp <br>
	 설명 : 썸네일 형식으로 강사 소개 <br>
	 <br>
	 예약하기 버튼 클릭 했을때 캘린더에서 날짜를 선택하고, <br>
	 예약일, 예약금액 정산 페이지를 띄우고 <br>
	 결제창을 띄운다음 <br>
	 1) 최종 예약 완료 메세지와 함께  <br>
	    "비회원" DB로 연결. <br>
	 2) "관리자" 페이지에 비회원 예약 내역을 연결 <br>
	 3) "훈련사" 페이지에 비회원 예약 내역을 연결 <br>
	 비회원 가입시 작성한 이메일 또는 휴대전화로 예약 일정을 전송(?) <br>
	 <br>
	 <br>
	 

</body>
</html>