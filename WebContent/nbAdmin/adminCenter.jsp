<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
admMemCtr.jsp 페이지
<div>
<a href="${contextPath}/adm/memManage.adm">회원 관리</a>
</div>

<div>
<a href="#">트레이너 관리</a>
</div>

<div>
<a href="#">게시판 관리</a>
</div>
</body>
</html>