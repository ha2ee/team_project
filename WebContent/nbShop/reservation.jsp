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

	<!-- 	예약 신청  들어갈 항목 -->
	 예약 신청 화면. jsp <br>
	 설명 : 회원 또는 비회원 상태에서 <br>
	 <br>
	 수강신청에서 가능한 예약일을 가져와서<br>
	 예약일, 예약금액에 대한 정산 페이지를 띄우고 <br>
	 샵 방문했는지 얼러트 띄우고, 안했다면 샵으로 이동할건지 한번 더 물어보고 간다면 샵으로 이동시킴<br>
	 안간다면?, 결제하시겠습니까? 여부를 묻고 
	 마이페이지로 이동시켜 수강 & 샵품목 확인 시킨 후<br>
	 결제 진행 하도록 한다 <br>
	 1) 최종 예약 완료 메세지와 함께  <br>
	    "회원" 마이페이지로 예약 내역 및 주문 내역을 보내주고 연결. <br>
	 2) "관리자" 페이지에 예약 내역을 연결 <br>
	 3) "훈련사" 페이지에 예약 내역을 연결 <br>
	 비회원은 가입시 입력한 전화번호로 , 회원은 회원정보에 있는 이메일 또는 전화번호로 예약 일정을 전송(?) <br>
	 <br>
	 <br>
	 

</body>
</html>