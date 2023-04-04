<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<c:set var="center" value="${requestScope.center}"/>


<c:if test="${center == null}">
	<c:set var="center" value="adminCenter.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/adminPage.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/nbBoard/TrainerBoard.css">
</head>
<body>
	<div class="container">
		<aside class="sidebar">
			<h2><a href="${contextPath}/adm/adminMain">관리자</a></h2>
			<ul class="menu">
				<li><a href="${contextPath}/nb/Main">늘봄홈페이지로 돌아가기</a></li>
				<li><a href="${contextPath}/adm/adminMain">관리자 메인으로</a></li>
				<li><a href="${contextPath}/adm/memManage.adm">회원 리스트 관리</a></li>
				<li><a href="${contextPath}/adm/trManage.adm">훈련사 리스트 관리</a></li>
				<li><a href="${contextPath}/adm/temTrManage.adm">훈련사 가입 승인</a></li>
				<li><a href="#" onclick="return false;"class="board_manage">게시판 관리</a>
					<ul class="submenu">
						<li><a href="${contextPath}/adm/freeBoardList.adm">자유게시판</a></li>
						<li><a href="${contextPath}/adm/trBoardList.adm">훈련사 상담 게시판</a></li>
						<li><a href="${contextPath}/adm/reviewBoardList.adm">수강 후기 게시판</a></li>
					</ul></li>
			</ul>
		</aside>
		<section class="content">
		<c:out value="${center}" />
			<h2>관리자 페이지</h2>
			<jsp:include page="${center}"/>
		</section>
	</div>
	<script src="${contextPath}/js/adminPage.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>