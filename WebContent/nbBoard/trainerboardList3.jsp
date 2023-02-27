<%@page import="java.util.ArrayList"%>
<%@page import="VO.TrainerBoardVo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");
String contextPath = request.getContextPath();


//페이징 처리 변수

	int totalRecord = 0; //board테이블에 저장된 글의 총 개수
	int numPerPage = 5; //한 페이지당 조회해서 보여줄 글 개수
	int pagePerBlock = 3; //한 블럭당 묶여질 페이지 번호 개수 
						 // 1 2 3 < - 한블럭으로 묶음
	int totalPage = 0; //총 페이지수
	int totalBlock = 0; //총 블럭수
	int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장
	int nowBlock = 0; //클릭한 페이지 번호가 속한 블럭 위치 번호 저장
	int beginPerPage = 0; //각 페이지마다 보여지는 시작 글번호(맨위의 글번호) 저장
	
	ArrayList list = (ArrayList)request.getAttribute("list");
	
	//조회된 총 글 갯수
	totalRecord = (Integer)request.getAttribute("count");
	
	//현재 페이지 번호를 클릭했다면?
	if( request.getAttribute("nowPage") != null ){
		nowPage = Integer.parseInt( request.getAttribute("nowPage").toString());
	}
	
	//각 페이지 번호에 보여지는 글 목록의 가장위의 글에 대한 글번호 구하기
	beginPerPage = nowPage * numPerPage;

	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		
	if(request.getAttribute("nowBlock") != null){
		nowBlock = Integer.parseInt(request.getAttribute("nowBlock").toString());
		
	}
	
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);


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
    </table>
    
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
    
    		<%
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
		<%}%>
    
</body>
    <a href="<%=contextPath%>/tb/write.bo">글쓰기</a>
</body>
</html>