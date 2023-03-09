<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
admMemCtr.jsp 페이지
<div>
<a href="${contextPath}/adm/memManage">회원 관리</a>
</div>

<div>
<a href="#">트레이너 관리</a>
</div>

<div>
<a href="#">게시판 관리</a>
</div>
</body>
</html>