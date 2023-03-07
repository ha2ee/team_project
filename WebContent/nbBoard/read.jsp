<%@page import="java.util.Date"%>
<%@page import="VO.FreeBoardVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");
   String contextPath = request.getContextPath();
  FreeBoardVo vo = (FreeBoardVo) request.getAttribute("vo");

  int idx = vo.getB_idx();
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
<meta charset="UTF-8" 
      name="viewport" 
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/d158a8723c.js"
        crossorigin="anonymous"></script>
<link rel="stylesheet" 
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
      integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" 
      crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style type="text/css">
  body{
  font-size: 20px;
  }
</style>

</head>
<body>
  <div style="margin: 5% 5% 0 5%;"> <!-- 전체 width 바꾸기 위해서 존재하는 div -->
    <div style="border: 1px solid black;">
      <div style="margin: 3px;">
        <b style="font-size: 20px;"><%=title%></b> <br>
      </div>
      <div style="border: 1px solid black; text-align: center; height: 30px;">
        <div style="float: left; margin: 3px;">
          <%=nickname%> l
        </div>
        <div style="float: left; margin: 3px;">
          <%=date%>
        </div>
        <div style="float: right; margin: 3px;">
          댓글 0 <!-- 댓글 들어오는 작업 해야합니다!! -->
        </div> 
        <div style="float: right; margin: 3px;">
          추천 <%=like%> l
        </div>
        <div style="float: right; margin: 3px;">
          조회수 <%=cnt%> l
        </div>
      </div>

    </div>
    <hr style="border: solid 1px grey;">

    <!-- 윗부분 끝 -->
    <div style="border: 1px solid black; height: 500px; margin-bottom: 1%;">
      <%=content%>   <!-- 콘텐츠 들어온다. -->
    </div>
    <div style="float: right">
        <form action ="<%=contextPath%>/freeboard/modify.fb">
          <input type="hidden" name="b_idx" value="<%=idx%>">
          <!-- ---------------------------- -->
          <button type="button" class="btn btn-outline-danger" style="font-size: 20px" onclick="javascript:fnGoList()">목록</button>
          <button type="submit" class="btn btn-outline-danger" style="font-size: 20px">수정</button>
          <button type="button" class="btn btn-outline-danger" style="font-size: 20px" onclick="javascript:fnDel(<%=idx%>)">삭제</button>
        </form>
    </div>

    <script type="text/javascript">
      function fnDel(val){
        $.ajax({
    			url: "<%=contextPath%>/freeboard/del.fb",
    			async : true,
    			type : 'POST',
    			data : {
              			b_idx : b_idx
    							},
    			success : function(data) {
      			  				if(data == 1){
      			  				  alert("삭제 성공!");
      			  				  location.href=
      			  				    "<%=contextPath%>/freeboard/list.fb?nowPage=0&nowBlock=0";
      			  				}else{
      			  				  alert("삭제 실패!");
      			  				  history.go(-1);
      			  				}
    								}
    		});
      }
      function fnGoList(){
        location.href="<%=contextPath%>/freeboard/list.fb?nowPage=0&nowBlock=0";
      }
    </script>

      <!-- 	if 첨부 파일 있으면 위에 첨부하고 없으면 내용만 삽입 -->
    <!-- 중간부분 끝 -->

    <div style="margin-left: 12%; display: flex; flex-direction: column;">
      <div>
        <a href="" id="likeimgg"> 
          <i class="fa-regular fa-heart fa-4x" id="likeimggg"></i>
        </a>
      </div>
      <div>
        <p id="countLike" style="font-size: 30px"><%=like%></p>
      </div>
    </div>

<script type="text/javascript">
  const b_idx = <%=vo.getB_idx()%>
  const id2 = "inseop";
  var originLikeCount = <%=like%>

  $("#likeimgg").on("click", function (event) {
	  event.preventDefault();
	  
	  $.ajax({
			url: "<%=contextPath%>/freeboard/like.fb",
			async : true,
			type : 'POST',
			data : {
          			b_idx : b_idx,
          			id2 : id2
							},
			success : function(data) {
 	  		   /* 	  if(data=originLikeCount-1){
									 $("#likeimggg").attr("class","fa-regular fa-heart fa-4x");	//이미 좋아요 누른 경우;
														 $("#countLike").text(data);

														 } else{
														 $("#countLike").text(data);
														 $("#likeimggg").attr("class","fa-solid fa-heart fa-4x");
														
														 } */

							$("#countLike").text(data);
							if (data > originLikeCount) {
								$("#likeimggg").attr("class","fa-solid fa-heart fa-4x");
							} else if (data <= originLikeCount) {
								$("#likeimggg").attr("class","fa-regular fa-heart fa-4x"); //이미 좋아요 누른 경우;
							}
							}
		});
	});
</script>

    <div style="border: 1px solid black; height: 300px; margin-bottom: 2%">
      댓글 들어온다.  <!-- 댓글 들어와야 합니다. -->
    </div>

    <div style="border: 1px solid black; height: 1000px; margin-bottom: 2%">
      <jsp:include page="list.jsp">
        <jsp:param value="0" name="nowBlock"/>
        <jsp:param value="0" name="nowPage"/>
        <jsp:param value="${list}" name="list"/>
        <jsp:param value="${count}" name="count"/>
      </jsp:include>
    </div>
  </div>
</body>
</html>