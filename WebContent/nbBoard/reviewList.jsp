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
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Album example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    <link href="../css/review.css" rel="stylesheet">
    <link href="../css/Team_FreeBoard.css" rel="stylesheet" type="text/css" />
  </head>
  <body>
<!-- =================================페이징================================= -->
<% 
  int totalRecord = 0; //board테이블에 저장된 글의 총 개수
  int numPerPage = 9; //한 페이지당 조회해서 보여줄 글 개수
  int pagePerBlock = 5; //한 블럭당 묶여질 페이지 번호 개수 
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
<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">수강 후기</h1>
        <p class="lead text-muted"></p>
        <p>
          <a class="btn btn-primary my-2" onclick="clickWrite('${sessionScope.id}')">수강후기 작성</a>
<!--           <a href="#" class="btn btn-secondary my-2" style="font-size: 15">추가할 액션?</a> -->
        </p>
      </div>
    </div>
  </section>
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="container">
<!-------------------------응용해보자 ------------------------->
      <%
        for(int j = beginPerPage; j < (beginPerPage+numPerPage); j++){
          if(j == totalRecord){
            break;
          }
          ReviewVo vo =(ReviewVo) list.get(j);
      %>
        <div class="col item">
          <div class="card shadow-sm">
           <img alt="dd" src="<%=reviewUploadPath%><%=vo.getImg()%>">
            <div class="card-body">
              <div class="card-text"><b><%=vo.getTitle()%></b><br><span><%=vo.getContext()%></span></div>
              <input type="checkbox" class="card-content__more-btn">
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <%
                  if(vo.getId().equals(id)){
                  %>
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='<%=contextPath%>/review/edit.rv?idx=<%=vo.getIdx()%>'">Edit</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="del(<%=vo.getIdx()%>)">Delete</button>
                  <%
                  }
                  %>
                </div>
                <small class="text-muted"><%=vo.getReview_date()%></small>
              </div>
            </div>
          </div>
        </div>
        <% 
        }
        %>
      </div>
    </div>
  </div>
</main>

<div align="center">
  <table>
    <tr align="center"> 
      <td  colspan="3" align="center">
      <%
        if(totalRecord != 0){//DB에 글이 있다면?
            
          if(nowBlock > 0){//현재 클릭한 페이지번호가 속한 블럭위치가 0 보다 크다면?
      %>
            <a href="<%=contextPath%>/review/list.rv?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
              ◀ 이전<%=pagePerBlock%>개
            </a>
      <%  }//안쪽 if %>
      <%
          for(int i=0; i<pagePerBlock; i++){
      %>
            &nbsp;
            <a href="<%=contextPath%>/review/list.rv?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
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
            <a href="<%=contextPath%>/review/list.rv?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
                ▶ 다음 <%=pagePerBlock%>개
            </a>
      <%
          }
      %>
      <% } %>
      </td> 
    </tr>
   </table>
</div>
    <script src="../js/review.min.js"></script>
    <script src="../js/Team_freeboard.js"></script>
  </body>
</html>
