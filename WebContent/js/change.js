
	//====================================================================================================
	 


	
	function change(event) {
		
		
		
		
		//약관동의 <input>요소를 선택해서 가져와 
    	var checkbox = $("#agree");
    	
    	
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
	    	
	    	
	    //=====================================================================================================
			
	    	if(confirm("정보를 수정하시겠습니까??")){
				
				$("form").submit();
				
			}else {
				
				location.href="#";
				
			}
		}
	    //=====================================================================================================	

  	function passChange(event) {
		
		
    	var pass = $("#pass");
    	var passValue = pass.val();
    	
    	var passReg = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,20}$/);
    	var resultPass = passReg.test(passValue);

		if(!resultPass){
			$("#Message").text("영어,숫자,특수문자를 호함하여 8~20자로 작성하여주세요.").css("color","red");
			pass.focus();
			return false;
		}else{
			$("#Message").text("");
		}
		
		
    	if($("#checkpass").val() != $("#pass").val()){
    		$("#Message").text("비밀번호가 일치하지 않습니다!").css("color","red");
    		$("#checkpass").focus();
    		return false;
    	}else{
    		$("#Message").text("");
    	}

		
	}
	
		//=====================================================================================================	
	    		
/*	    	$("#delBtn").click(function(){
	    		
	    		if (confirm("정말 회원탈퇴 하시겠습니까?")) {
	    			
					location.href = "delete.me";

				} else {
					
					location.href = "#";

				}

	    	
	    	});*/
	    	
	    	//=====================================================================================================	
    		
  
	    	

			

	
