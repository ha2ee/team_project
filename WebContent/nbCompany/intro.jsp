<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--  	 Top CSS 셋팅 -->
 	<link href="<%=request.getContextPath()%>/css/intro.css" rel="stylesheet">
<style>
</style>

<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>
<!-- 	회사 소개가 들어갈 항목 -->
<div id ="introtop">
	<div id="intro" >
		<h2>안녕하세요.<br>
		㈜늘 봄 대표 <br>
		<Strong>박 봄</Strong> 입니다.</h2>
		<br>
		많은 분이 반려견과 살아가고 있습니다.<br>
		어떤 반려견은 가족으로 어떤 반려견은 움직이는 봉제인형으로…<br>
		안타깝게도 사람들은 반려견이 자신의 생활을 방해한다고 느꼈을 때<br> 
		교육을 하려 합니다.<br>
		<br>
		시끄럽게 짖어서 민원이 들어왔을 때, 배변을 아무 곳에나 하고 다닐 때,<br>
		보호자와 한시도 떨어지지 못하는 반려견을 볼 때….
		<br>
		우리는 단지 이런 반려견의 행동을 멈추고 싶어 합니다.
		<br>
		왜 짖는 행동을 하게 되었는지 왜 사람을 물 수밖에 없었는지<br> 
		지금 하는 소변의 의미는 어떤 것인지 생각해보셨나요?
		<br>
		<strong>늘 봄</strong>에서는 짖는 행동을 문제라고 하지 않고 짖게 하였던 마음이 문제라고 합니다.
		<br>
		그럴 수밖에 없었던 반려견의 상황을 생각합니다.
		<br>
		그들은 입양 온 순간부터 한시도 빼놓지 않고 자신의 감정상태를 보호자에게 알리고 있었지만<br>
		그 신호는 항상 무시 되어왔을 겁니다. <br>
		끝내, 짖거나 무는 등 보호자가 알아듣기 쉬운 방법으로<br>
		그 마음을 표현하게 되었을 때 우리는 그것을 ‘문제행동’이라고 합니다.
		<br>
		그런 행동을 하는 반려견의 마음 상태는 온전할 수 없습니다.
		<br>
		반려견의 행동을 멈추겠다고 초크체인을 쓰고 강압적인 리더십으로 제압하고,<br>
		서열을 강조하는 교육은 사랑하는 반려견과의 관계만 망치고 말 겁니다.<br>
		<br>
		그렇다고 <strong>늘 봄</strong>이 무조건 칭찬만 하는 교육을 하진 않습니다.
		<br>
		때로는 거절을 통해 옳고 그른 행동을 알려주어, 우리가 사는 이 복잡한 도시환경에 적응하여<br>
		함께 잘 살아갈 수 있게 보듬어 주는 교육을 <strong>늘 봄</strong>이라고 말합니다.
		<br>
		<br>
		<strong>늘 봄</strong>은 보호자님과 반려견이 항상 행복하기를 바랍니다.
	</div>
	<div id = "introimg" >
		<a><img src="<%=contextPath%>//images/introimg.jpg" /></a>
	</div>
</div>
		
</body>
</html>