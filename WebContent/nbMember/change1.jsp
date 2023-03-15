<%@page import="VO.MemberVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>
   
<%
	MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");
	
	String mem_nick = mem_vo.getMem_nick();
	String mem_pw = mem_vo.getMem_pw();
	String mem_name = mem_vo.getMem_name();
	String mem_hp = mem_vo.getMem_hp();
	String mem_birth = mem_vo.getMem_birth();
	String mem_email = mem_vo.getMem_email();
	String mem_gender = mem_vo.getMem_gender();
	String mem_address1 = mem_vo.getMem_address1();
	String mem_address2 = mem_vo.getMem_address2();
	String mem_address3 = mem_vo.getMem_address3();
	String mem_address4 = mem_vo.getMem_address4();
	String mem_address5 = mem_vo.getMem_address5();
	String mem_img = mem_vo.getMem_img();
	
	
	
	TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");
	
	String tr_pw = tr_vo.getTr_pw();
	String tr_name = tr_vo.getTr_name();
	String tr_hp = tr_vo.getTr_hp();
	String tr_birth = tr_vo.getTr_birth();
	String tr_email = tr_vo.getTr_email();
	String tr_address1 = tr_vo.getTr_address1();
	String tr_address2 = tr_vo.getTr_address2();
	String tr_address3 = tr_vo.getTr_address3();
	String tr_address4 = tr_vo.getTr_address4();
	String tr_address5 = tr_vo.getTr_address5();
	String tr_gender = tr_vo.getTr_gender();
	String tr_img = tr_vo.getTr_img();
	
	String id = (String)session.getAttribute("id");
	
	if(id == null){//로그인 하지 않았을 경우 
%>		
		<script>
			alert("로그인이 필요합니다."); 
			history.back();
		</script>
<%	
	}
%>  
    



<%-- 문서에 작성되는 언어 타입을 HTML로 하여 이파일은 HTML이 적힌 파일 이다 라고 웹브라우저에 알려주는 코드
	 요약 : 문서 코드 타입.
 --%>    
<!doctype html>


<%--이 부분은 웹페이지에서 사용되는 언어는 영어다 ~ 라고 웹브라우저에 알려주는 역할을 하는 코드.  --%>
<html>
<head>

<%-- 웹브라우저에 다양한 문자가 꺠지지 않게 처리 하기 위해 문자처리 방식을 웹브라우저에 알려주는 코드 --%>
<meta charset="utf-8">

<%-- 
	반응형 웹페이지를 적용해 주는 부분입니다. 모바일이나 데스크탑은 해상도가 다른데,
	각 해상도에 맞춘 웹페이지를 보여주게 설정 하는 코드 입니다.
    content="width=device-width"  이부분은  각 기기의 해상도의 너비에 맞게  사이트 화면의 너비를 자동으로 맞추겠다~라는 뜻	                           
 --%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<title>회원가입</title>

<style type="text/css">
	#id,#pass,#nickname,#checkpass,#name,
	#hp,.birth,#email,#sample4_postcode,
	#sample4_find,#sample4_detailAddress,
	#sample4_extraAddress,#sample4_jibunAddress,
	#sample4_roadAddress
	{
	  width: 400px;
	  height: 40px;
	  font-size: 15px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  padding-left: 10px;
	  background-color: rgb(233, 233, 233);
	}
	
	
	#checkBtn{
	  width: 90px;
	  height: 32px;
	  font-size: 12px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  padding-left: 8px;
	  background-color: rgb(233, 233, 233);
	}

	
	.gender,.pet{
	  width: 100px;
	  height: 32px;
	  font-size: 12px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  padding-left: 10px;
	  background-color: rgb(233, 233, 233);
	  margin-left: 15px;	
	  float : left;
	}
  	
	.join{
		display: flex;     
		align-items: center;   
		justify-content: center;   
	
	}
	
	#ex_file	{  /* 파일 필드 숨기기 */
	  position: absolute;
	  width: 1px;
	  height: 1px;
	  padding: 0;
	  margin: -1px;
	  overflow: hidden;
	  clip:rect(0,0,0,0);
	  border: 0;
	}
 	#preview{
    max-width: 60%;
    margin: 0;
    padding: 0;
    border: none;
    line-height: normal;
    vertical-align: middle;
	width : 300px; 
	height :240px;
}
	.heigthD{
		height: 100px;
	
	}
		
