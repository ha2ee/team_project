<%@page import="DAO.TrainerBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%TrainerBoardDAO trainerboarddao = new TrainerBoardDAO(); 
	request.setAttribute("trainerboarddao", trainerboarddao);
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="trainerboarddao" value="${trainerboarddao}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자센터페이지</title>
<style type="text/css">

</style>
</head>
<body>
	<div class="center_Container">
		<div class="centerBox_1"><h3>회원목록</h3><a class="seeMore" href="${contextPath}/adm/memManage.adm">&#43;</a><hr>
		<table class="center_memTable" >
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 닉네임</th>
				<th>회원 전화번호</th>
				<th>회원 가입일</th>
			</tr>
			<c:forEach var="mem" items="${requestScope.membersList}">
				<tr>
					<td><a class="link" href="${contextPath}/adm/memDetail.adm?memberID=${mem.mem_id}"><b>${mem.mem_id}</b></a></td>
					<td>${mem.mem_name}</td>
					<td>${mem.mem_nick}</td>
					<td>${mem.mem_hp}</td>
					<td>${mem.mem_joindate}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="centerBox_2"><h3>트레이너 목록</h3><a class="seeMore" href="${contextPath}/adm/trManage.adm">&#43;</a><hr>
			<table class="center_trTable" >
				<tr>
					<th>트레이너 아이디</th>
					<th>트레이너 이름</th>
					<th>트레이너 전화번호</th>
					<th>트레이너 가입일</th>
				</tr>
				<c:forEach var="trMem" items="${requestScope.trMembersList}">
					<tr>
						<td><a class="link" href="${contextPath}/adm/trMemDetail.adm?trMemberID=${trMem.tr_id}"><b>${trMem.tr_id}</b></a></td>
						<td>${trMem.tr_name}</td>
						<td>${trMem.tr_hp}</td>
						<td>${trMem.tr_joindate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="centerBox_3"><h3>자유게시판</h3><a class="seeMore" href="${contextPath}/adm/freeBoardList.adm">&#43;</a><hr></div>
		<div class="centerBox_4"><h3>훈련사 상담</h3><a class="seeMore" href="${contextPath}/adm/trBoardList.adm">&#43;</a><hr>
		<table class="center_memTable" >
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
		<c:forEach var="trBoard" items="${requestScope.trBoardList}">
            <tr class="trBoard2">
                <td>
	               	<c:if test="${trBoard.tb_level > 0}">
	                	:RE
	                	<a class="link" href="trBoardRead.adm?tb_idx=${trBoard.tb_idx}&pageNum=1" style="width:60px; display:inline-block; vertical-align: text-bottom;" >
	                	<b>${trBoard.tb_title}</b>
                    	</a>
	                </c:if>
	                <c:if test="${trBoard.tb_level eq 0}">
                    <a class="link" href="trBoardRead.adm?tb_idx=${trBoard.tb_idx}&pageNum=1" >
                    	<b>${trBoard.tb_title}</b>
                    </a>
                    </c:if>
                </td>
                <td>
                    <c:choose>
                	<c:when test="${!trainerboarddao.checkTable(trBoard.tb_id)}">
                		<b>🍎${trBoard.tb_name}</b>
                	</c:when>
                	<c:otherwise>
                		${trBoard.tb_name}
                	</c:otherwise>
                </c:choose>
                </td>
                <td>${trBoard.tb_date}</td>
            </tr>
        </c:forEach>
        </table>
		
		</div>
		<div class="centerBox_5"><h3>수강 후기</h3><a class="seeMore" href="${contextPath}/adm/memManage.adm">&#43;</a><hr></div>
	</div>
	
	
	
	
</body>
</html>