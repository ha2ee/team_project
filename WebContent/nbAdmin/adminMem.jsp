<%@ page language="java" contentType="text/html; charset=UFT-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* 게시판을 감싸는 div의 스타일 */
		.board-wrap {
		  margin: 20px 0; /* 중앙 정렬 */
		  max-width: 1200px; /* 최대 가로 너비 지정 */
		}
		
		/* 게시판 목록 테이블의 스타일 */
		.board-table {
		  width: 100%;
		  border-collapse: collapse; /* 테두리 합치기 */
		  border-top: 2px solid #ddd; /* 상단 테두리 지정 */
		}
		
		/* 게시판 목록 테이블의 th와 td 스타일 */
		.board-table th, .board-table td {
		  padding: 10px 20px; 
 		  text-align: center;
		  border-bottom: 1px solid #ddd; 
		}
		
		/* 게시판 목록 테이블의 th 스타일 */
		.board-table th {
		  background-color: #f5f5f5; /* 배경색 지정 */
		}
		
		/* 게시판 목록 테이블의 td > a 스타일 */
		.board-table td > a {
		  color: #333; /* 링크 색상 지정 */
		  text-decoration: none; /* 밑줄 제거 */
		  font-weight: bold; /* 글씨체 굵기 지정 */
		}
		
		/*마우스 올리면 색 변환*/
		.board-table td:nth-child(2) a:hover {
		  color: #f44336;
		}

</style>
</head>
<body>

<div class="board-wrap">
 
    <!-- 게시글 목록 부분 -->
    <br>
    <div class="board-table">
        <table class="board-table" >
			<tr>
				<th>회원 아이디</th>
				<th>회원 닉네임</th>
				<th>회원 이메일</th>
				<th>회원 전화번호</th>
				<th>회원 가입일</th>
				<th>회원 펫 유무</th>
			</tr>
			<c:forEach var="mem" items="${requestScope.membersList}">
				<tr>
					<td>${mem.mem_id}</td>
					<td><a href="read.bo?tb_idx=${board.tb_idx}&pageNum=${spage}">
							${mem.mem_nick} </a></td>
					<td>${mem.mem_email}</td>
					<td>${mem.mem_hp}</td>
					<td>${mem.mem_joindate}</td>
					<td>${mem.mem_pet}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- 페이지 넘버 부분 -->
	<br>
	<%-- <div id="pageForm">
		<c:if test="${startPage != 1}">
			<a href='list.bo?page=${startPage-1}'>[ 이전 ]</a>
		</c:if>

		<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
			<c:if test="${pageNum == spage}">
                ${pageNum}&nbsp;
            </c:if>
			<c:if test="${pageNum != spage}">
				<a href='list.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
			</c:if>
		</c:forEach>

		<c:if test="${endPage != maxPage }">
			<a href='list.bo?page=${endPage+1 }'>[다음]</a>
		</c:if>
	</div> --%>

	<!--  검색 부분 -->
	<br>
	<!-- <div id="searchForm">
		<form>
			<select name="opt">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">제목+내용</option>
				<option value="3">글쓴이</option>
			</select> <input type="text" size="20" name="condition" />&nbsp; <input
				type="submit" value="검색" />
		</form>
	</div> -->
	</div>
</body>
</html>