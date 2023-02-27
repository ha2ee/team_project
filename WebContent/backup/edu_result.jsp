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
	 마이페이지에서 수강 정보를 조회했을 때 나올 화면. jsp <br>
	 <br>
	 담당 트레이너 정보 , 예약일 , 예약 정보를 출력
	 <br>
	 예약 취소 및 수정은 주문 일 기준 7일 이내만 가능 7일이 지날경우 예약 취소 기능을 disable 시킨다.
	 <br>
	
	
	 <button>홈 으로</button> / <button>예약 취소</button> / <button>예약 수정</button>
	 
	 <br>
	 <br>
</body>
</html>