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
    <title>자유 게시판</title>
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
  
  ArrayList list = (ArrayList)request.getAttribute("list");
  
  totalRecord = (Integer)request.getAttribute("count");
  
  if( request.getAttribute("nowPage") != null ){
    nowPage = Integer.parseInt( request.getAttribute("nowPage").toString());
  }
  
  beginPerPage = nowPage * numPerPage;
  
  totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
    
  if(request.getAttribute("nowBlock") != null){
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
                <th>글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>추천수</th>
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
									<a href="freeBoardRead.adm?b_idx=<%=vo.getB_idx()%>&nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>">
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
    </div>
   
 <div align="center" style="margin-right: 10%">
 <table id="pageForm">
  <tr align="center"> 
    <td  colspan="3" align="center">
    <%   
      if(totalRecord != 0){//DB에 글이 있다면?
          
        if(nowBlock > 0){//현재 클릭한 페이지번호가 속한 블럭위치가 0 보다 크다면?
    %>      
          <a href="<%=contextPath%>/adm/freeBoardList.adm?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
            ◀ 이전<%=pagePerBlock%>개
          </a>
    <%    }//안쪽 if %>
      
        
    <%
        for(int i=0; i<pagePerBlock; i++){
    %>      
    
          &nbsp;
          <a href="<%=contextPath%>/adm/freeBoardList.adm?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
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
          
          <a href="<%=contextPath%>/adm/freeBoardList.adm?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
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








 
</body>
</html>
