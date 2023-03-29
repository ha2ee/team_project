

//====================================================================================================

    $("#checkBtn").click(function() {
    		
    	var id = $("#id");
    	var idValue = id.val();
    	
    	var idReg = RegExp(/^[A-Za-z0-9_\-]{3,20}$/);
    	var resultId = idReg.test(idValue);
    	
		if(!resultId){
			$("#idInput").text("한글,특수문자 없이 3~20글자사이로 작성해 주세요!").css("color","red");
			id.focus();
			
			return false;
		}else{
			$.ajax( 
    				{
    					type:"post", // 전송요청 방식 설정 ! get 또는 post 둘중 하나를 작성
    					async:true, // 비동기 통신으로 서버페이지를 요청 하는 설정!  false를 작성하면 동기화 통신
    					url:"http://localhost:8090/TeamProject/member/joinIdCheck.me", //요청할 주소
    					data:{ id : $("#id").val() },//서버페이지로 요청할 데이터 설정!
    					dataType:"text", //서버페이지로 부터 응답 받을 데이터 종류 설정!
    									 //종류는 json 또는 xml 또는 text 중 하나 설정!
    					//전송요청과 응답통신에 성공했을때
    					//success속성에 적힌 function(data,textStatus){}이 자동으로 호출된다.
    					// data매개변수로는 서버페이지가 전달한 응답 데이터가 넘어옵니다.
    					// 아이디 중복? 미중복? 둘중 하나의 조건값이 넘어 옵니다.
    					success : function(data,textStatus){
    						
    						console.log(data);
    						
    						//서버페이지에서 전송된 아이디 중복? 인지 아닌지 판단하여
    						//현재 josin.jsp화면에 보여주는 처리 구문 작성
    						if(data == '사용 가능'){ //아이디가 DB에 없으면?(중복아님)
    							
    							$("#idInput").text("사용할수 있는 ID입니다.").css("color","green");
    							$("#id").attr('readonly', true); 
		
    						}else{//아이디가 DB에 있으면? (입력한 아이디가  DB에 저장되어 있다는 의미)
    							
    							$("#idInput").text("사용할수 없는 ID입니다.").css("color","red");
    							
    						}
    					},//success 닫기
    					error:function(data,textStatus){
    						console.log(textStatus);

    						alert("통신에러가 발생했습니다.");
    					}
    					
    					
    				}// json  {  } 닫기
    	
    			  ); // $.ajax메소드 호출 부분 끝부분  
		}
	});
	
    //====================================================================================================
	
    $("#agree").click(function(){
	    	
		if( !($("#agree").is(":checked")) ){ 
			
			$("#agreeInput").text("약관에 동의해 주세요!").css("color","red");
		}else{
			$("#agreeInput").text("");
    	}
   	});
    	
	//====================================================================================================
	    
	$("#nickname").focusout(function() {
		
		var nickname = $("#nickname");
	    	var nickValue = nickname.val();
	    	
	    	var nickReg = RegExp(/^[|가-힣\x20|a-z|A-Z|0-9|]{2,20}$/);
	    	var resultNick = nickReg.test(nickValue);

		if(!resultNick){
			$("#nickInput").text("한글,영어,숫자로 2~20자로 입력하여 주세요.").css("color","red");
			
			return false;
		}else{
			$("#nickInput").text("사용가능한 닉네임 입니다.").css("color","green");
		}
		
	});	

	//====================================================================================================
	$("#name").focusout(function() {
		
		var name = $("#name");
	    	var nameValue = name.val();
	    	
	    	var nameReg = RegExp(/^[|가-힣\x20|]{2,4}$/);
	    	var resultName = nameReg.test(nameValue);

		if(!resultName){
			$("#nameInput").text("이름을 한글로 작성하여주세요.").css("color","red");
			
			return false;
		}else{
			$("#nameInput").text("");
		}
		
	});
	
	//====================================================================================================

	
    $("#pass").focusout(function(){
	
	    	var pass = $("#pass");
	    	var passValue = pass.val();
	    	
	    	var passReg = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/);
	    	var resultPass = passReg.test(passValue);

		if(!resultPass){
			$("#passInput").text("영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요.").css("color","red");
			
			return false;
		}else{
			$("#passInput").text("사용 가능한 비밀번호 입니다.").css("color","green");
		}
	
	});
	
    //====================================================================================================
	
    
	$("#checkpass").focusout(function() {
    	
    	if(!	$("#checkpass").val() == ""){

    		if($("#checkpass").val() == $("#pass").val()){
    			$("#checkpassInput").text("비밀번호가 일치합니다.").css("color","green");
    		}else{
    			$("#checkpassInput").text("비밀번호가 일치하지 않습니다.!").css("color","red");
    		}
    	}
	});
   

	//====================================================================================================

	
	$("#birth").focusout(function(){
     	var birth = $("#birth");
    	var birthValue = birth.val();
    	
    	var birthReg = RegExp(/^[0-9]{8}$/);
    	var resultbirth = birthReg.test(birthValue);
    	
    	
    	if(!resultbirth){
			$("#birthInput").text("생년월일을 8자로 입력하여 주세요").css("color","red");

	    	}else{
    			$("#birthInput").text("");
    		}
    });
	
	


	//====================================================================================================

	$("#gender").focusout(function() {
    	if($("#gender").val() == "선택"){
	    	$("#genderInput").text("성별을 선택해주세요!").css("color","red");
		}else{
	    	$("#genderInput").text("");
		}
    });
   
	//====================================================================================================

	$("#pet").focusout(function() {
    	if($("#pet").val() == "선택"){
	    	$("#petInput").text("애완견을 키우시나요?").css("color","red");
		}else{
	    	$("#petInput").text("");
		}
    });
	
	
	//====================================================================================================

    
    $("#hp").focusout(function() {
		var p = $("#hp");
		var pValue = p.val();
		var pReg = RegExp(/^01[0179][0-9]{7,8}$/);
		var resultP = pReg.test(pValue);
		if(!resultP){
			$("#hpInput").text("휴대폰번호 형식이 올바르지 않습니다.").css("color","red");
		}else{
			$("#hpInput").text("");
		}	
    
    });
	
	
	//====================================================================================================

	
	$("#email").focusout(function() {
		var mail = $("#email");
		var mailValue = mail.val();
		var mailReg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
		var rsEmail = mailReg.test(mailValue);
		
    	if(!rsEmail){
			$("#emailInput").text("이메일 형식이 올바르지 않습니다.").css("color","red");
			
		}else{
			$("#emailInput").text("");
		}
    });

	
	//====================================================================================================
	
	
	function check(event) {
				
		//약관동의 <input>요소를 선택해서 가져와 
    	var checkbox = $("#agree");
    	//약관동의 체크했는지 검사
    	//선택한 <input type="checkbox">체크박스에 체크가 되어 있지 않으면? 
    	//true를 리턴 해서 조건에 만족 합니다. 
    	if( !(checkbox.is(":checked")) ){ //== 같은 true값을 반환 한다. if(!$("#agree").prop("checked"))
    		$("#agreeInput").text("약관에 동의해 주세요!").css("color","red");
    		
    		return false;

    	}    
		
    	//====================================================================================================
    	
    	
    	var id = $("#id");
    	var idValue = id.val();
    	
    	var idReg = RegExp(/^[A-Za-z0-9_\-]{3,20}$/);
    	var resultId = idReg.test(idValue);
    	
		if(!resultId){
			$("#idInput").text("한글,특수문자 없이 3~20글자사이로 작성해 주세요!").css("color","red");
			id.focus();
			
			return false;
		}else{
//			$("#idInput").text("사용가능한 아이디 입니다").css("color","green");
		}
    	
    	//====================================================================================================
			
		var nickname = $("#nickname");
    	var nickValue = nickname.val();
    	
    	var nickReg = RegExp(/^[|가-힣\x20|a-z|A-Z|0-9|]{2,20}$/);
    	var resultNick = nickReg.test(nickValue);

		if(!resultNick){
			$("#nickInput").text("한글,영어,숫자로 2~20자로 입력하여 주세요.").css("color","red");
			nickname.focus();
			return false;
		}else{
			$("#nickInput").text("");
		}
    	
    	//====================================================================================================

			
		var name = $("#name");
    	var nameValue = name.val();
    	
    	var nameReg = RegExp(/^[|가-힣\x20|]{2,4}$/);
    	var resultName = nameReg.test(nameValue);

		if(!resultName){
			$("#nameInput").text("이름을 한글로 작성하여주세요.").css("color","red");
			name.focus();
			return false;
		}else{
			$("#nameInput").text("");
		}
	
    	//====================================================================================================

		var address1 = $("#sample4_postcode");
		var address2 = $("#sample4_roadAddress"); 
		var address3 = $("#sample4_jibunAddress")
		var address4 = $("#sample4_detailAddress");
		var address5 = $("#sample4_extraAddress");
		var addVal1 = address1.val();
		var addVal2 = address2.val();
		var addVal3 = address3.val();
		var addVal4 = address4.val();
		var addVal5 = address5.val();
		
		if(addVal1 == "" || addVal2 == "" || addVal3 == ""){
			$("#addressInput").text("주소를 작성하여주세요.").css("color","red");
			return false;
		}else{
			$("#addressInput").text("");
		}
    	
		if( addVal4 == ""){
			$("#addressInput").text("상세주소를 작성하여주세요.").css("color","red");
			$("#sample4_detailAddress").focus();
			return false;
		}
		//====================================================================================================

		
		
    	var pass = $("#pass");
    	var passValue = pass.val();
    	
    	var passReg = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/);
    	var resultPass = passReg.test(passValue);

		if(!resultPass){
			$("#passInput").text("영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요.").css("color","red");
			pass.focus();
			return false;
		}else{
			$("#passInput").text("사용 가능한 비밀번호 입니다.").css("color","green");
		}
		
	    //====================================================================================================
    	
	    
			
    	if($("#checkpass").val() != $("#pass").val()){
    		$("#checkpassInput").text("비밀번호가 일치하지 않습니다.!").css("color","red");
    		$("#checkpass").focus();
    		return false;
    	}else{
    		$("#checkpassInput").text("비밀번호가 일치합니다.").css("color","green");
    	}

    	//====================================================================================================

       	var birth = $("#birth");
    	var birthValue = birth.val();
    	
    	var birthReg = RegExp(/^[0-9]{8}$/);
    	var resultbirth = birthReg.test(birthValue);
    	
    	
    	if(!resultbirth){
			$("#birthInput").text("생년월일을 8자로 입력하여 주세요").css("color","red");
			$("#birth").focus();
			return false;

	    	}else{
    			$("#birthInput").text("");
    		}
 

    	//====================================================================================================

	    	if($("#gender").val() == "선택"){
		    	$("#genderInput").text("성별을 선택해주세요!").css("color","red");
		    	$("#gender").focus();
    			return false;
	    	
	    	}else{
    	    	$("#genderInput").text("");
    		}
	   
	    	//====================================================================================================
	    	
	    	if($("#pet").val() == "선택"){
	    		$("#petInput").text("애완견을 키우나요?").css("color","red");
	    		$("#pet").focus();
	    		return false;
	    		
	    	}else{
	    		$("#petInput").text("");
	    	}
	    	
    	//====================================================================================================

	    
			var p = $("#hp");
    		var pValue = p.val();
    		var pReg = RegExp(/^01[0179][0-9]{7,8}$/);
    		var resultP = pReg.test(pValue);
    		if(!resultP){
    			$("#hpInput").text("휴대폰번호 형식이 올바르지 않습니다.").css("color","red");
    			p.focus();
    			return false;
    		
    		}else{
    			$("#hpInput").text("");
    		}	
    	
    	//====================================================================================================
		
			var mail = $("#email");
    		var mailValue = mail.val();
    		var mailReg = /^\w{5,12}@[a-z]{2,10}[\.][a-z]{2,3}[\.]?[a-z]{0,2}$/;
    		var rsEmail = mailReg.test(mailValue);
    		
	    	if(!rsEmail){
    			$("#emailInput").text("이메일 형식이 올바르지 않습니다.").css("color","red");
    			mail.focus();
    			return false;
	    	
	    	}else{
    			$("#emailInput").text("");
    		}
	
	    	
	    		if($("#nickname").val() == "" || $("#nickname").val() == null){
	    			
	    			alert("관리자의 승인을 기다려 주세요.");
	    			
	    		}else if($("#nickname").val() != "" || $("#nickname").val() != null){
	    			
	    			alert("회원가입이 완료 되었습니다.");
	    		
	    		}
	    	
   	    	
   	    	
   	    		
   	    	
   	    	$("form").submit();
	}
		