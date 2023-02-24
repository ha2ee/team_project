<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>


<%--
	String id = (String)session.getAttribute("id");
	if(id == null){//로그인 하지 않았을경우
--%>		
<%--	<script>	
		alert("로그인 하고 글을 작성하세요!"); 
		history.back(); 
 	</script> --%>
<%-- 	}--%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>JS Bin</title>
 <script type="text/javascript" src="<%=contextPath%>/ckeditor/ckeditor.js"></script>
</head>
  <body >
  
  	<div style="width: 1200px; margin: 0 auto; margin-bottom: 20px">
  		<div>
  		
	      <h1> 게시글 작성 </h1> <br>
          <input type="text" style="width: 100%; box-sizing: border-box; font-size: 20px" placeholder="제목을 입력해주세요"> 
                  											<%-- box-sizing: border-box를 style에 넣어줘야 너비 끝부분 처리가 완벽 --%>
	      
	      
	      
	                
	        <form>
	            <textarea name="editor1" id="editor1" rows="10" cols="80">
	            </textarea>
	            <script>
	                // Replace the <textarea id="editor1"> with a CKEditor 4
	                // instance, using default configuration.
	                CKEDITOR.replace( 'editor1',{
	                	height : 500
	                } );
	            </script>
	        </form>

  		</div>
  		
  	</div>
 		<div style="width: 1200px; display:flex; justify-content:space-between;  margin:0 auto;  " >
               	<div><input type="file"></div>
               	
               	
               	<div>
                	<div style="display: inline-block;"><button type="submit"  style="width: 100%; font-weight: bold;">목   록</button></div>
                	&nbsp;
	                <div style="display: inline-block;"><button type="submit"  style="width: 100%; font-weight: bold;">등   록</button></div>
               	</div>
               	
  		</div>
  		<br>
    </body>
</html>