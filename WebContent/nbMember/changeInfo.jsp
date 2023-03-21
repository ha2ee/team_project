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


String mem_nick = mem_vo.getMem_nick();
String mem_name = mem_vo.getMem_name();
String mem_hp = mem_vo.getMem_hp();
String mem_birth = mem_vo.getMem_birth();
String mem_email = mem_vo.getMem_email();
String mem_address1 = mem_vo.getMem_address1();
String mem_address2 = mem_vo.getMem_address2();
String mem_address3 = mem_vo.getMem_address3();
String mem_address4 = mem_vo.getMem_address4();
String mem_address5 = mem_vo.getMem_address5();
String mem_id = mem_vo.getMem_id();
String mem_img = mem_vo.getMem_img();

TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");

String tr_name = tr_vo.getTr_name();
String tr_hp = tr_vo.getTr_hp();
String tr_birth = tr_vo.getTr_birth();
String tr_email = tr_vo.getTr_email();
String tr_address1 = tr_vo.getTr_address1();
String tr_address2 = tr_vo.getTr_address2();
String tr_address3 = tr_vo.getTr_address3();
String tr_address4 = tr_vo.getTr_address4();
String tr_address5 = tr_vo.getTr_address5();
String tr_img = tr_vo.getTr_img();
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
	    width: 100%;
	    box-sizing: border-box;
	    text-align: left;
	    min-height: 850px;
		
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
		margin-left: 4px;
  		margin-top: 4px;
		}
	
	.upload{
	    display: inline-block;
	    width: 100%;
		}	
	.imgBtn{
		height: 25px;
		margin-left: 170px;	
		margin-top: -24px;		
	 	color: #fff !important;
	}
	.email_dt,.nick_dt,.hp_dt,
	.address_dt,.pass_dt
	{
		padding-top: 31px;
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
	
	.email_dd,.nick_dd,.hp_dd,
	.address_dd,.pass_dd
	{
	    position: relative;
	    float: left;
	    width: 513px;
	    padding: 20px 0 20px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	
	
	.address4{
		width: 49%;
	}
	
	.email,.nickname,.hp,
	.address
	{
	    width: 49%;
    	height: 6%;
    	font-size: 16px;
    	padding: 11px;
    	margin-bottom: 15px;
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
		margin-left: 14%;	
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
		margin-top: 220px;
	}
	
	.address1{
    	width: 17%;
   		padding-left: 6px;
	}
	
	.address2, .address3 {
    width: 49%;	
    padding-left: 6px;
	
	}
	
	.passChange{
		width: 21%;
    	height: 6%;
	}
	
	.img_dt{
		padding-top: 97px;
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
	
	.img_dd{
	    position: relative;
	    float: left;
	    width: 513px;
	    padding: 20px 0 20px 28px;
	    border-top: 1px solid #e9e9e9;		
	}
 	#preview{
	    max-width: 60%;
	    margin: 0;
	    padding: 0;
	    border: none;
	    line-height: normal;
	    vertical-align: middle;
		width : 160px; 
		height :170px;
	}
	
		
		
	input[type=file] {
 	    width: 124px;
	    max-width: 100%;
	    color: #444;
	    padding: 10px;
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
		
	.imgBtn{
		margin-top: -50px;
	}
	 
	 .imgSave{
        width: 102px;
	    background: white;
	    padding: 11px 20px;
	    border-radius: 10px;
	    color: black;
	    border: 1px solid #231815;
	    height: 41px;
	 }
	 
	 
	 
	 
	input[type=file]::file-selector-button:hover {
 		 background: #061F5C;
		 color:white;
		 border: 0px solid #231815;
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
					<div class="userName"><%=mem_name%>님</div>
					<div class="userId">(<%=id%>)</div>
					<div class="infoBtn">
						<a href="<%=contextPath%>/member/info.me" class="myInfo">내 정보</a>
					<%
					if(mem_id != ""){
					%>					
					<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					<%
					}else{
					%>
					
					<%
					}
					%>
					</div>
				</div>
			
			</div>
			<div class="rightBlock">
					
 				<div class="title">
						<p>사진 등록</p>
					</div>
					<dl>
						
						
						<dt class="img_dt">
							<span>이미지</span>
						</dt>
						<dd class="img_dd">
							<div class="img_div">
						    	<img  id="preview" src="<%=contextPath%>/images/profile.png">
								<div class="imgBtn">
									<label for="images" class="drop-container">
						     		<input id="imgBtn" type="file"  name="imageFileName"  onchange="readURL(this);" />
								   	</label>
									<button id="imgSave" class="imgSave">저장</button>
								</div>

<!-- 				     	<input type="file"  name="imageFileName"  onchange="readURL(this);" /> -->
<!-- 						<input type="file" name="fileNmae" id="fileNmae" class="fileNmae" > -->
							
							</div>
						</dd>
					
					
					</dl>
				<div>	
					<div class="title2">
						<p>정보 수정</p>
					</div>
					<dl class="table">
	
					<%
					if(mem_nick != ""){
					%>
						<dt class="nick_dt">
							<span>닉네임</span>
						</dt>
						<dd class="nick_dd">
							<div class="nick_div">
								<input type="text" name="nickname" id="nickname" class="nickname" value="<%=mem_nick%>">
							</div>
							<p id="nickInput">
						</dd>				
						
					<%
					} else{
					%>
					
					<%
					}
					%>
						<dt class="email_dt">
							<span>이메일</span>
						</dt>
						<dd class="email_dd">
							<div class="email_div">
								<input type="text" id="email" name="email" class="email" value="<%=mem_email + tr_email%>">
							</div>
							<p id="emailInput">
						</dd>
						
						
						<dt class="hp_dt">
							<span>전화번호</span>
						</dt>
						<dd class="hp_dd">
							<div class="hp_div">
								<input type="text" id="hp" name="hp" class="hp" value="<%=mem_hp + tr_hp%>">
							</div>
							<p id="hpInput">
						</dd>
						
						
						<dt class="address_dt">
							<span>주소</span>
						</dt>
						<dd class="address_dd">
							<div class="hp_div">
								<input type="text" id="sample4_postcode" name="address1" class="address1"  placeholder="우편번호" value="<%=mem_address1 + tr_address1 %>">	
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="background-color:#BDBDBD" id="sample4_find"><br><br>				<!-- class="form-control" --> 
								<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소" class="address2" value="<%=mem_address2 + tr_address2 %>" readonly>	<br><br>	
								<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="address3" value="<%=mem_address3 + tr_address3 %>" readonly>
								<input type="text" placeholder="상세주소" id="#sample4_detailAddress" name="address4" value="<%=mem_address4 + tr_address4 %>" class="address4">
								<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  name="address5" value="<%=mem_address5 + tr_address5 %>" readonly>
							</div>
							<p id="addressInput">
						</dd>
					
				
						<dt class="pass_dt">
							<span>비밀번호</span>
						</dt>
						<dd class="pass_dd" style="margin-bottom: 4%;">
							<div class="pass_div">
								<input onclick="passPop();"  type="button" name="passChange" class="passChange" value="변경하기"/>
							</div>
							<input type="hidden" name="pw" id="pw">
						</dd>
						
						
						
						<dt class="btn_dt">
						</dt>
						<dd class="btn_dd">
							<div class="saveBtn">
								<a id="backBtn" href="javascript:history.go(-1),location.reload();" class="roundBtn whiteBtn">취소하기</a>				
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a id="changeBtn" 
								   href="#" 
								   class="roundBtn blueBtn"
								   onclick="change();"
								   >저장</a>
							</div>
						</dd>				
					</dl>
				</div>
			</div>	
		</div>
	</form>	
	
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		
		$(function() {
			
			if($("#hidden_gen").val() == "남아" ){

				$("#p_gender").val("남아").prop("selected", true);
					
			}else if ($("#hidden_gen").val() == "여아"){
				
				$("#p_gender").val("여아").prop("selected", true);
				
			}

			if($("#hidden_op").val() == "했음" ){
	
				$("#p_op").val("했음").prop("selected", true);
					
			}else if($("#hidden_op").val() == "안했음"){
				
				$("#p_op").val("안했음").prop("selected", true);
			
				
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
		  
		 
		  $("#imgSave").mouseover(function(){

		    $("#imgSave").css("background-color", "#061f5c");
		    $("#imgSave").css("color", "white");
			
		  });

		  $("#imgSave").mouseout(function(){

		    $("#imgSave").css("background-color", "transparent");
		    $("#imgSave").css("color", "black");

		  });
			
			  
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("sample4_extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }

		  
		  	
			
		    function passPop(){
		        var url = "http://localhost:8090/TeamProject/nbMember/passPop.jsp";
		        var name = "비밀번호 변경";
		        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		        window.open(url, name, option);
		    }
		    
		    
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
		 	        $('#preview').attr('src', ProgressEvent.target.result);
		 	        
		           }
		     	
		       }
		  			
		  }
				  
		  
		 $(".imgSave").click(function () {
	            var src = $("#preview").attr("src");
					            
	            if(src == "/TeamProject/images/profile.png"){
		        	alert("등록할 사진을 선택하여 주세요.");
		        	
		        }else{
				 	$("form").attr("action", "<%=contextPath%>/member/imgUpdate.me");
			        $("form").attr("enctype", "multipart/form-data");
			        $("form").submit();	
		        }
			 
	
		 });

		
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/change.js"></script>
</body>
</html>