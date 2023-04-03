<%@page import="VO.PetVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
	String memImgPath = contextPath + "/memImg/";
%>
<%
	MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");
	
	String mem_name = mem_vo.getMem_name();	
	String mem_img = mem_vo.getMem_img();
	
	PetVo pet_vo = (PetVo)request.getAttribute("pet_vo");
	
	String p_name = pet_vo.getP_name();	
	int p_age = pet_vo.getP_age();
	String p_gender = pet_vo.getP_gender();
	String p_type = pet_vo.getP_type();
	String p_op = pet_vo.getP_op();
	int p_weight = pet_vo.getP_weight();
	String p_img = pet_vo.getP_img();
	
	String id = (String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
	<link rel="stylesheet" href="<%=contextPath%>/css/petChange.css">

</head>
<body>
	<form method="post">	
		<div class="pet_total">
			<hr>
			
			<div class="leftBlock">
				<div class= "userInfo">
					<div class="profile">
					<%
						if(mem_img == "profile.png"){
					%>
  						<img src="<%=contextPath%>/images/profile.png" class="userImg">  
					<%
						}else{
					%>
						<img src="<%=memImgPath+mem_img%>" class="userImg">
					<%
						}
					%>
					</div>
				</div>
				<div class="user" >
					<div class="userName"><%=mem_name%>님</div>
					<div class="userId">(<%=id%>)</div>
					<div class="infoBtn">
						<a href="<%=contextPath%>/member/info.me" class="myInfo">내 정보</a>
						<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					</div>
				</div>
			
			</div>
			<div class="rightBlock">
				<div class="title">
					<p>사진 등록</p>
				</div>
				<dl class="teble">
					<dt class="img_dt">
						<span>사진</span>
					</dt>
					<dd class="img_dd">
						<div class="upload">
							<div class="img_style">
								 <span>  
								    <img id="p_img" class="p_img" src="<%=contextPath%>/images/pet.png">
								 </span>	
   								<div class="imgBtn">
									<label for="images" class="drop-container">
						     		<input id="imgBtn" type="file"  name="petImageFileName"  onchange="readURL(this);" />
								   	</label>
									<button id="petImgSave" class="petImgSave">저장</button>
								</div>
							</div>
						</div>
					</dd>
					<div class="title2">
						<p>정보 수정</p>
					</div>
					<dt class="name_dt">
						<span>이름</span>
					</dt>
					<dd class="name_dd">
						<div class="name_div">
							<input type="text" name="p_name" class="p_name" value="<%=p_name%>" readonly>
						</div>
					</dd>				
					<dt class="age_dt">
						<span>나이</span>
					</dt>
					<dd class="age_dd">
						<div class="age_div">
							<input type="text" name="p_age" class="p_age" value="<%=p_age%>">&nbsp;세
						</div>
					</dd>				
					<dt class="weight_dt">
						<span>몸무게</span>
					</dt>
					<dd class="weight_dd">
						<div class="weight_div">
							<input type="text" name="p_weight" class="p_weight" value="<%=p_weight%>">&nbsp;kg
						</div>
					</dd>				
					<dt class="type_dt">
						<span>견종</span>
					</dt>
					<dd class="type_dd">
						<div class="type_div">
							<input type="text" name="p_type" class="p_type" value="<%=p_type%>">
						</div>
					</dd>				
					
					<dt class="gender_dt">
						<span>성별</span>
					</dt>
					<dd class="gender_dd">
						<div class="gender_div">
							<select class="p_gender" name="p_gender" id="p_gender" value="<%=p_gender%>">
								<option value="남">남</option>
								<option value="여">여</option>
							</select>
						<input id="hidden_gen" type="hidden" value="<%=p_gender%>">
						</div>
					</dd>				
					
					<dt class="op_dt">
						<span>중성화 수술</span>
					</dt>
					<dd class="op_dd">
						<div class="op_div">
							<select class="p_op" name="p_op" id="p_op" value="<%=p_op%>">
								<option value="예">예</option>
								<option value="아니오">아니오</option>
								<option value="모름">모름</option>
						<input id="hidden_op" type="hidden" value="<%=p_op%>">
							</select>
							
						</div>
					</dd>				
					
					<dt class="btn_dt">
					</dt>
					<dd class="btn_dd">
						<div class="saveBtn">
							<a id="backBtn" href="<%=contextPath%>/member/petInfo.me" class="roundBtn whiteBtn">취소하기</a>				
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a id="changeBtn" 
							   href="#" 
							   class="roundBtn blueBtn"
							   onclick="petInfoChange(); return false;"
							   >저장</a>
						</div>
					</dd>				
				
					
				</dl>
			
			
			</div>
		</div>
	</form>
	<script type="text/javascript">
		
		$(function() {
			
			if($("#hidden_gen").val() == "남" ){

				$("#p_gender").val("남").prop("selected", true);
					
			}else if ($("#hidden_gen").val() == "여"){
				
				$("#p_gender").val("여").prop("selected", true);
				
			}

			if($("#hidden_op").val() == "예" ){
	
				$("#p_op").val("예").prop("selected", true);
					
			}else if($("#hidden_op").val() == "아니오"){
				
				$("#p_op").val("아니오").prop("selected", true);
			
			}else if($("#hidden_op").val() == "모름"){
				
				$("#p_op").val("모름").prop("selected", true);
			
				
			}
		});
	
	
		  $("#backBtn").mouseover(function(){

		    $("#backBtn").css("background-color", "#061f5c");
		    $("#backBtn").css("color", "white");
			
		  });

		  $("#backBtn").mouseout(function(){

		    $("#backBtn").css("background-color", "transparent");
		    $("#backBtn").css("color", "#23527c");

		  });
		
		  
		  $("#changeBtn").mouseover(function(){

		    $("#changeBtn").css("background-color", "white");
		    $("#changeBtn").css("color", "#33333");
		  });

		  $("#changeBtn").mouseout(function(){

		    $("#changeBtn").css("background-color", "#061f5c");
		    $("#changeBtn").css("color", "#white");

		  });
	
		  $("#petImgSave").mouseover(function(){

		    $("#petImgSave").css("background-color", "#061f5c");
		    $("#petImgSave").css("color", "white");
					
		  });

		  $("#petImgSave").mouseout(function(){

		    $("#petImgSave").css("background-color", "transparent");
		    $("#petImgSave").css("color", "black");

		  });

		  
		  
            
		 $(".petImgSave").click(function () {
	            var src = $("#p_img").attr("src");
	            if(src == "/TeamProject/images/pet.png"){
		        	alert("등록할 사진을 선택하여 주세요.");
		        	
		        }else{
				 	$("form").attr("action", "<%=contextPath%>/member/petImgUpdate.me");
			        $("form").attr("enctype", "multipart/form-data");
			        $("form").submit();	
		        }
			 
	
		 });
		 
		//제이쿼리를 이용해 아래쪽의 <input type="file">태그에서 이미지 파일 첨부시 미리보기 기능을 구현하는 함수 
	    function readURL(input) { // <- <input type="file">태그를 매개변수로 전달 받는다.
	 	
	 	 //크롬 웹브라우저의 F12 눌러 개발자모드창을 열어서 console탭에 띄운 로그메세지를 확인 한다.
	 	  console.log(input);
	    	  console.log(input.files)
	    	//참고.
	    	//<input type="file">인 태그객체의 files메소드를 호출하면
	    	//FileList라는 배열이 생성 되면서 FileList배열 내부의 0번쨰 인덱스 위치에
	    	//아래에서 선택한(업로드할) 파일 정보들을 key:value쌍으로 저장한 File객체가 저장되어 있음
	    	  
	   	//FileList라는 배열이 존재하고...
	   	//FileList라는 배열의 0번째 인덱스 위치에 아래에서 파일을 업로드하기 위해서 선택한 File객체가 저장되어 있다면?
	   	//요약 : 아래의 <input type="file">태그에서 업로드를 하기 위한 파일을 선택 했다면?
	       if (input.files && input.files[0]) {
	     	  
	     	  //파일을 문자 단위로 읽어들일 통로 생성 
	 	      var reader = new FileReader();
	     	     	  
	 	      //지정한 img태그에 첫번째 파일 input에 첨부한 파일에 대한 File객체를 읽어드립니다. 
	 	      reader.readAsDataURL(input.files[0]);
	     	  
	     	  //업로드 하기 위해 선택한 파일을 모두 읽어 들였다면?
	 	      reader.onload = function (ProgressEvent) {
	     		 //읽어들인 File객체의 정보는 매개변수로 넘어오는 ProgressEvent객체내부의?
	     		 //target속성에 대응되는 객체(JSON객체 데이터형식)로 저장 되어 있다.
	     		 console.log(ProgressEvent);
	     		  
	  		    //id가 preview인 <img>태그를 선택해 
	  		    //attr메서드를 이용해 파일 첨부시 미리보기 이미지를 나타내기 위해
	  		    //src속성값에  new FileReader()객체를 이용하여 읽어들인 첨부할 File객체정보를 지정하여
	  		    //추가 함으로써 이미지 파일의 미리보기기능이 가능 한 것입니다.
	 	        $('#p_img').attr('src', ProgressEvent.target.result);
	 	        
	           }
	     	
	       }
	  			
	  }
	
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/petJoin.js"></script>
</body>
</html>