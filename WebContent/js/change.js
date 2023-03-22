
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


	    	
	    //=====================================================================================================
			
	    	if(confirm("정보를 수정하시겠습니까??")){
		        
	    		$("form").attr("action", "http://localhost:8090/TeamProject/member/updateInfo.me");
				$("form").submit();
				
			}else {
				
				location.href="#";
				
			}
		}
	
	
  	
  	
		//=====================================================================================================	
	    		
	    	$("#delBtn").click(function(){
	    		
	    		if (confirm("정말 회원탈퇴 하시겠습니까?")) {
	    			
					location.href = "delete.me";

				} else {
					
					location.href = "#";

				}

	    	
	    	});
	    	
	    	//=====================================================================================================	
    		
  
	    	

			

	
