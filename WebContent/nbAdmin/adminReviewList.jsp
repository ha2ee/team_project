<%@page import="java.util.ArrayList"%>
<%@page import="VO.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%
  request.setCharacterEncoding("UTF-8");
  String contextPath = request.getContextPath(); 
  String reviewUploadPath = contextPath + "/reviewUpload/";
  
%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자 수강후기페이지</title>

    <style>

      .card-text{
 
      /* 추가하기 */
      display: -webkit-box;
      -webkit-line-clamp: 3;
     -webkit-box-orient: vertical; 
      overflow: hidden;
      }
      
      .card-content__more-btn {
  appearance: none;
  border: 1px solid black;
  padding: 0.5em;
  border-radius: 0.25em;
  cursor: pointer;
  margin: 1rem;
    }

    .card-content__more-btn::before {
      content: '더보기';
    }
    
    .card-content__more-btn:checked::before {
      content: '닫기';
    }
    
    .card-text:has(+ .card-content__more-btn:checked) {
      -webkit-line-clamp:unset
    }
      
    </style>

    
  </head>
  <body style="font-size: 15px;">
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
            </tr>
      <%
        for(int j = beginPerPage; j < (beginPerPage+numPerPage); j++){
          if(j == totalRecord){
            break;
          }
          ReviewVo vo = (ReviewVo)list.get(j);
      %>
          <tr>
                <td><%=vo.getIdx()%></td>
                <td>
									<a href="reviewBoardRead.adm?b_idx=<%=vo.getIdx()%>&nowBlock=<%=nowBlock%>&nowPage=<%=nowPage%>">
										<%=vo.getTitle()%>
									</a>                </td>
                <td>
                    <%=vo.getId()%>
                </td>
                <td><%=vo.getReview_date()%></td>
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
          <a href="<%=contextPath%>/adm/reviewBoardList.adm?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
            ◀ 이전<%=pagePerBlock%>개
          </a>
    <%    }//안쪽 if %>
      
        
    <%
        for(int i=0; i<pagePerBlock; i++){
    %>      
    
          &nbsp;
          <a href="<%=contextPath%>/adm/reviewBoardList.adm?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
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
          
          <a href="<%=contextPath%>/adm/reviewBoardList.adm?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
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
