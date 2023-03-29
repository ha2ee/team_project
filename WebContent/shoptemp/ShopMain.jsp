<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="center" value="${requestScope.center}"/>
<c:out value="${center}" />
<c:if test="${center == null}">
	<c:set var="center" value="main.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>늘봄샵 메인</title>
<style>

</style>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- Bootstrap -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
    <!-- Style CSS -->
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <!-- 구글 폰트 -->
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet"> -->
<!--     FontAwesome CSS -->
<%--     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fontello.css"> --%>
<%--     <link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet"> --%>
    <link href="<%=request.getContextPath()%>/css/owl.carousel.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/owl.theme.default.css" rel="stylesheet">

<!--          			# 부트스트랩 플러그인  관련 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!--          			# 홈버튼 플러그인  관련 -->
<i class="bi bi-house"></i>
</svg>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<link rel="stylesheet" href="./Shop.css">
</head>
<body>

			<div id = "header"> 
			<header>
				<jsp:include page="header.jsp"/>
			</header>	
			</div>
			<div id = "middle">
				<jsp:include page="${center}" />
			</div>
			<div id = "footer">
				<footer>
				<jsp:include page="${contextPath}/Bottom.jsp" />
				</footer>
			</div>
</body>
</html>