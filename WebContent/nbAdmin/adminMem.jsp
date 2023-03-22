<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
     <%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath(); 
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>전체 회원 목록</title>
</head>
<body>    
 
<div class="board-wrap">
 
    <!-- 게시글 목록 부분 -->
    <br>
    <div class="board-table">
        <table class="board-table" >
            <tr>
            	<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 닉네임</th>
				<th>회원 이메일</th>
				<th>회원 전화번호</th>
				<th>회원 가입일</th>
				<th>회원 펫 유무</th>
				<th>회원 삭제</th>
            </tr>
        <c:forEach var="mem" items="${requestScope.membersList}">
				<tr>
					<td><a class="mem_link" href="${contextPath}/adm/memDetail.adm?memberID=${mem.mem_id}">${mem.mem_id}</a></td>
					<td>${mem.mem_name}</td>
					<td>${mem.mem_nick}</td>
					<td>${mem.mem_email}</td>
					<td>${mem.mem_hp}</td>
					<td>${mem.mem_joindate}</td>
					<td>${mem.mem_pet}</td>
					<td><a class="mem_link" href="${contextPath}/adm/delMem.adm?delID=${mem.mem_id}">회원 삭제</a></td>
				</tr>
			</c:forEach>
        </table>
    </div>
    
    <!-- 페이지 넘버 부분 -->
    <br>
    <div id="pageForm">
        <c:if test="${startPage != 1}">
            <a href='memManage.adm?page=${startPage-1}'>[ 이전 ]</a>
        </c:if>
        
        <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
            <c:if test="${pageNum == spage}">
                ${pageNum}&nbsp;
            </c:if>
            <c:if test="${pageNum != spage}">
                <a href='memManage.adm?page=${pageNum}'>${pageNum}&nbsp;</a>
            </c:if>
        </c:forEach>
        
        <c:if test="${endPage != maxPage }">
            <a href='memManage.adm?page=${endPage+1 }'>[다음]</a>
        </c:if>
    </div>
    
    <!--  검색 부분 -->
    <br>
    <div id="searchForm">
        <form>
            <select name="opt">
                <option value="0">아이디</option>
                <option value="1">펫유무</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
    </div>
</div>    
 
</body>
</html>
