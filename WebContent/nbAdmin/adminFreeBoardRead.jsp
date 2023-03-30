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
  
  //   CommentVO cvo = (CommentVO) request.getAttribute("cvo");
  //   int seqnum = Integer.parseInt(cvo.getSeq());

	String id = (String)session.getAttribute("id");
  %>
  
<!--  	String likeCheck = (String)request.getAttribute("likeCheck");
  System.out.println("ㅇㅇㅇㅇ:" +likeCheck );
 --> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
    
 <style type="text/css">
/* 	댓글 CSS */
	
	#tblAddCommnet, #tblListComment { width: 700px; margin: 15px auto; }
	
	#tblAddComment { margin-top: 30px; }
	#tblAddComment td:nth-child(1) { width: 600px; }
	#tblAddComment td:nth-child(2) { width: 100px; }
	
	#tblListComment td:nth-child(1) { width: 600px; }
	#tblListComment td:nth-child(2) { width: 100px; }
	
	#tblListComment td {
		position: relative;
		left: 0;
		top: 0;
	}
	
	#tblListComment td span {
		position: absolute;
		right: 10px;
		bottom: 5px;
		color: #AAA;
		font-size: 11px;
	}
	

	/* 	댓글 CSS 끝*/
		#updatePro{
     display: none;
    }
    </style>
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
			<input type="button" value="삭제하기" onclick="javascript:fbDelete('<%=b_idx%>');" id="delete"/>
    </div>
    
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript">
//삭제하기를 눌렀을때 ajax로 삭제 처리하기
function fbDelete(fb_idx){
			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
			
			if(result == true){//확인 버튼 클릭
				
				//비동기방식으로 글삭제 요청!
				$.ajax({
					type : "post",
					async : true,
					url : "<%=contextPath%>/adm/tbDelete.bo",
					data : {fb_idx : fb_idx},
					dataType : "text",
					success : function(data){
						
						if(data=="삭제성공"){
							alert("삭제 성공!");
							
							//강제로 클릭 이벤트 발생시키는 부분
							location.href="<%=contextPath%>/tb/list.bo";
							
						}else{//"삭제실패"
							alert("삭제에 실패했습니다.")
							location.reload();
						}
						
					},
					error : function(){
						alert("비동기 통신 장애");
					}
				});
				
			}else{//취소 버튼을 눌렀을때
				return false;
			}
		}

</script>    
    
<div style="margin-bottom: 2%">

 <!-- 댓글시작------------------------------------ -->  
 
 <!-- 댓글수정 -->
 
 
 <!-- 끝----댓글수정 -->
 
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
				<form id="commentUpdate${i}" action="<%=contextPath%>/freeboard/upcomment.do" method="post">
					<textarea id="updateActive${i}" rows="3" name="commupdate" cols="60" disabled="disabled">${cdto.content}</textarea>
					<input type="hidden" value="${cdto.seq}" name ="seq2"/>
					<input type="hidden" value="<%=b_idx%>" name="b_idx"/>
					</form>
					<span>${ cdto.name }. ${ cdto.regdate }</span>
				</td>
				<td>
		<!-- 댓글 작성자만 수정/삭제 버튼이 보이게 처리 c:if -->
		<c:if test="${ id eq cdto.id}">
				<input id="update${i}" type="button" value="수정하기" onclick="updateActive('${i}')" class="btn btn-default" >
				
				<input id="updatePro${i}" type="button" value="수정완료" class="btn btn-default" style="display:none;"
						onclick="comment('${i}');"/>
					<input type="button" value="삭제하기" class="btn btn-default" 
						onclick="location.href='<%=contextPath%>/freeboard/delcomment.do?seq=${ cdto.seq }&pseq=<%=b_idx%>';"/>
		</c:if>
				</td>
			</tr>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>	
	</table>
	<style>  
		#updatePro{
		 display: none;
		}
	</style>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	function comment (b) {
		 var commentUpdate = document.getElementById("commentUpdate"+b);
		 
		 commentUpdate.submit();
	}
	
	
	
	function updateActive(a) {

		//수정시 입력하는 화면 활성화
		$("#updateActive"+a).removeAttr("disabled");
		
		//수정하기 버튼 안보이게
		document.getElementById("update"+a).style.display = 'none';

		//수정완료 버튼 보이게 
		document.getElementById("updatePro"+a).style.display = 'block';
	}
	
	</script>
	
	<!-- 로그인 세션값이 있어야 댓글작성 form이 노출되도록 수정 -->
	<c:if test="${not empty sessionScope.id}">
	
	<form method="POST" action="<%=contextPath%>/freeboard/addcomment.do">
		<table id="tblAddComment" class="table table-bordered" >
			<tr>
				<td><input type="text" name="content" id="content" class="form-control" required placeholder="댓글을 작성하세요. "/></td>
				
				
				<td><input type="submit" value="댓글쓰기" class="btn btn-primary" /></td>
			</tr>
		</table>
		<input type="hidden" name="pseq" value="<%=b_idx%>" />
	</form>
	
	</c:if>
	
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