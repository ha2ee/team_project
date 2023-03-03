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
	String nickname = vo.getCb_nickname();//조회한 글을 작성한 사람 닉네임
// 	String email = vo.getcb_email();//조회한 글을 작성한 사람의 이메일
	String title = vo.getCb_title();//조회한 글제목
	String content = vo.getCb_content(); //조회한 글 내용.replace("/r/n", "<br>")
	String file = vo.getCb_file();//업로드한 실제파일명 (조회후 받아온 값)
// 	int downCount = vo.getDowncount(); //업로드한 파일을 실제 다운로드한 횟수
	Date date = vo.getCb_date();
	int cnt = vo.getCb_cnt();
	
	String cb_idx = (String)request.getAttribute("cb_idx");
	System.out.println("-----@@@@" + cb_idx);
	
	
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>

    <style type="text/css">
		.post-Container {
		margin : 0 auto;
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #ddd;
		width:1200px;
		}
		
		.post {
		border-bottom: 1px solid #ddd;
		}
		
		.post-title {
		  font-size: 24px;
		}
		
		.post-info {
		  color: #888;
		  font-size: 14px;
		}
		
		.post-body {
		  line-height: 1.5;
		}
		
		.post-header {
		display:flex;
		justify-content: space-between;
		align-items : flex-end;
		border-bottom: 1px solid #ddd;
		}
		
		
    </style>
</head>
<body>
	<div class="post-Container">
	      <div class="post">
	        <div class="post-header">
	          <h2 class="post-title"><%=title%></h2>
	         
	          <div class="post-info">
	            작성자: <%=nickname%> | 작성일자: <%=date%> | 조회수: <%=cnt%>
				</div>
	        </div>
	        <div class="post-body">
	          <p><%out.print(content);%></p>
	        </div>
	      </div>
	</div>
	<c:if test="${not empty vo.cb_file}">
	<div align="center">다운로드:
	<%-- 다운로드할 폴더번호 경로와 다운로드 할 파일명 전달 --%>
	<a href="<%=contextPath%>/tb/download.bo?cbidx=<%=cb_idx%>&fileName=<%=file%>">&nbsp;&nbsp;<%=file%></a>
<%-- 	<a href="/uploadFile/TrainerBoardFile/cbidx<%=cb_idx%>/<%=file%>" download>&nbsp;&nbsp;<%=file%></a> --%>
	</div>
    </c:if>
    	
    <div style="text-align: center;">
        <a href="list.bo?page=${pageNum}">목록으로</a>
        <a href="tbUpdate.bo?cb_idx=${cb_idx}&center=/tb/list.bo">수정하기</a>
    </div>
</body>
</html>