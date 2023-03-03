<%@page import="VO.TrainerBoardVo"%>
<%@page import="VO.trMemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	TrainerBoardVo tvo = (TrainerBoardVo)request.getAttribute("tvo");
	request.setAttribute("cb_idx", tvo.getCb_idx());
//	String id = (String)session.getAttribute("id");
//	if(id == null){
%>		
<%--	<script>	
		alert("login"); 
		history.back(); 
 	</script>
 	 --%>
 <% 
	//}%>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <script type="text/javascript" src="<%=contextPath%>/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/nbBoard/TrainerBoard.css">
</head>
<body>
    <h2>글쓰기</h2>


 <div class="tbwContainer">
    <form method="post" action="<%=contextPath%>/tb/tbUpdatePro.bo" enctype="multipart/form-data">
      <input type="hidden" name ="id" value="<%=tvo.getCb_id()%>"> <!-- 세션아이디 영역 -->
     
        <table id="tbwTable">
            <tr>
                <td>작성자</td>
                <td><input type="text" name="nickname" value="<%=tvo.getCb_nickname()%>" /></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="tbwTitle"name="title" value="<%=tvo.getCb_title() %>" /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" id="content"><%=tvo.getCb_content() %></textarea></td>
            </tr>
            <tr>
                <td>파일</td>
                <td><input type="file" name="file" />현재 첨부되어있는 파일 :<%=tvo.getCb_file() %></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="글작성" />

        <script>
            CKEDITOR.replace('content',{height : 500, width : 1200}
            );
        </script>
    </form>
    
    </div>
</body>
</html>