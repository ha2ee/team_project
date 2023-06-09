<%@page import="VO.ReviewVo"%>
<%@page import="VO.CommentVO"%>
<%@page import="DAO.FreeBoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	//조회한 글정보 얻기
	ReviewVo vo = (ReviewVo)request.getAttribute("vo");
	String imgName = vo.getImgRealName();
	String writerId = vo.getId();
	String title = vo.getTitle();
	String content = vo.getContext(); 
	Date date = vo.getReview_date();
	int b_idx = vo.getIdx();
  
	String id = (String)session.getAttribute("id");
  %>
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
</head>
<body>
	<div class="post-Container">
	      <div class="post">
	        <div class="post-header">
	          <h2 class="post-title"><%=title%></h2>
	         
	          <div class="post-info">
	            작성자: <%=writerId%> | 작성일자: <%=date%>
				</div>
	        </div>
	        <div class="post-body">
	        
	          <p>
		          <img alt="썸네일이미지" src="<%=contextPath%>/reviewUpload/<%=imgName%>"><br> 
		          <%out.print(content);%>
		      </p>
	        </div>
	      </div>
	
    <div class="post-buttons">
		<input type="button" value="목록으로" onclick="location.href='/TeamProject/adm/reviewBoardList.adm?nowPage=0&nowBlock=0'" id="list" />
       
        <!-- 수정,삭제는 세션아이디와 조회한 글의 작성자아이디가 동일할때만 노출시키기 필요 -->
			<input type="button" value="삭제하기" onclick="javascript:del('<%=b_idx%>');" id="delete"/>
       
    </div>
    
    
    
    </div>
</body>
</html>