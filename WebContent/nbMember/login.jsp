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
	<!-- 	회원가입  들어갈 항목 -->
	로그인 화면. jsp <br>
	 설명 : 비회원 로그인 (전화번호,비번) -> 마이페이지로 연결 시키고,<br>
	 회원 로그인(기본) 과 훈련사 로그인 을 별도로 만든다.
	 <br>
	 체크사항 : 관리자로 로그인 했을 경우 hidden 되어 있던 훈련사 내역, 전체 주문내역 조회 등의 기능을 보이게 한다. <br>
	 <br>
	 <br>
</body>
</html>