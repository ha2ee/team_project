<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="VO.TrainerBoardVo"%>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	
	//조회한 글정보 얻기
	TrainerBoardVo vo = (TrainerBoardVo)request.getAttribute("vo");
	String name = vo.getTb_name();//조회한 글을 작성한 사람 이름
// 	String email = vo.getTb_email();//조회한 글을 작성한 사람의 이메일
	String title = vo.getTb_title();//조회한 글제목
	String content = vo.getTb_content(); //조회한 글 내용.replace("/r/n", "<br>")
	System.out.print(content);
	String file = vo.getTb_file();//업로드한 실제파일명 (조회후 받아온 값)
// 	int downCount = vo.getDowncount(); //업로드한 파일을 실제 다운로드한 횟수
	Date date = vo.getTb_date();
	int cnt = vo.getTb_cnt();
	
	String tb_idx = (String)request.getAttribute("tb_idx");
	System.out.println("-----@@@@" + tb_idx);
	
	
%>
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
		}
		
		.post {
		border-bottom: 1px solid #ddd;
		}
		
		.post-title {
		  font-size: 24px;
		}
		
		.post-info {
		  color: #888;
		  font-size: 14px;
		}
		
		.post-body {
		  line-height: 1.5;
		}
		
		.post-header {
		display:flex;
		justify-content: space-between;
		align-items : flex-end;
		border-bottom: 1px solid #ddd;
		}
		
		
    </style>
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
	</div>
	<c:if test="${not empty vo.tb_file}">
	<div align="center">다운로드:
	<%-- 다운로드할 폴더번호 경로와 다운로드 할 파일명 전달 --%>
	<a href="<%=contextPath%>/tb/download.bo?tbidx=<%=tb_idx%>&fileName=<%=file%>">&nbsp;&nbsp;<%=file%></a><br>
<%
// content
//     .replaceAll("&", "&amp;")
//     .replaceAll("<", "&lt;")
//     .replaceAll(">", "&gt;")
//     .replaceAll("\"", "&quot;")
//     .replaceAll("'", "&#39;"); //크롬에선 문제x entity 변환필요한 브라우저에선 주석 해제 필요
Pattern pattern = Pattern.compile("src=\"(.*?)\""); //주어진 정규식을 갖는 패턴을 생성//src="http://localhost:8090/TeamProject/ckstorage/images/edu.png"
Matcher matcher = pattern.matcher(content); //패턴에 매칭할 문자열을 입력해 Matcher를 생성(인자에 검사할 문자열)
List<String> imageUrls = new ArrayList<>(); //imageUrl을 저장할 배열 생성

while (matcher.find()) { //패턴이 일치하는 다음 문자열을 찾는다. 다음 문자열이 있다면 true 
	//src="http://localhost:8090/TeamProject/ckstorage/images/edu.png"
	//src="http://localhost:8090/TeamProject/ckstorage/images/lessonlist.png"
  String imageUrl = matcher.group(1); //String group(int group) 매칭되는 문자열 중 group번째 그룹의 문자열 반환
  System.out.println("matcher.group()값 : " +matcher.group()); // 패턴과 일치하는 모든 것, 그룹 0은 예약되어 있으며 항상 전체 일치 항목을 반환하는 반면 다른 모든 항목은 선택 사항이며 사용자가 정의
  System.out.println("matcher.group(1)값 : " +matcher.group(1)); //그룹 1: 시작 단어 와 끝 단어 사이의 숫자 
  imageUrls.add(imageUrl);
}

for (int i = 0; i < imageUrls.size(); i++) {
	  String imageUrl = imageUrls.get(i);
	  String imageName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1); //파일명만 얻는 subString /+1위치부터 마지막까지 자른다.
	  %>
	  <a href="<%= imageUrl %>" download="<%= imageName %>"><%= imageName %></a><br>
	  <%
	}
	%>
	</div>
    </c:if>
    	
    <div style="text-align: center;">
		<input type="button" value="목록으로" onclick="location.href='list.bo?page=${pageNum}'" id="list" />
        <!-- 수정,삭제는 세션아이디와 조회한 글의 작성자아이디가 동일할때만 노출시키기 필요 -->
        <input type="button" value="수정하기" onclick="location.href='tbUpdate.bo?tb_idx=${tb_idx}'" />
        <input type="button" value="삭제하기" onclick="javascript:tbDelete('<%=tb_idx%>');" id="delete"/>
    </div>
    
    
    
    
    
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>    
<script type="text/javascript">
//삭제하기를 눌렀을때 ajax로 삭제 처리하기
function tbDelete(tb_idx){
			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
			
			if(result == true){//확인 버튼 클릭
				
				//비동기방식으로 글삭제 요청!
				$.ajax({
					type : "post",
					async : true,
					url : "<%=contextPath%>/tb/tbDelete.bo",
					data : {tb_idx : tb_idx},
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