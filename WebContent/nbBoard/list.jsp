<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath(); 
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
    
    .board-table td:nth-child(5),.board-table td:nth-child(6),.board-table td:nth-child(1) {
    padding-left: 30px;
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
    
    
</head>
<body>    

<!-- =================================페이징================================= -->
<% 
  
  
  //페이징 처리 변수
  
  int totalRecord = 0; //board테이블에 저장된 글의 총 개수
  int numPerPage = 10; //한 페이지당 조회해서 보여줄 글 개수
  int pagePerBlock = 5; //한 블럭당 묶여질 페이지 번호 개수 
             // 1 2 3 < - 한블럭으로 묶음
  int totalPage = 0; //총 페이지수
  int totalBlock = 0; //총 블럭수
  int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장
  int nowBlock = 0; //클릭한 페이지 번호가 속한 블럭 위치 번호 저장
  int beginPerPage = 0; //각 페이지마다 보여지는 시작 글번호(맨위의 글번호) 저장
  
  //BoardController에서 재요청해서 전달한 request에 담긴 ArrayList배열 꺼내오기
  //조회된 글들
  ArrayList list = (ArrayList)request.getAttribute("list");
  
  //조회된 총 글 갯수
  totalRecord = (Integer)request.getAttribute("count");
  
  //현재 페이지 번호를 클릭했다면?
  if( request.getAttribute("nowPage") != null ){
    nowPage = Integer.parseInt( request.getAttribute("nowPage").toString());
  }
  
  //각 페이지 번호에 보여지는 글 목록의 가장위의 글에 대한 글번호 구하기
  beginPerPage = nowPage * numPerPage;
  /*
    beginPerPage변수 설명
    예를 들어 한페이지당 보여질 글의 개수가 6개라고 가정할때...
    1번페이지 일 경우.. 1번페이지에 보여질 시작 글번호는 6이다.
    nowPage * numPerPage;
    1페이지 번호 * 한페이지당 보여지는 글의 개수6; = 시작글번호 6
    
    2페이지 일 경우.. 2번페이지에 보여질 시작 글번호는 12이다.
    nowPage * numPerPage;
    1페이지 번호 * 한페이지당 보여지는 글의 개수6; = 시작글번호 12
  */
  
  //글이 몇개인지에 따른 총 페이지 번호 개수
  //총 페이지 번호 개수 = 총 글의 갯수 / 한페이지당 보여질 글 개수
  //참고! 하나의 글이 더 오버할 경우 마지막페이지에 하나의 글을 보여줘야 하기 때문에 올림 처리
  totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
    
  //클릭한 페이지 번호가 속한 블럭 위치 번호 구하기
  if(request.getAttribute("nowBlock") != null){
    //BoardController로 부터 전달 받는다.
    nowBlock = Integer.parseInt(request.getAttribute("nowBlock").toString());
  }
  
  totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
  
  String id = (String)session.getAttribute("id");
  
%>  
<!-- =================================페이징================================= -->




 
<div class="board-wrap">
 
    <!-- 글목록 위 부분-->
    <br>
<%--     <div id="topForm">
        <c:if test="${sessionScope.sessionID!=null}">
            <input type="button" value="글쓰기" onclick="writeForm()">
        </c:if>    
    </div> --%>
     
    
    <!-- 게시글 목록 부분 -->
    <br>
    <div class="board-table">
        <table class="board-table" >
            <tr>
                <th width="10%">글번호</th>
                <th width="40%">제목</th>
                <th width="15%">작성자</th>
                <th width="15%">작성일</th>
                <th width="10%">조회수</th>
                <th width="10%">추천수</th>
            </tr>
      <%
        for(int j = beginPerPage; j < (beginPerPage+numPerPage); j++){
          if(j == totalRecord){
            break;
          }
          FreeBoardVo vo = (FreeBoardVo)list.get(j);
      %>
          <tr>
                <td><%=vo.getB_idx()%></td>
                <td>
									<a href="read.fb?b_idx=<%=vo.getB_idx()%>&nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>">
										<%=vo.getB_title()%>
									</a>                </td>
                <td>
                    <%=vo.getB_nickname()%>
                </td>
                <td><%=vo.getB_date()%></td>
                <td><%=vo.getB_cnt()%></td>
                <td><%=vo.getB_like()%></td>
            </tr>
       <%    
        }
        %>
        </table>
        <input type ="button" id="newContent" onclick="location.href='<%=contextPath%>/freeboard/write.fb'"value = "글쓰기">
    </div>
    
    <!--  검색 부분 -->
    <br>
    <div id="searchForm">
        <form action="<%=contextPath%>/freeboard/searchlist.fb" method="post" 
                name="frmSearch" onsubmit="javascript:fnSearch();">
                  <select name="key">
                      <option value="titleContent">제목 + 내용</option>
                      <option value="nickname">작성자</option>
                  </select>
                  <input type="text" name="word" id="word" size="20"/> &nbsp;
                  <input type="submit" id="go" value="검색하기">
        </form>    
    </div>
</div>    

<div align="center" style="margin-right: 10%">
 <table>
  <tr align="center"> 
    <td  colspan="3" align="center">
    <%   
      if(totalRecord != 0){//DB에 글이 있다면?
          
        if(nowBlock > 0){//현재 클릭한 페이지번호가 속한 블럭위치가 0 보다 크다면?
    %>      
          <a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
            ◀ 이전<%=pagePerBlock%>개
          </a>
    <%    }//안쪽 if %>
      
        
    <%
        for(int i=0; i<pagePerBlock; i++){
    %>      
    
          &nbsp;
          <a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
            <%=(nowBlock * pagePerBlock)+i+1 %> 
            <%if((nowBlock * pagePerBlock)+i+1 == totalPage) break; %>
          </a>
          &nbsp;
    <%      
        }
    %>    
         
       
    <%
        if(totalBlock > nowBlock + 1){
    %>      
          
          <a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
              ▶ 다음 <%=pagePerBlock%>개
          </a>
        
    <%      
        }
    %>     
          
        
        
    <% }//바깥 if %>
    
    </td> 
  </tr>
 </table>
</div>






 
</body>
</html>
