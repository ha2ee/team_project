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
	 회원 로그인 시 예약 정보를 띄울 화면. jsp <br>
	 <br>
	 member_order DB에 들어갈 인적사항
	 <br>
	 hidden 태그로 담당 trainer 정보를 가져와서 trainer_order DB에 저장 시킴,
	 <br>
	버튼 (예약 확정, 예약 수정, 늘봄샵 이동)
	
	 <button>에약 확정</button> / <button>예약 수정</button> / <button>늘 봄샵 이동</button>
	 
	 <br>
	 <br>
</body>
</html>