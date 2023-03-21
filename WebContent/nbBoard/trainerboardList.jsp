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
   	<link rel="stylesheet" href="<%=contextPath%>/nbBoard/TrainerBoard.css">
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
