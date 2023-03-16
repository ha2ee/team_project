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
  
   if (id == null || id.equals("")) {
      %>      
      <script>    
          alert("로그인을 해야 댓글을 작성 할 수 있습니다."); 
          history.back(); 
      </script>
  <%}%>
  
<!--  	String likeCheck = (String)request.getAttribute("likeCheck");
  System.out.println("ㅇㅇㅇㅇ:" +likeCheck );
 --> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
 <style type="text/css">
		.post-Container {
		margin : 0 auto;
		border-top: 1px solid #ddd;
		border-bottom: 1px solid #ddd;
		width:1200px;
		padding: 20px;
		}
		
		.post {
		border-bottom: 1px solid #ddd;
		background-color: #fffff;
		
		}
		
		.post-title {
		  font-size: 24px;
		}
		
		.post-info {
		  color: #888;
		  font-size: 14px;
		}
		
		.post-body {
		text-align : left;
		  line-height: 1.5;
		  
		}
		
.post-header {
	display:flex;
	justify-content: space-between;
	align-items : flex-end;
	border-bottom: 1px solid #ddd;
	background-color: #fafafa;
}
		
.post-buttons {
	position: relative;
	text-align: right;
	padding-top: 40px;
	padding-bottom: 20px;
}
.post-buttons input[type="button"] {
	display: inline-block;
	margin-left: 10px;
	padding: 8px 20px;
	border-radius: 20px;
	border : none;
	color : white;
	background-color: #EDAF8C;
}

a.download {
  color: #000000;
}

div.filedownload {
	position : relative;
	top : 20px;
	border: 1px solid #ddd;
	padding: 20px;
	font-size: 16px;
}

/* 	댓글 CSS */
	
	#tblAddCommnet, #tblListComment { margin: 15px auto; }
	
	#tblAddComment { margin-top: 30px; }
/* 	#tblAddComment td:nth-child(1) { width: 600px; } */
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
	
<%-- 	<c:if test="${not empty vo.b_file || not empty imageUrls}">
	<div align="left" class="filedownload">첨부파일<br>

	다운로드할 폴더번호 경로와 다운로드 할 파일명 전달
	<c:choose>
		<c:when test="${vo.tb_level==0}">
			<c:if test="${not empty vo.tb_file}">
			<a href="<%=contextPath%>/tb/download.bo?tbidx=<%=tb_idx%>&fileName=<%=file%>" class="download"><%=file%></a>&nbsp;&nbsp;
			</c:if>
		</c:when>
		<c:when test="${vo.tb_level>0}"> 
			<c:if test="${not empty vo.tb_file}">
			<a href="<%=contextPath%>/uploadFile/TrainerBoardFile/reply_tb_idx${vo.tb_idx}/<%=file%>" download class="download"><%=file%></a>&nbsp;&nbsp;
			</c:if>
		</c:when>
	</c:choose>
		CKEDITOR로 입력한 이미지 다운로드 링크생성
		<c:if test="${not empty imageUrls}">
			<c:forEach var="imageUrls" items="${imageUrls}">
				<c:set var="imageUrl" value="${imageUrls}"/>
				<c:set value="${fn:split(imageUrl, '/')}" var="imageNameTemp" />
				<c:set var="imageName" value="${imageNameTemp[fn:length(imageNameTemp)-1]}"/>
				<a href="${imageUrls}" download="${imageName}"  class="download" >${imageName}</a>&nbsp;&nbsp;
			</c:forEach> 
		</c:if>
		CKEDITOR로 입력한 이미지 다운로드 링크생성 끝
	</div>
  	</c:if>
 --%>    	
    <div class="post-buttons">
		<input type="button" value="목록으로" onclick="location.href='list.fb?nowPage=0&nowBlock=0'" id="list" />
       
        <!-- 수정,삭제는 세션아이디와 조회한 글의 작성자아이디가 동일할때만 노출시키기 필요 -->
		<c:if test="${sessionScope.id eq vo.b_id}">
			<input type="button" value="수정하기" onclick="location.href='modify.fb?b_idx=<%=b_idx%>'" />
			<input type="button" value="삭제하기" onclick="javascript:Delete('<%=b_idx%>');" id="delete"/>
		</c:if>
       
    </div>
    
    
    <div style="margin-left: 12%; display: flex; flex-direction: column;">
      <div>
      
       <%
        if((String)request.getAttribute("likeCheck")=="0"){ //좋아요를 안 눌렀다면?
      %>
         <a id="likeimgg" onclick="javascript:clickLike('<%=id%>')" > 
          <i class="fa-regular fa-heart fa-4x" id="likeimggg"></i>
        </a>
         <%
        } else{ //좋아요를 눌렀다면?
        %>
        <a id="likeimgg" onclick="javascript:clickLike('<%=id%>')" > 
          <i class="fa-solid fa-heart fa-4x" id="likeimggg"></i>
        </a>
        
        <%
        }
        %>
         
      </div>
      
      
      <div>
        <p id="countLike" style="font-size: 30px"><%=like%></p>
      </div>
    </div>

