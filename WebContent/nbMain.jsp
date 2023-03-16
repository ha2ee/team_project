<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// ProjectMain.jsp를 사용하기 위해 WEB-INF/lib에 라이브러리 추가함
%>    
    
<%-- JSTL태그의 core라이브러리 관련 태그들을 사용하기 위해 import --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 센터 중앙 화면 공간은 상위 메뉴를 클릭할때 마다 계속 변화되어 나타나야 하기 때문에
	request내장객체 영역으로 부터 중앙 화면 공간의 View주소를 얻어와 변수에 저장 해야 합니다.
 --%>
<%-- <c:set var="center" value="${param.center}"/> --%>
<c:set var="center" value="${requestScope.center}"/>
<c:out value="${center}" />
 
<%-- 처음으로 CarMain.jsp 메인화면을 요청 했을때... 중앙화면은 Center.jsp로 보이게 설정하자 --%>
 
<c:if test="${center == null}">

	<c:set var="center" value="Center.jsp"/>
</c:if>
<!DOCTYPE html>
<html> 
<head>
<!-- 날씨 관련 스크립트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- nbMain CSS -->
<link href="<%=request.getContextPath()%>/css/nbMain.css" rel="stylesheet">
<style type="text/css">

/*  나눔 고딕 글꼴 임포트 */
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
/* 나눔 고딕 CSS 설정 */

* {
	font-family : 'Nanum Gothic', sans-serif;
}

</style>
<title>ProjectMain.jsp</title>
</head>
<body>

			<div id = "header">
			<header>
				<jsp:include page="Top.jsp"/>
			</header>	
			</div>
			<div id = "middle">
				<jsp:include page="${center}" />
			</div>
			<div id = "footer">
				<footer>
				<jsp:include page="Bottom.jsp" />
				</footer>
			</div>
</body>
</html>