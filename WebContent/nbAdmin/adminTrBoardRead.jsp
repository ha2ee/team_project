<%@page import="DAO.TrainerBoardDAO"%>
<%@page import="java.util.Date"%>
<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	//조회한 글정보 얻기
	TrainerBoardVo vo = (TrainerBoardVo)request.getAttribute("vo");
	String writerId = vo.getTb_id();
	String name = vo.getTb_name();
	String title = vo.getTb_title();
	String content = vo.getTb_content(); 
	String file = vo.getTb_file();
	Date date = vo.getTb_date();
	int cnt = vo.getTb_cnt();
	
	String tb_idx = (String)request.getAttribute("tb_idx");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
	<link rel="stylesheet" href="<%=contextPath%>/nbBoard/TrainerBoard.css">
</head>
<body>
	<div class="post-Container">
	      <div class="post">
	        <div class="post-header">
	          <h2 class="post-title"><%=title%></h2>
	         
	          <div class="post-info">
	            작성자: <%=name%> | 작성일자: <%=date%> | 조회수: <%=cnt%>
				</div>
	        </div>
	        <div class="post-body">
	          <p><%out.print(content);%></p>
	        </div>
	      </div>
	
	<c:if test="${not empty vo.tb_file || not empty imageUrls}">
	<div align="left" class="filedownload">첨부파일<br>

	<%-- 다운로드할 폴더번호 경로와 다운로드 할 파일명 전달 --%>
	<c:choose>
		<c:when test="${vo.tb_level==0}">
			<c:if test="${not empty vo.tb_file}">
			<a href="<%=contextPath%>/tb/download.bo?tbidx=<%=tb_idx%>&fileName=<%=file%>" class="download"><%=file%></a>&nbsp;&nbsp;
			</c:if>
		</c:when>
		<c:when test="${vo.tb_level>0}"> 
			<c:if test="${not empty vo.tb_file}">
			<a href="<%=contextPath%>/uploadFile/TrainerBoardFile/reply_tb_idx${vo.tb_idx}/<%=file%>" download class="download"><%=file%></a>&nbsp;&nbsp;
			</c:if>
		</c:when>
	</c:choose>
		<%--CKEDITOR로 입력한 이미지 다운로드 링크생성 --%>
		<c:if test="${not empty imageUrls}">
			<c:forEach var="imageUrls" items="${imageUrls}">
				<c:set var="imageUrl" value="${imageUrls}"/>
				<c:set value="${fn:split(imageUrl, '/')}" var="imageNameTemp" />
				<c:set var="imageName" value="${imageNameTemp[fn:length(imageNameTemp)-1]}"/>
				<a href="${imageUrls}" download="${imageName}"  class="download" >${imageName}</a>&nbsp;&nbsp;
			</c:forEach> 
		</c:if>
		<%--CKEDITOR로 입력한 이미지 다운로드 링크생성 끝 --%>
	</div>
  	</c:if>
    	
    <div class="post-buttons">
		<input type="button" value="목록으로" onclick="location.href='trBoardList.adm?page=${pageNum}'" id="list" />
			<input type="button" value="삭제하기" onclick="javascript:tbDelete('<%=tb_idx%>','${vo.tb_level}');" id="delete"/>
    </div>
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript" src="<%=contextPath%>/js/trainerBoard.js"></script>    

</body>
</html>