<script type="text/javascript">
  const b_idx = <%=vo.getB_idx()%>
  var originLikeCount = <%=like%>
  
  function clickLike(id){
    if(id == "null"){
      alert("로그인부터 해라");
    } else{
      $.ajax({
              url: "<%=contextPath%>/freeboard/like.fb",
              async : true,
              type : 'POST',
              data : {
                        b_idx : b_idx,
                        id : id
                      },
              success : function(data) {
                   /*     if(data=originLikeCount-1){
                           $("#likeimggg").attr("class","fa-regular fa-heart fa-4x"); //이미 좋아요 누른 경우;
                                     $("#countLike").text(data);
  
                                     } else{
                                     $("#countLike").text(data);
                                     $("#likeimggg").attr("class","fa-solid fa-heart fa-4x");
                                    
                                     } */
  
                      $("#countLike").text(data);
                      $("#topLike").text(data);
                      if (data > originLikeCount) {
                        $("#likeimggg").attr("class","fa-solid fa-heart fa-4x");
                      } else if (data <= originLikeCount) {
                        $("#likeimggg").attr("class","fa-regular fa-heart fa-4x"); //이미 좋아요 누른 경우;
                      }
                      }
            });
      }
    
  }
  
</script>
    
    
    
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript">
//삭제하기를 눌렀을때 ajax로 삭제 처리하기
function Delete(b_idx){
			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
			
			if(result == true){//확인 버튼 클릭
				
				//비동기방식으로 글삭제 요청!
				$.ajax({
					type : "post",
					async : true,
					url : "<%=contextPath%>/freeboard/del.fb",
					data : {b_idx : b_idx},
					dataType : "text",
					success : function(data){
						
						if(data==1){
							alert("삭제 성공!");
							
							//강제로 클릭 이벤트 발생시키는 부분
							location.href="<%=contextPath%>/freeboad/list.fb";
							
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
 	<script type="text/javascript">
 	
 	function updateviewBtn(){}
 	
 	
 	</script>
 
 
 
 <!-- 끝----댓글수정 -->
 
<div style="margin: 0 77;">

	<table id="tblListComment" class="table table-bordered">
	
		<c:if test="${ clist.size() == 0 }">
			<tr>
				<td colspan="2">댓글이 없습니다.</td>
			</tr>
		</c:if>
		
		<c:forEach items="${ clist }" var="cdto">
		<c:set var="i" value="0"/>
			<tr>
				<td>
				<!-- 댓글 표시&수정창 -->
					<textarea id="updateActive" rows="2" style="width: 100%;" disabled="disabled">${cdto.content}</textarea>
					<span>${ cdto.name }. ${ cdto.regdate }</span>
				</td>
				<td>
		<!-- 댓글 작성자만 수정/삭제 버튼이 보이게 처리 c:if -->
		<c:if test="${ id eq cdto.id}">
				<input id="update" type="button" value="수정하기" onclick="updateActive('${i}')" class="btn btn-default" >
				
				<input id="updatePro" type="button" value="수정완료" class="btn btn-default" 
						onclick="location.href='<%=contextPath%>/freeboard/upComment.do?seq=${ cdto.seq }&pseq=<%=b_idx%>';"/>
					<input type="button" value="삭제하기" class="btn btn-default" 
						onclick="location.href='<%=contextPath%>/freeboard/delcomment.do?seq=${ cdto.seq }&pseq=<%=b_idx%>';"/>
			<c:set var="i" value="${i+1}"/>
		</c:if>
				</td>
			</tr>
		</c:forEach>	
	</table>
	
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	function updateActive(a) {

		//수정시 입력하는 화면 활성화
		$("#updateActive").removeAttr("disabled");
		
		//수정하기 버튼 안보이게
		document.getElementById("update").style.display = 'none';

		//수정완료 버튼 보이게 
		document.getElementById("updatePro").style.display = 'block';
	}
	
	</script>
	
	
	<form method="POST" action="<%=contextPath%>/freeboard/addcomment.do">
		<table style="border: none;" id="tblAddComment" class="table table-bordered">
			<tr style="border: none;">
				<td style="border: none;"><input type="text" name="content" id="content" class="form-control" required placeholder="댓글을 작성하세요. "/></td>
				<td style="border: none;"><input type="submit" value="댓글쓰기" class="btn btn-primary" /></td>
			</tr>
		</table>
		<input type="hidden" name="pseq" value="<%=b_idx%>" />
	</form>
	
</div>
<!-- 댓글끝------------------------------------ -->    
    <div style="margin-bottom: 2%">
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