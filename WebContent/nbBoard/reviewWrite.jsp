<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <form action="<%=contextPath%>/review/reviewWritePro.rv"
            method="post" enctype="multipart/form-data">
        <h1>게시글 작성</h1> <br> 
        <input type="text" id="title" name="title" placeholder="제목을 입력해주세요">
        <%-- box-sizing: border-box를 style에 넣어줘야 너비 끝부분 처리가 완벽 --%>
        <br><br>
        <textarea rows="20" name="editor1" class="DOC_TEXT" 
                  placeholder="리뷰에 대한 내용을 1000자 이내로 기재해주세요."></textarea>
        <span id="counter">(0 / 최대 1000자)</span> <br>
        <div class="wrap2">
          <div>
            <input type="file" name="fileName" id="fileName">
          </div>
          <div>
            <div class="wrap3">
              <input type="button" value="목 록"
                     onclick="location.href='<%=contextPath%>/review/list.rv'"/>
            </div> &nbsp;
            <div class="wrap5">
              <input type="button" value="등 록" id="registration" onclick="frmsubmit()">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div> <br>
  <script src="../js/Team_freeboard.js"></script>
</body>
</html>