</style>
</head>
<body>
<form action="<%=contextPath%>/member/updateInfo.me" class="form" method="post">	
	<div>
		<div align="center" ><!-- class="row justify-content-left" -->
			<h1>정보 수정하기</h1>
			<div style="height: 50px;"></div>
		</div>
		<div>
			<div class="join" >
				<div class="heigthD" style="width: 400px;" >
					<div>
						<label><strong>&nbsp;아이디</strong></label><br><br> 
						<input type="text" 
							   id="id" 
							   name="id"
							   class="form-control"
							   placeholder="가입할 아이디를 적어주세요."
							   style="width: 400px;"
							   value="<%=id%>"
							   readonly	>
				    </div>
					<br>
					<div style="height: 15px;" >
				    	<p id="idInput" style="margin-top:-5px;"></p> 
					</div>
				</div>
					
				<div class="heigthD" style="margin-left: 40px;">
					<label><strong>&nbsp;비밀번호</strong></label><br><br> 
					<input type="password" 
						   id="pass" 
						   name="pass"
						   class="form-control"
						   placeholder="영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요." 
						   value="<%=mem_pw + tr_pw %>">
					<p id="passInput" style="margin-top:-5px;"></p>
				</div>						
			</div>
			
			
			<div class="join">
				<div class="heigthD">
					<label><strong>&nbsp;닉네임</strong></label><br><br> 
					
				<%
				if(tr_name == ""){
				%> 
					<input type="text" 
						   id="nickname" 
						   name="nickname"
						   class="nickname"
						   value="<%=mem_nick + tr_name%>"
						   placeholder="사용할 닉네임을 적어주세요" >
 				<%
					}else{
				%>
				    <input type="text" 
						   id="nickname" 
						   name="nickname"
						   class="nickname"
						   placeholder="트레이너는 닉네임을 지정할수 없습니다."
						   readonly >
				<% 
					}
				%>   
				    
				    
				    
				    
				    <p id="nickInput"></p> 
				</div>
				<div class="heigthD" style="margin-left: 40px;">
					<label><strong>&nbsp;비밀번호 확인</strong></label><br><br> 
					<input type="password" 
						   id="checkpass" 
						   name="checkpass"
						   class="form-control"
						   value="<%=mem_pw + tr_pw %>"
						   placeholder="비밀번호를  재입력 하세요."> 
					<p id="checkpassInput"></p>
				</div>						
			</div>
			<div class="join">
				<div class="heigthD">
					<label><strong>&nbsp;이름</strong></label><br><br> 
					<input type="text" 
						   id="name" 
						   name="name"
						   class="form-control"
						   placeholder="가입할 이름을 적어주세요."
						   value="<%=mem_name + tr_name %>"
						   readonly> 
					<p id="nameInput"></p>
				</div>
				<div class="heigthD" style="margin-left: 40px;">	
					<label><strong>&nbsp;핸드폰번호</strong></label><br><br>
					<input type="text" 
						   id="hp" 
						   name="hp"
						   class="form-control"
						   value="<%=mem_hp + tr_hp %>"						  
						   placeholder="핸드폰번호를 '-'없이 적어주세요."> 
					<p id="hpInput"></p>
				</div>
			</div>
			<div  class="join">
				<div class="heigthD" id="selbox">
					<label><strong>&nbsp;생년월일</strong></label><br><br>
					<input type="text" 
						   id="birth" 
						   name="birth"
						   class="birth"
						   placeholder="ex)20010917"
						   value="<%=mem_birth + tr_birth%>"						  
						   readonly> 
					<p id="birthInput"></p>
				</div>					
				<div class="heigthD" style="margin-left: 40px;">
					<label><strong>&nbsp;Email</strong></label><br><br>
					<input type="email" 
						   id="email" 
						   name="email"
						   class="form-control"
						   value="<%=mem_email + tr_email %>"						 
						   placeholder="이메일을 적어주세요."> 
					<p id="emailInput"></p>
				</div>
			</div>
			<div class="join">
				<div class="heigthD" >
					<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
					<label><strong>&nbsp;주소</strong></label><br><br>	
					<input type="text" id="sample4_postcode" name="address1" class="form-control" placeholder="우편번호" value="<%=mem_address1 + tr_address1%>" readonly><br><br>	
				</div>	
				<div class="join">
					<div style="margin-left: 30px; width: 120px; height: 90px;">
						<label><strong>&nbsp;&nbsp;성별</strong></label><br>
							<input class="gender" name="gender" id="gender" style="width:90px;height:38px;"  value="<%=mem_gender + tr_gender%>" readonly >
							
							</input>
						
					</div>
 					<div style="margin-left: 30px; width: 260px; height: 90px;">	
