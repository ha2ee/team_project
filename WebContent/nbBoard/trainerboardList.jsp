<%@page import="DAO.TrainerBoardDAO"%>
<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
     <%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath(); 
	
	TrainerBoardDAO tDAO = new TrainerBoardDAO();
	boolean check = false;
	
%>
<html>
<head>
    <title>전체 게시글</title>
    <style type="text/css">
    	/* 게시판을 감싸는 div의 스타일 */
		.board-wrap {
		  margin: 20px auto; /* 중앙 정렬 */
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
/* 		  text-align: center;  */
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
		
		#newContent {
		  float : right;
		  position : relative;
		  top : 10px;
		  background-color: #f44336;
		  color: white;
		  border: none;
		  padding: 10px;
		  font-size: 16px;
		  font-weight: bold;
		  cursor: pointer;
		}
   
    </style>
    
    
    <script type="text/javascript">
    	function fnRead(val){
    		
    		document.frmRead.action = "<%=contextPath%>/tb/read.bo";
    		document.frmRead.tb_idx.value = val;
    		document.frmRead.submit();
    	}
    </script>
    
</head>
<body>    
 
<div class="board-wrap">
 
    <!-- 게시글 목록 부분 -->
    <br>
    <div class="board-table">
        <table class="board-table" >
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        <c:forEach var="board" items="${requestScope.list}">
            <tr>
                <td>${board.tb_idx}</td>
                <td>
                <c:if test="${board.tb_level > 0}">
                	<c:forEach var="i" begin="0" end="${board.tb_level}" >
                		&nbsp;
                	</c:forEach>
                	:RE
                </c:if>
                    <a href="read.bo?tb_idx=${board.tb_idx}&pageNum=${spage}">
                    ${board.tb_title}
                    </a>
                </td>
                <td>
                <c:choose>
                	<c:when test="${!trainerboarddao.checkTable(board.tb_id)}">
                		<b>🍎${board.tb_name}</b>
                	</c:when>
                	<c:otherwise>
                		${board.tb_name}
                	</c:otherwise>
                </c:choose>
                </td>
                <td>${board.tb_date}</td>
                <td>${board.tb_cnt}</td>
            </tr>
        </c:forEach>
        </table>
        <c:if test="${not empty sessionScope.id}">
        <input type ="button" id="newContent" onclick="location.href='<%=contextPath%>/tb/write.bo'"value = "글쓰기">
        </c:if>
    </div>
    
    <!-- 페이지 넘버 부분 -->
    <br>
    <div id="pageForm">
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
    </div>
    
    <!--  검색 부분 -->
    <br>
    <div id="searchForm">
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
    </div>
</div>    
 
</body>
</html>
