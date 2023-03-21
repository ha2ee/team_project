<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 조회화면</title>
</head>
<body>

<div class="board-wrap">
 
    <!-- 게시글 목록 부분 -->
    <br>
    <h3>아이디를 누르시면 회원 상세 정보를 조회 할 수 있습니다.</h3>
    <div class="board-table">
        <table class="board-table" >
			<tr>
				<th>트레이너 아이디</th>
				<th>트레이너 이름</th>
				<th>트레이너 이메일</th>
				<th>트레이너 전화번호</th>
				<th>트레이너 가입일</th>
				<th>트레이너 삭제</th>
			</tr>
			<c:forEach var="trMem" items="${requestScope.trMembersList}">
				<tr>
					<td><a href="${contextPath}/adm/trMemDetail.adm?trMemberID=${trMem.tr_id}">${trMem.tr_id}</a></td>
					<td>${trMem.tr_name}</td>
					<td>${trMem.tr_email}</td>
					<td>${trMem.tr_hp}</td>
					<td>${trMem.tr_joindate}</td>
					<td><a href="${contextPath}/adm/delMem.adm?delID=${trMem.tr_id}">트레이너 삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	</div>
</body>
</html>