<!-- 						<label> -->
<!-- 							<strong style="margin-right: 133px;"> -->
<!-- 								&nbsp;&nbsp;애완견을 키우나요? -->
<!-- 							</strong> -->
<!-- 						</label> -->
						<br>
<!-- 							<select class="pet" name="pet" id="pet" style="width:100px;height:38px;"> -->
<!-- 								<option>선택</option> -->
<!-- 								<option>네</option> -->
<!-- 								<option>아니요</option> -->
<!-- 							</select> -->
							<p id="genderInput" style="font-size: 13px;"></p>
<!-- 							<p id="petInput" style="font-size: 13px;"></p> -->
							
					</div>
				</div>			
			</div>
			<div class="join" style="margin-right: -65px; ">
				<div>
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="background-color:#BDBDBD" id="sample4_find"><br><br>					<!-- class="form-control" --> 
					<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소" value="<%=mem_address2 + tr_address2%>" readonly><br><br>		
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3"  value="<%=mem_address3 + tr_address3%>" readonly><br><br>		
					<span id="guide" style="color:#999; display:none;"></span>
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4" value="<%=mem_address4 + tr_address4%>"><br><br>		
					<input type="text" id="sample4_extraAddress" placeholder="참고항목"  name="address5" value="<%=mem_address5 + tr_address5%>" readonly>
				    <p id="addressInput"></p> 
				</div>	
				<div>  <!--  -->
					    <img  id="preview" src="<%=contextPath%>/images/profile.png" class="profile">
					</div>
					<div>
				     	<input type="file"  name="imageFileName"  onchange="readURL(this);" style="margin-top: 220px;"/>
					</div>
				
				
				<%-- <div style="width: 400px;" > 
				    <img  id="preview" src="<%=contextPath%>/images/profile.png" width=200 height=220 style="margin-right: 70px;"/>
				</div>
				<div class="filebox" style="margin-left: -50px;margin-top: 200px;" >
		 			<label id="Photo"for="ex_file" class="btn btn-outline-warning">사진 등록</label>
				    <input type="file" id="ex_file" name="imageFileName"  onchange="readURL(this);"> 
				</div> --%>
			</div>
			<br>
			<br>
			<div align="center" style="margin-left: 50%;">
				<div>
					<a onclick="change();" 
					   type="button" 
					   class="btn btn-outline-warning"
					>정보수정</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
			
					<button type="button"
					 		class="btn btn-outline-warning"
							id = "delBtn"
					>회원탈퇴</button>
				</div>
			</div>		
		</div>
	</div>
</form>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
		
	<%-- 카카오 우편번호 API --%>	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
			  
	  
	    </script>	


	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

	<%--회원정보 수정 유효성 체크  --%>
	<script src="<%=request.getContextPath()%>/js/change.js"></script>


</body>
</html>
