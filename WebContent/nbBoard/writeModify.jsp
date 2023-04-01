<%@page import="VO.FreeBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();

FreeBoardVo vo = (FreeBoardVo) request.getAttribute("vo");
String title = vo.getB_title();
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
      <form action="<%=contextPath%>/freeboard/modifyPro.fb"
            method="post" enctype="multipart/form-data">
        <h1>게시글 작성</h1> <br>
        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="<%=vo.getB_title()%>">
        <textarea name="editor1" id="editor1" rows="10" cols="80"><%=vo.getB_content()%></textarea>
        <br>
        <div class="wrap4">
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
        <input type="hidden" name="b_idx" value="<%=vo.getB_idx()%>">
      </form>
    </div>
  </div> <br>

  <script type="text/javascript">
			function fnsubmit() {
				$("form").submit();
			}
			
			CKEDITOR.replace('editor1', {
				height : 500
			});
		</script>
</body>
</html>