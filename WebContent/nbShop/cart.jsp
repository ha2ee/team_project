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
	<!-- 	장바구니  들어갈 항목 -->
	장바 구니 화면. jsp <br>
	 설명 : 상단에는 신청한 수강정보를 확인 할 수있도록 하고<br>
	 <br>
	 하단부에는 샵에서 장바구니에 담은 목록을 확인 시킨다<br>
	 그 밑에는 최종 합산 금액 및 결제하기, ,장바구니비우기(?), 결제취소하기(고민중일 경우) 버튼을 만든다.
	 <br>
	 <br>
	 
</body>
</html>