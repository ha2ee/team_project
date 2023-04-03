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
	
	TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");
	
	String tr_name = tr_vo.getTr_name();
	String tr_img = tr_vo.getTr_img();
	String id = (String)session.getAttribute("id");
%>	
 <%-- 
	반응형 웹페이지를 적용해 주는 부분입니다. 모바일이나 데스크탑은 해상도가 다른데,
	각 해상도에 맞춘 웹페이지를 보여주게 설정 하는 코드 입니다.
    content="width=device-width"  이부분은  각 기기의 해상도의 너비에 맞게  사이트 화면의 너비를 자동으로 맞추겠다~라는 뜻	                           
 --%>
   
   <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="<%=contextPath%>/css/petJoin.css">
	
</head>
<body>
	<form method="post" action="<%=contextPath%>/member/petJoinPro.me">
		<div class="pet_total">
			<hr>
			<div class="leftBlock">
				<div class= "userInfo">
					<div class="profile">
					<%
						if(mem_img == "profile.png" || tr_img == "profile.png"){
					%>
  						<img src="<%=contextPath%>/images/profile.png" class="userImg">  
					<%
						}else{
					%>
						<img src="<%=memImgPath+mem_img+tr_img%>" class="userImg">
					<%
						}
					%>
					</div>
				</div>
				<div class="user" >
					<div class="userName"><%=mem_name + tr_name%>님</div>
					<div class="userId">(<%=id%>)</div>
					<div class="infoBtn">
						<a href="<%=contextPath%>/member/info.me" class="myInfo">내 정보</a>
						<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					</div>
				</div>
			
			</div>
			
			<div class="rightBlock">
				<div>
		 			<h2 class="pet_add">반려견 정보 등록</h2>
		 		</div>
				<div class="line"></div>
				<br><br>
				<div class="rightBlock2">	
					<div class="p_img">
						<label>반려견 사진</a></label><br>
						<div style="border: 1px solid #d7d7d7;
					                width: 140px;
					                height: 140px;">
							 <span>  
							    <img id="p_img" class="p_img" src="<%=contextPath%>/images/pet.png">
							 </span>	
					     	
					     	<div class="imgBtn">
						     	<label for="images" class="drop-container">
					     		<input id="imgBtn" type="file"  name="petImageFileName"  onchange="readURL(this);" />
							</div>
							<div class="div">	
								<p id="imgInput"></p>
							</div>
						</div>
					</div>
					<br><br><br><br>
					<div class="p_name">
						<label>반려견 이름</a></label><br>
						<input type="text" name="p_name" id="p_name" >
					</div>	
					<div class="div">
						<p id="nameInput"></p>
					</div>
					<br>
					
					
					<div class="p_age">
						<label>반려견 나이</a></label><br>
						<input type="text" name="p_age" id="p_age">
					</div>
					<div class="div">	
						<p id="ageInput"></p>
					</div>		
					<br>
					
					
				</div>
				<div class="rightBlock3">
					<div class="p_weight">
						<label>반려견 몸무게</a></label><br>
						<input type="text" name="p_weight" id="p_weight">
					</div>
					<div class="div">	
						<p id="wdightInput"></p>
					</div>		
					<br>
									
					<div class="p_type">
						<label>반려견 견종</a></label><br>
						<input type="text" name="p_type" id="p_type">
					</div>
					<div class="div">	
						<p id="typeInput"></p>
					</div>		
					<br>
					
					
					<div class="p_gender">
						<label>성별</label><br>
							<select class="p_gender" name="p_gender" id="p_gender">
								<option>선택</option>
								<option>남</option>
								<option>여</option>
							</select>
					</div>
					<div class="div">
						<p id="genderInput"></p>
					</div>
					
					
					<div class="p_op" style="margin-top: 15px;">
						<label>중성화 수술 </label><br>
							<select class="p_op" name="p_op" id="p_op">
								<option>선택</option>
								<option>했음</option>
								<option>안했음</option>
								<option>모름</option>
							</select>
					</div>
					<div class="div">	
						<p id="opInput"></p>
					</div>
					<br>

				</div>
			</div>
				<div class="saveBtn">
					<a id="backBtn" href="<%=contextPath%>/member/petInfo.me" class="roundBtn whiteBtn">취소하기</a>				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="joinBtn" 
					   onclick="check(); return false;" 
					   class="roundBtn blueBtn"
					   >등록</a>
				</div>
		
		
		</div>
	</form>
	<script type="text/javascript">
	
	$(document).ready(function(){

		  $("#backBtn").mouseover(function(){

		    $("#backBtn").css("background-color", "#061f5c");
		    $("#backBtn").css("color", "white");
			
		  });

		  $("#backBtn").mouseout(function(){

		    $("#backBtn").css("background-color", "transparent");
		    $("#backBtn").css("color", "#23527c");

		  });
		
		  
		  $("#joinBtn").mouseover(function(){

		    $("#joinBtn").css("background-color", "white");
		    $("#joinBtn").css("color", "#33333");
		  });

		  $("#joinBtn").mouseout(function(){

		    $("#joinBtn").css("background-color", "#061f5c");
		    $("#joinBtn").css("color", "#white");

		  });

		  
		});
	
	
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
	
	<%--펫 등록 유효성 체크  --%>
	<script src="<%=request.getContextPath()%>/js/petJoin.js"></script>
	

</body>

</html>
	