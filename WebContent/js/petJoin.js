	
	//====================================================================================================
	
	
	function check(event) {
    	
    	var name = $("#p_name");
    	var nameValue = name.val();
    	
    	var nameReg = RegExp(/^[|가-힣\x20|a-z|A-Z|]{1,20}$/);
    	var resultName = nameReg.test(nameValue);
    	
		if(!resultName){
			$("#nameInput").text("한글 또는 영어로 입력하여 주세요!").css("color","red");
			name.focus();
			
			return false;
		}else{
			$("#nameInput").text(" ");
		}
    	
    	//====================================================================================================
			
		var age = $("#p_age");
    	var agetValue = age.val();
    	
    	var ageReg = RegExp(/^[0-9]{1,2}$/);
    	var resultAge = ageReg.test(agetValue);

		if(!resultAge){
			$("#ageInput").text("숫자로 정확히 입력하여 주세요").css("color","red");
			age.focus();
			return false;
		}else{
			$("#ageInput").text("");
		}
    	
    	//====================================================================================================

		var weight = $("#p_weight");
    	var weightValue = weight.val();
    	
    	var weightReg = RegExp(/^[0-9]{1,2}$/);
    	var resultWeight = weightReg.test(weightValue);

		if(!resultWeight){
			$("#wdightInput").text("숫자로 정확히 입력하여 주세요").css("color","red");
			weight.focus();
			return false;
		}else{
			$("#wdightInput").text("");
		}
    	
	
		//====================================================================================================

		
		
    	var type = $("#p_type");
    	var typeValue = type.val();
    	
    	var typeReg = RegExp(/^[|가-힣\x20|a-z|A-Z|]{1,20}$/);
    	var resultType = typeReg.test(typeValue);

		if(!resultType){
			$("#typeInput").text("견종을 입려하여 주세요.").css("color","red");
			type.focus();
			return false;
		}else{
			$("#typeInput").text("");
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

    	if($("#p_gender").val() == "선택"){
	    	$("#genderInput").text("성별을 선택해주세요!").css("color","red");
    		$("#p_gender").focus();
	    	return false;
    	
    	}else{
	    	$("#genderInput").text("");
		}
   
    	//====================================================================================================
    	
    	if($("#p_op").val() == "선택"){
    		$("#opInput").text("중성화 수술을 했나요?").css("color","red");
    		$("#p_op").focus();
    		return false;
    		
    	}else{
    		$("#opInput").text("");
    	}
    	

    	
    	alert("애완견 정보가 등록 되었습니다.");
    	
    	
    	$("form").submit();
	}
		
	function petInfoChange(){
		$("form").attr("action", "<%=contextPath%>/member/petChangePro.me");
        $("form").submit();	
		
		
	}



	
	