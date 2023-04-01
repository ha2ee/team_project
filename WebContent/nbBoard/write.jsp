<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
  <script type="text/javascript" src="<%=contextPath%>/ckeditor/ckeditor.js"></script>
  <link href="../css/Team_FreeBoard.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="wrap1">
    <div>
      <form action="<%=contextPath%>/freeboard/writePro.fb"
            method="post" enctype="multipart/form-data">
        <h1>게시글 작성</h1> <br>
        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요">
        <%-- box-sizing: border-box를 style에 넣어줘야 너비 끝부분 처리가 완벽 --%>
        <input type="hidden" name="id" value="<%=id%>">
        <!-- 세션아이디 넘기기 -->
        <textarea name="editor1" id="editor1" rows="10" cols="80"></textarea> <br>
        <div class="wrap2">
          <div>
            <input type="file" name="fileName">
          </div>
          <div>
            <div class="wrap3">
              <input type="button" value="목 록"
                     onclick="location.href='<%=contextPath%>/freeboard/list.fb'" />
            </div> &nbsp;
            <div class="wrap5">
              <input type="submit" value="등 록" id="registration">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div> <br>
  
  <script type="text/javascript">
  	CKEDITOR.replace('editor1', {
  		height : 500
  	});
  	
		function fnsubmit() {
			//		$("#content11").attr("value",str);
			$("form").submit();
		}
  </script>
</body>
</html>