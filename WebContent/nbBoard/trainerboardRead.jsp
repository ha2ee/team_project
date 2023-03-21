<%@page import="DAO.TrainerBoardDAO"%>
<%@page import="java.util.Date"%>
<%@page import="VO.TrainerBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	//조회한 글정보 얻기
	TrainerBoardVo vo = (TrainerBoardVo)request.getAttribute("vo");
	String writerId = vo.getTb_id();
	String name = vo.getTb_name();
	String title = vo.getTb_title();
	String content = vo.getTb_content(); 
	String file = vo.getTb_file();
	Date date = vo.getTb_date();
	int cnt = vo.getTb_cnt();
	
	String tb_idx = (String)request.getAttribute("tb_idx");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세</title>
	<link rel="stylesheet" href="<%=contextPath%>/nbBoard/TrainerBoard.css">
</head>
<body>
	<div class="post-Container">
	      <div class="post">
	        <div class="post-header">
	          <h2 class="post-title"><%=title%></h2>
	         
	          <div class="post-info">
	            작성자: <%=name%> | 작성일자: <%=date%> | 조회수: <%=cnt%>
				</div>
	        </div>
	        <div class="post-body">
	          <p><%out.print(content);%></p>
	        </div>
	      </div>
	
	<c:if test="${not empty vo.tb_file || not empty imageUrls}">
	<div align="left" class="filedownload">첨부파일<br>

	<%-- 다운로드할 폴더번호 경로와 다운로드 할 파일명 전달 --%>
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
		<%--CKEDITOR로 입력한 이미지 다운로드 링크생성 --%>
		<c:if test="${not empty imageUrls}">
			<c:forEach var="imageUrls" items="${imageUrls}">
				<c:set var="imageUrl" value="${imageUrls}"/>
				<c:set value="${fn:split(imageUrl, '/')}" var="imageNameTemp" />
				<c:set var="imageName" value="${imageNameTemp[fn:length(imageNameTemp)-1]}"/>
				<a href="${imageUrls}" download="${imageName}"  class="download" >${imageName}</a>&nbsp;&nbsp;
			</c:forEach> 
		</c:if>
		<%--CKEDITOR로 입력한 이미지 다운로드 링크생성 끝 --%>
	</div>
  	</c:if>
    	
    <div class="post-buttons">
		<input type="button" value="목록으로" onclick="location.href='list.bo?page=${pageNum}'" id="list" />
       
        <!-- 수정,삭제는 세션아이디와 조회한 글의 작성자아이디가 동일할때만 노출시키기 필요 -->
		<c:if test="${sessionScope.id eq vo.tb_id}">
			<input type="button" value="수정하기" onclick="location.href='tbUpdate.bo?tb_idx=${tb_idx}'" />
			<input type="button" value="삭제하기" onclick="javascript:tbDelete('<%=tb_idx%>','${vo.tb_level}');" id="delete"/>
		</c:if>
       
        <!-- 답글달기는 세션아이디가 MEMBER_TRAINER에 포함되어있는 경우에만 나타나도록 조건필요 -->
		<c:if test="${not requestScope.trainerboarddao.checkTable(sessionScope.id) && not empty sessionScope.id}">
			<input type="button" value="답글달기" onclick="location.href='tbReply.bo?tb_idx=${tb_idx}&center=/nbBoard/trainerboardReply.jsp'" id="reply"/>
		</c:if>
    </div>
    </div>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript">
//삭제하기를 눌렀을때 ajax로 삭제 처리하기
function tbDelete(tb_idx,tb_level){
			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
			
			if(result == true){//확인 버튼 클릭
				
				//비동기방식으로 글삭제 요청!
				$.ajax({
					type : "post",
					async : true,
					url : "<%=contextPath%>/tb/tbDelete.bo",
					data : {tb_idx : tb_idx, tb_level : tb_level},
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
    

</body>
</html>