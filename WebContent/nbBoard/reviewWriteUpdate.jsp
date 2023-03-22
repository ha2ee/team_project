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
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
  <body >
  
  	<div style="width: 1200px; margin: 0 auto; margin-bottom: 20px">
  		<div>
	        <form action="<%=contextPath%>/review/editPro.rv" method="post" enctype="multipart/form-data">
          <input type="hidden" name="idx" value="${vo.idx}">
		      <h1> 게시글 작성 </h1> <br>
	          <input type="text" name="title" style="width: 100%; box-sizing: border-box; font-size: 20px" placeholder="제목을 입력해주세요" value="${vo.title}"> 
	                  											<%-- box-sizing: border-box를 style에 넣어줘야 너비 끝부분 처리가 완벽 --%>
            <br><br>
            <textarea rows="20" style="width:100%; font-size: 25px;" name="editor1" class="DOC_TEXT" name="DOC_TEXT" placeholder="리뷰에 대한 내용을 1000자 이내로 기재해주세요.">${vo.context}</textarea>
            <span style="color:#aaa; font-size: 15px;" id="counter">(0 / 최대 1000자)</span>
<!-- 	            <textarea name="editor1" id="editor1" rows="10" cols="80">
	            </textarea>
	            <script>
	                // Replace the <textarea id="editor1"> with a CKEditor 4
	                // instance, using default configuration.
	                CKEDITOR.replace( 'editor1',{
	                	height : 500
	                } );
//	      			var str = CKEDITOR.instances.editor1.getData();
	            </script>  -->
	             <br>
	             <!-- <input type="hidden" name="content11" id="content11"> -->
	            <div style="width: 1200px; display:flex; justify-content:space-between;  margin:0 auto;  " >
	             
<!--                		<div><input type="file" name="fileName" id="fileName"></div> -->
               	
               		<div>
                		<div style="display: inline-block;"><input type="button" value="목 록" style="width: 100%; font-weight: bold;" onclick="location.href='<%=contextPath%>/review/list.rv'" /></div>
                		&nbsp;
	                	<div style="display: inline-block;"><input type="button" value="등 록" id="registration" style="width: 100%; font-weight: bold;" onclick="frmsubmit()"></div>
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
	function frmsubmit(){
//		$("#content11").attr("value",str);
/* 		if(!$("#fileName").val()){
		  alert("이미지를 첨부해주세요");
		} else{
 */		$("form").submit();
//		}
	}
	
	$('.DOC_TEXT').keyup(function (e){
	  var content = $(this).val();
	  $('#counter').html("("+content.length+" / 최대 1000자)");    //글자수 실시간 카운팅

	  if (content.length > 1000){
	      alert("최대 1000자까지 입력 가능합니다.");
	      $(this).val(content.substring(0, 1000));
	      $('#counter').html("(1000 / 최대 1000자)");
	  }
	});
	</script>
  		
  		
  		
    </body>
</html>