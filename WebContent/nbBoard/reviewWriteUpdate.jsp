<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
  <link href="../css/Team_FreeBoard.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div class="wrap1">
    <div>
      <form action="<%=contextPath%>/review/editPro.rv" method="post"
            enctype="multipart/form-data">
        <input type="hidden" name="idx" value="${vo.idx}">
        <h1>게시글 작성</h1> <br> 
        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" value="${vo.title}">
        <%-- box-sizing: border-box를 style에 넣어줘야 너비 끝부분 처리가 완벽 --%>
        <br><br>
        <textarea rows="20" class="DOC_TEXT" name="editor1" 
                  placeholder="리뷰에 대한 내용을 1000자 이내로 기재해주세요.">${vo.context}</textarea>
        <span id="counter">(0 / 최대 1000자)</span> <br>
        <div class="wrap4">
          <div>
            <div class="wrap3">
              <input type="button" value="목 록" 
                     onclick="location.href='<%=contextPath%>/review/list.rv'" />
            </div> &nbsp;
            <div class="wrap5">
              <input type="button" value="등 록" id="registration" onclick="frmEditsubmit()">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div> <br>
  <script src="../js/TeamFreeBoard.js"></script>
</body>
</html>