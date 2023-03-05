<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	TrainerBoardVo tvo = (TrainerBoardVo)request.getAttribute("tvo");
// 	request.setAttribute("tb_idx", tvo.getTb_idx());
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
    <form method="post" action="<%=contextPath%>/tb/tbUpdatePro.bo?tb_idx=<%=tvo.getTb_idx()%>" enctype="multipart/form-data">
      <input type="hidden" name ="id" value="<%=tvo.getTb_id()%>"> <!-- 세션아이디 영역 -->
     
        <table id="tbwTable">
            <tr>
                <td>작성자</td>
                <td><input type="text" name="name" value="<%=tvo.getTb_name()%>" /></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="tbwTitle"name="title" value="<%=tvo.getTb_title() %>" /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" id="content"><%=tvo.getTb_content() %></textarea></td>
            </tr>
            <%if (tvo.getTb_file() == null) {//파일이 첨부되어 있지 않을때만 파일 첨부가 가능하게 만든다.  %>
            <tr>
                <td>파일</td>
                <td><input type="file" name="file" /></td>
            </tr>
            <%} %>
        </table>
        <br>
        <input type="submit" value="글수정" />

        <script>
            CKEDITOR.replace('content',{height : 500, width : 1200}
            );
        </script>
    </form>
    
    </div>
</body>
</html>