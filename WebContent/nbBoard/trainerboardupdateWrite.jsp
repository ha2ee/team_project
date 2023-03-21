<%@page import="DAO.TrainerBoardDAO"%>
<%@page import="VO.MemberVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	TrainerBoardVo tbo = (TrainerBoardVo)request.getAttribute("tvo");
	MemberVo vo = null;
	TrainerVo tvo = null;
	TrainerBoardDAO trainerboarddao = new TrainerBoardDAO();
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
    <form method="post" action="<%=contextPath%>/tb/tbUpdatePro.bo?tb_idx=<%=tbo.getTb_idx()%>" enctype="multipart/form-data">
      <input type="hidden" name ="id" value="<%=tbo.getTb_id()%>"> <!-- 세션아이디 영역 -->
     
        <table id="tbwTable">
            <tr>
                <td>작성자</td>
                <td>
					<input type="text" name="name" value="${not empty requestScope.trainervo ? requestScope.trainervo.tr_name : requestScope.membervo.mem_name}" />
               	</td>
				
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" id="tbwTitle"name="title" value="<%=tbo.getTb_title() %>" maxlength="33" /></td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea name="content" id="content" ><%=tbo.getTb_content() %></textarea></td>
            </tr>
			<%if (tbo.getTb_file() == null) {//파일이 첨부되어 있지 않을때만 파일 첨부가 가능하게 만든다.  %>
            <tr>
                <td>파일</td>
                <td><input type="file" name="file" /></td>
            </tr>
            <%} else {%>
            <tr>
            	 <td>파일</td>
                <td><span id="attachFile">파일이 첨부 되어 있습니다.(파일명 : <%=tbo.getTb_file()%>)</span> 
                <input type="button" id="delButton" value="파일삭제" onclick="fileDel(<%=tbo.getTb_idx()%>,<%=tbo.getTb_level()%>);"></td>
            </tr>
            <%} %>
        </table>
        <br>
        <input type="button" value="글수정" onclick="checkEditor();" />

        <script>
            CKEDITOR.replace('content',{height : 500, width : 1200}
            );
        </script>
      
    </form>
    
            
    </div>
</body>
</html>