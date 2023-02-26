<%@page import="java.util.ArrayList"%>
<%@page import="VO.TrainerBoardVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");
String contextPath = request.getContextPath();


	//게시판의 전체 글 개수
	int totalRecord = 100;
	
	//한 페이지당 보여줄 글 개수
	int numPerPage = 10;
	
	//한 블럭당 묶여질 페이지 번호 개수
	int pagePerBlock = 5;
	
	//전체 페이지 수
	int totalPage = (int) Math.ceil((double)totalRecord / numPerPage);
	
	//전체 블럭 수
	int totalBlock = (int) Math.ceil((double)totalPage / pagePerBlock);
	
	//현재 페이지 번호
	int nowPage = (request.getParameter("page") == null) ? 1 : Integer.parseInt(request.getParameter("page"));
	
	//현재 블럭 번호
	int nowBlock = (int) Math.ceil((double)nowPage / pagePerBlock);
	
	//각 페이지마다 보여지는 시작 글번호(맨위의 글번호)
	int beginPerPage = (nowPage - 1) * numPerPage + 1;
	
	//각 페이지마다 보여질 마지막 글번호(맨아래의 글번호)
	int endPerPage = nowPage * numPerPage;
	
	//마지막 페이지에서 보여질 글번호를 계산
	if (endPerPage > totalRecord) {
	 endPerPage = totalRecord;
	}
	
	//이전 블럭으로 이동할 때 보여질 페이지 번호
	int prevBlockPage = (nowBlock - 1) * pagePerBlock;
	
	//다음 블럭으로 이동할 때 보여질 페이지 번호
	int nextBlockPage = nowBlock * pagePerBlock + 1;
	
	//다음 블럭으로 이동할 때 보여질 페이지 번호가 총 페이지 수보다 클 경우
	if (nextBlockPage > totalPage) {
	 nextBlockPage = totalPage;
	}

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <style type="text/css">
    /* 테이블 스타일 */
table {
  border-collapse: collapse;
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
}

th, td {
  border: 1px solid #ddd;
  padding: 8px;
  text-align: left;
}

th {
  background-color: #f2f2f2;
  font-weight: bold;
}

/* 제목 링크 스타일 */
a {
  color: #333;
  text-decoration: none;
}

a:hover {
  color: #0066cc;
}

/* 버튼 스타일 */
.button {
  background-color: #0066cc;
  border: none;
  color: #fff;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 5px;
  cursor: pointer;
  margin: 20px 0;
}

.button:hover {
  background-color: #0052a3;
}
    
    </style>
    
    <script type="text/javascript">
	function fnSearch(){
		var word = document.getElementById("word").value;
		if(word == null || word == ""){
			alert("검색어를 입력하세요.");
			document.getElementById("word").focus();
			return false;
		}
		else{
			document.frmSearch.submit();
		}
	}
	
	//글제목 하나를 클릭했을때 글 번호를 매개변수로 받아서 <form>로
	//글번호에 해당되는 글의 정보를 DB로부터 조회 요청을 BoardController로 합니다.
	function fnRead(val){
		
		
		document.frmRead.action = "<%=contextPath%>/tb/read.bo";
		document.frmRead.b_idx.value = val;
		document.frmRead.submit();
	}
</script>
</head>
<body>
    <h1>페이징 처리된 게시판</h1>
    
    <table>
    <!-- 게시글 출력 -->
    <% for (int i = beginPerPage; i <= endPerPage; i++) { %>
        <tr>
            <td><%= i %></td>
            <td>제목 <%= i %></td>
            <td>작성자 <%= i %></td>
        </tr>
    <% } %>
</table>

<div>
    <%-- 이전 블럭으로 이동할 수 있는 링크 --%>
    <% if (prevBlockPage >= 1) { %>
        <a href="?page=<%= prevBlockPage %>">이전</a>
    <% } %>

    <%-- 현재 블럭에서 보여지는 페이지 번호들을 출력 --%>
    <% for (int i = (nowBlock - 1) * pagePerBlock + 1; i <= nowBlock * pagePerBlock && i <= totalPage; i++) { %>
        <%-- 현재 보여지는 페이지 번호에는 링크를 걸지 않음 --%>
        <% if (i == nowPage) { %>
            <span><%= i %></span>
        <% } else { %>
            <a href="?page=<%= i %>"><%= i %></a>
        <% } %>
    <% } %>

    
        <%-- 다음 블럭으로 이동할 수 있는 링크 --%>
    <% if (nextBlockPage <= totalPage) { %>
        <a href="?page=<%= nextBlockPage %>">다음</a>
    <% } %>
</div>
    
    
    
    
    
    
    
    
  <%--   <table>
        <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <!-- 게시글 데이터를 출력하는 부분 -->
            <c:forEach items="${list}" var="board">
                <tr>
                    <td>${board.cb_idx}</td>
                    <td><a href="trainerboardRead.jsp?cb_idx=${board.cb_idx}">${board.cb_title}</a></td>
                    <td>${board.cb_nickname}</td>
                    <td>${board.cb_cnt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table> --%>
    
    <!-- 페이징 처리 부분 -->
<%--     <div>
        <c:if test="${nowBlock != 1}">
            <a href="trainerboardList.jsp?page=${(nowBlock-2)*pagePerBlock+1}">이전</a>
        </c:if>
        
        <c:forEach begin="${beginBlock}" end="${endBlock}" var="i">
            <c:choose>
                <c:when test="${i eq nowPage}">
                    <strong>${i}</strong>
                </c:when>
                <c:otherwise>
                    <a href="trainerboardList.jsp?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${nowBlock != endBlock}">
            <a href="trainerboardList.jsp?page=${nowBlock*pagePerBlock+1}">다음</a>
        </c:if>
    </div> --%>
    
    		<%-- <%
			if(totalRecord != 0){ //DB에 글이 있다면?
				
				if(nowBlock > 0){
		%>			
					<a href="<%=contextPath%>/tb/list.bo?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1)*pagePerBlock)%>">
					◀ 이전 <%=pagePerBlock%>개
					</a>
				<%}%>
				
		<%
				for(int i=0; i<pagePerBlock; i++){
		%>
					&nbsp;&nbsp;
					<a href="<%=contextPath%>/tb/list.bo?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
						<%=(nowBlock * pagePerBlock)+i+1%> 
						<% if((nowBlock * pagePerBlock)+i+1 == totalPage) break;%>
					</a>
					&nbsp;&nbsp;
		<%			
				}
		%>		
					
				
		<%
				if(totalBlock > nowBlock +1){
		%>			
					<a href="<%=contextPath%>/tb/list.bo?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">
						 ▶ 다음 <%=pagePerBlock%>개
					</a>
		<%			
				}
		%>		
		<%}%> --%>
    
</body>
    <a href="<%=contextPath%>/tb/write.bo">글쓰기</a>
</body>
</html>