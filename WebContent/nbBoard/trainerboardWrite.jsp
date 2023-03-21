<%@page import="DAO.TrainerBoardDAO"%>
<%@page import="VO.MemberVo"%>
<%@page import="VO.TrainerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	TrainerBoardDAO dao = new TrainerBoardDAO();
	MemberVo vo = null;
	TrainerVo tvo = null;
    String id = (String) session.getAttribute("id");
    if (id == null || id.equals("")) {
        %>      
        <script>    
            alert("로그인을 해야 글을 작성 할 수 있습니다."); 
            history.back(); 
        </script>
<%}%>
	
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
    <h2>글쓰기</h2>


 <div class="tbwContainer">
    <form method="post" action="<%=contextPath%>/tb/writePro.bo" enctype="multipart/form-data" id="ckForm">

      <input type="hidden" name ="id" value="<%=id%>"> <!-- 세션아이디 넘기기 -->

        <table id="tbwTable">
            <tr>
                <td>작성자</td>
				<td>
					<input type="text" name="name" value="${not empty requestScope.trainervo ? requestScope.trainervo.tr_name : requestScope.membervo.mem_name}" />
               	</td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="tbwTitle"name="title" maxlength="33"/></td>
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
        <input type="button" value="글작성" onclick="checkEditor();" />
        <script>
            CKEDITOR.replace('content',{height : 500, width : 1200}
            );
           
        </script>
    </form>
    
    </div>
</body>
</html>