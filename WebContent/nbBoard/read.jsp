<%@page import="java.util.Date"%>
<%@page import="VO.FreeBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	FreeBoardVo vo = (FreeBoardVo) request.getAttribute("vo");
	
	String title = vo.getB_title();
	String content = vo.getB_content();
	String nickname = vo.getB_nickname();
	Date date = vo.getB_date();
	int like = vo.getB_like();
	int cnt = vo.getB_cnt();
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: 5% 5% 0 5%; ">
	<!-- 전체 width 바꾸기 위해서 존재하는  -->
	
	
		<div style="border: 1px solid black;"> 
			<div style="border: 1px solid black; margin: 3px;">
				<b style="font-size: 20px;"><%=title%></b> <br>
			</div>
			<div style="border: 1px solid black; text-align: center; height: 30px;" >
				<div style="border: 1px solid black; float: left;  margin: 3px;">
					<%=nickname %>     l
				</div>
				<div style="border: 1px solid black; float: left;  margin: 3px;">
					<%=date %>
				</div>
				
				<div style="border: 1px solid black; float: right;  margin: 3px;">
					댓글
				</div>
				<div style="border: 1px solid black; float: right;  margin: 3px;">
					추천 <%=like %>
				</div>
				<div style="border: 1px solid black; float: right;  margin: 3px;">
					조회수 <%=cnt %>
				</div>
			</div>
			
		</div>
		<hr style="border: solid 1px grey;">
		
		<!-- 윗부분 끝 -->
		<div style="border: 1px solid black; height:300px; margin-bottom:2% ">
			<!-- 콘텐츠 들어온다. -->
			
			<%=content%>
		
			
			
	<!-- 	if 첨부 파일 있으면 위에 첨부하고
			없으면 내용만 삽입.
	 -->		
		
		</div>
		<!-- 중간부분 끝 -->
		
		
		<div style="border: 1px solid black; height:100px; margin-bottom:2% ">
			댓글 들어온다.
		</div>
		
		<div style="border: 1px solid black; height:300px; margin-bottom:2% ">
		 게시글 목록 보여주고 싶은데
		</div>
		

	</div>

</body>
</html>