<%@page import="VO.CommentVO"%>
<%@page import="DAO.FreeBoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	//조회한 글정보 얻기
	FreeBoardVo vo = (FreeBoardVo)request.getAttribute("vo");
	String writerId = vo.getB_id();
	String name = vo.getB_nickname();
  String nickname = vo.getB_nickname();
	String title = vo.getB_title();
	String content = vo.getB_content(); 
	String file = vo.getB_file();
	Date date = vo.getB_date();
	int cnt = vo.getB_cnt();
	int b_idx = vo.getB_idx();
  int like = vo.getB_like();

	String id = (String)session.getAttribute("id");
  %>
  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
</head>
<body>
	<div class="post-Container">
	      <div class="post">
	        <div class="post-header">
	          <h2 class="post-title"><%=title%></h2>
	         
	          <div class="post-info">
	            작성자: <%=name%> | 작성일자: <%=date%> | 조회수: <%=cnt%> | 추천수: <span id="topLike"><%=like%></span>
				</div>
	        </div>
	        <div class="post-body">
	          <p><%out.print(content);%></p>
	        </div>
	      </div>
	
    <div class="post-buttons">
		<input type="button" value="목록으로" onclick="location.href='/TeamProject/adm/freeBoardList.adm?nowPage=0&nowBlock=0'" id="list" />
			<input type="button" value="삭제하기" onclick="javascript:fbDel('<%=b_idx%>');" id="delete"/>
    </div>
    
    </div>
<script type="text/javascript">
//삭제하기를 눌렀을때 ajax로 삭제 처리하기
      function fbDel(b_idx){
      			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
      			if(result == true){//확인 버튼 클릭
      				//비동기방식으로 글삭제 요청!
      				$.ajax({
      					type : "post",
      					async : true,
      					url : "<%=contextPath%>/adm/fbDelete.adm",
      					data : {fb_idx : b_idx},
      					dataType : "text",
      					success : function(data){
      						if(data== 1){
      							alert("삭제 성공!");
      							location.href="<%=contextPath%>/adm/freeBoardList.adm";
      									} else {//"삭제실패"
      										alert("삭제에 실패했습니다.")
      										location.reload();
      									}
      								},
      								error : function() {
      									alert("비동기 통신 장애");
      								}
      							});
      				} else {//취소 버튼을 눌렀을때
      					return false;
      				}
      			}      

</script>    
    
<div style="margin-bottom: 2%">

<div style="margin: 0 77;">

	<table id="tblListComment" class="table table-bordered">
	
		<c:if test="${ clist.size() == 0 }">
			<tr>
				<td colspan="2">댓글이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:set var="i" value="0"/>
		<c:forEach items="${ clist }" var="cdto">
			<tr>
				<td>
				<!-- 댓글 표시&수정창 -->
				<form id="commentUpdate${i}">
				 <input type="button" value="삭제하기" class="btn btn-default" onclick="location.href='<%=contextPath%>/adm/delAdmComment.adm?seq=${ cdto.seq }&pseq=<%=b_idx%>';" style="position: absolute; right: 100px; top:10px;"/>
					<textarea id="updateActive${i}" rows="3" name="commupdate" cols="60" disabled="disabled">${cdto.content}</textarea>
					<input type="hidden" value="${cdto.seq}" name ="seq2"/>
					<input type="hidden" value="<%=b_idx%>" name="b_idx"/>
					</form>
					<span>${ cdto.name }. ${ cdto.regdate }</span>
				</td>
			</tr>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>	
	</table>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	
</div>
<!-- 댓글끝------------------------------------ -->    
    <div style="margin-bottom: 2%">
      <jsp:include page="adminFreeBoardList.jsp">
        <jsp:param value="0" name="nowBlock"/>
        <jsp:param value="0" name="nowPage"/>
        <jsp:param value="${list}" name="list"/>
        <jsp:param value="${count}" name="count"/>
      </jsp:include>
    </div>
  </div>

</body>
</html>