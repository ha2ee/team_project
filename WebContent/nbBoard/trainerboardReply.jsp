<%@page import="VO.TrainerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	TrainerVo tvo = (TrainerVo)request.getAttribute("trainervo");
	
	String id = (String)session.getAttribute("id");
%>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <script type="text/javascript" src="<%=contextPath%>/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<%=contextPath%>/js/trainerBoard.js"></script>
    <link rel="stylesheet" href="<%=contextPath%>/nbBoard/TrainerBoard.css">
</head>
<body>
    <h2>답변쓰기</h2>


 <div class="tbwContainer">
    <form method="post" action="<%=contextPath%>/tb/tbReplyPro.bo" enctype="multipart/form-data">
      <input type="hidden" name ="id" value="<%=id %>"><!-- 세션아이디 영역(트레이너) -->
      <input type="hidden" name ="super_tb_idx" value="${super_tb_idx}"><!-- 부모글번호 -->
     
        <table id="tbwTable">
            <tr>
                <td>작성자</td>
                <td><input type="text" name="name" value="<%=tvo.getTr_name()%>" /></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="tbwTitle"name="title" maxlength="33" /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" id="content"></textarea></td>
            </tr>
            <tr>
                <td>파일</td>
                <td><input type="file" name="file" /></td>
            </tr>
        </table>
        <br>
        <input type="button" value="답변등록" onclick="checkLength();" />

        <script>
            CKEDITOR.replace('content',{height : 500, width : 1200}
            );
            
        </script>

    </form>
    
    </div>
</body>
</html>