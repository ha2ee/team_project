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

	.pet_total{
	    max-width: 1240px;
	    margin: 0 auto;
	    text-align: center;
	    padding: 0px 20px 0px;
	    box-sizing: border-box;
	    position: relative;
	}
	
	.leftBlock {
	    width: 220px;
	    margin-right: 30px;
 	    position: absolute; 
	    box-sizing: border-box;
	    border: 1px solid #d7d7d7;
	    border-top: 3px solid #fff5f3;
	    margin-top: 35px;
	}	
		
	.userInfo{
	    padding: 30px;
			
	}
	
	.userImg{
		border-radius: 70%;
		height: 158px;
	    border: 1px solid #231815;
	    width: 150px;
	}
	
	.userName,.userId{
		font-size: 15px;
   		color: #555;
   		margin-bottom: 6px;
	    width: 150px;
	}
	
	.user{
		display: inline-block;
   		width: 100%;
 			padding: 0 20px 30px;
	}
	
	.myInfo,.petInfo{
		font-size: 13px;
	    color: #555;
	    float: left;
	    width: 48%;
	    margin-right: 2%;
	    height: 30px;
	    line-height: 28px;
	    background: #eaeaea;
	    border-radius: 50px;
	}
		
	.rightBlock{
	    padding: 3px 15px 80px 250px;
	    padding-left: 300px;
		width: 1100px;
	    box-sizing: border-box;
	    text-align: left;
	    min-height: 900px;
		
	} 

	.table{
		width: 100%;
	    border-top: 1px solid #d5d5d5;
	    border-bottom: 1px solid #e9e9e9;
	
	}
	
	.pet1{
		font-size: 25px;
	}

	.img_dt{
		padding-top: 93px;
		position: relative;
	    float: left;
	    width: 204px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    color: #555;
	    font-family: 'NGB';
	    font-size: 14px;
	    line-height: 100%;
		border-top: 1px solid #e9e9e9;
	}

	.img_dd{
		position: relative;
	    float: left;
	    width: 513px;
	    padding: 25px 0 25px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	.p_img{
		/*margin-left: 4px; */
	    /* margin-top: 4px; */
	    max-width: 100%;
	    /* margin: 0; */
	    /* padding: 0; */
	    /* border: none; */
	    line-height: normal;
	    vertical-align: middle;
	    width: 160px;
	    height: 148px;
	}
	
	.upload{
	    display: inline-block;
    	width: 100%;
	}	
	
	.imgBtn{
		height: 25px;
		margin-left: 170px;	
		margin-top: -36px;		
	 	color: #fff !important;
	}
	.name_dt,.age_dt,.weight_dt,
	.type_dt,.op_dt,.gender_dt,
	.btn_dt{
		padding-top: 28px;
		border-top: 1px solid #e9e9e9;
	    display: table-cell;
	    position: relative;
	    float: left;
	    width: 204px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    color: #555;
	    font-family: 'NGB';
	    font-size: 14px;
	    line-height: 100%;
		
	}	
	
	.name_dd,.age_dd,.weight_dd,
	.type_dd,.op_dd,.gender_dd,
	.btn_dd{
	    position: relative;
	    float: left;
	    width: 513px;
	    padding: 20px 0 20px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	
	.p_name,.p_age,.p_weight,
	.p_type,.p_op,.p_gender{
		width: 250px;
		height: 36px;
		color: black;
		padding-left: 6px;
	}
	
	.roundBtn {
		border-radius: 50px;
   		display: inline-block;
	    text-align: center;
	    transition: all 0.3s ease 0s;
	    height: 43px;
	    line-height: 41px;
	    cursor: pointer;
		width: 172px;
	}

	.whiteBtn {
		background: transparent;
   		border: 1px solid #231815;
		box-sizing: border-box;
		color: black;
		
	}
	
	.blueBtn {
		background: #061f5c;
   		box-sizing: border-box;
		color: #fff;
		border: 1px solid #231815;
		
	}
	
	.saveBtn{
		margin-left: -50px;
	}
	
	.petBtn{
		margin-bottom: 25px;
		margin-left: 28px
	
	}
	
	.Info{
   		border: 0px solid #231815;
		color: #555;
		border-radius: 8px;
   		display: inline-block;
	    text-align: center;
	    transition: all 0.3s ease 0s;
	    height: 43px;
	    line-height: 43px;
	    cursor: pointer;
		width: 190px;
		margin-right: 25px;
		background-color: white;
	}
	
	a:hover {
 	 	text-decoration: none;
	}
	
	.title{
	    margin-bottom: 15px;
    	font-weight: bold;
		font-size: 21px;
	}

	.title2{
	    margin-bottom: 15px;
	    font-weight: bold;
	    font-size: 21px;
	    width: 100px;
   	}
	
	input[type=file]::file-selector-button:hover {
 		 background: #061F5C;
		 color:white;
		 border: 0px solid #231815;
	}
	
	input[type=file]::file-selector-button {
	  	margin-right: 20px;
		border: none;
		background: white;
		padding: 10px 20px;
		border-radius: 10px;
		color: black;
		cursor: pointer;
		transition: background .2s ease-in-out;
 		border: 1px solid #231815;	
 	}	
 		
	.petImgSave {
	    width: 102px;
	    background: white;
	    padding: 11px 20px;
	    border-radius: 10px;
	    color: black;
	    border: 1px solid #231815;
	    height: 41px;
	    margin-left: 114px;
	    margin-top: -46px;
	}
	
	.img_style{
	    border: 1px solid #d7d7d7;
	    width: 140px;
	    height: 150px;
	}
</style>

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
								<option value="했음">했음</option>
								<option value="안했음">안했음</option>
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