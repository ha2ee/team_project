<%@page import="VO.FreeBoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();

FreeBoardVo vo = (FreeBoardVo) request.getAttribute("vo");
String title = vo.getB_title();
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
	        <form action="<%=contextPath%>/freeboard/modifyPro.fb" method="post" enctype="multipart/form-data">
		      <h1> 게시글 작성 </h1> <br>
	          <input type="text" name="title" style="width: 100%; box-sizing: border-box; font-size: 20px" placeholder="제목을 입력해주세요" value="<%=title%>"> 
	            <textarea name="editor1" id="editor1" rows="10" cols="80">
	            </textarea>
	            <script>
	                // Replace the <textarea id="editor1"> with a CKEditor 4
	                // instance, using default configuration.
	                CKEDITOR.replace( 'editor1',{
	                	height : 500
	                } );
//	      			var str = CKEDITOR.instances.editor1.getData();
	            </script>
	             <br>
	             <!-- <input type="hidden" name="content11" id="content11"> -->
	            <div style="width: 1200px; display:flex; justify-content:space-between;  margin:0 auto;  " >
	             
               		<div><input type="file" name="fileName"></div>
               	
               		<div>
                		<div style="display: inline-block;"><input type="button" value="목 록" style="width: 100%; font-weight: bold;" onclick="location.href='<%=contextPath%>/freeboard/list.fb'" /></div>
                		&nbsp;
	                	<div style="display: inline-block;"><input type="submit" value="등 록" id="registration" style="width: 100%; font-weight: bold;"></div>
               		</div>
               	
  				</div>
	            
	        </form>

  		</div>
  		
  	</div>
  		<br>
  		
<%-- 제이쿼리가 안 먹힌다....................   		
  	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  	<script type="text/javascript">
  		
  		$("#registration").click(function(){
  			var title = $(".title").val();
  			var content = $("#editor1").val();
  			var fileName = $(".fileName").val();
  			
  			$.ajax({
  			  	 type:"post",
				 async:true,
				 url:"<%=contextPath%>/freeboard/writePro.fb",
				 data:{ title : title, 
					 	content : content,
					 	fileName : fileName
					 	}, 
				 dataType : "text",
				 success:function(data){
					 console.log(data);
				 }
  			})
  		})
  	
  	</script>
 --%>  		
	<script type="text/javascript">
	function fnsubmit(){
//		$("#content11").attr("value",str);
		$("form").submit();
	}
	
	</script>
  		
  		
  		
    </body>
</html>