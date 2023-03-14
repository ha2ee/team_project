
document.getElementById("adClick").addEventListener('click', function() {
	document.getElementById("sample4_postcode").value = "";
	document.getElementById("sample4_roadAddress").value = "";
	document.getElementById("sample4_jibunAddress").value = "";
	document.getElementById("sample4_detailAddress").value = "";
	document.getElementById("sample4_extraAddress").value = "";
	});


//모달 창 열기
function openModal() {
document.getElementById("memModal").style.display = "block";
}

//모달 창 닫기
function closeModal() {
document.getElementById("memModal").style.display = "none";
}

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
		$("#emailInput").text("사용가능한 이메일 입니다.").css("color","green");
	}
});


//====================================================================================================


function check(event) {
	
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

    	
	    	alert("정보수정완료");
	    	
	    	
	    	$("#updateForm").submit();
}


//닉네임 중복 체크
$("#checkBtn").click(function() {
	
	var nick = $("#nickname");
	var nickValue = nick.val();
	
	var nickReg = RegExp(/^[|가-힣\x20|a-z|A-Z|0-9|]{2,20}$/);
	var resultNick = nickReg.test(nickValue);
	
	if(!resultNick){
		$("#nickInput").text("한글,특수문자 없이 3~20글자사이로 작성해 주세요!").css("color","red");
		nick.focus();
		
		return false;
	}else{
		$.ajax( 
				{
					type:"post", 
					async:true, 
					url:"http://localhost:8090/TeamProject/adm/checkMemNick.adm", 
					data:{ nick : $("#nickname").val() },
					dataType:"text",
					success : function(data,textStatus){
						
						console.log(data);
						
						if(data == '사용 가능'){ 
							$("#nickInput").text("사용할수 있는 닉네임입니다.").css("color","green");
						}else{
							$("#nickInput").text("사용할수 없는 닉네임입니다.").css("color","red");
							
						}
					},
					error:function(data,textStatus){
						console.log(textStatus);

						alert("통신에러가 발생했습니다.");
					}
					
					
				}// json  {  } 닫기
	
			  ); // $.ajax메소드 호출 부분 끝부분  
	}
});

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

    
//===========================================================
    //이미지 초기화 
    function resetImg(id) {
    	
    	let result = window.confirm("정말로 이미지를 초기화 하시겠습니까?");
    	
    	let httpRequest; 
    	
    	if(result){
    		httpRequest = new XMLHttpRequest();
    	if(!httpRequest) {
    		alert('XMLHTTP 인스턴스 생성 불가');
    		return false;
    	}
    	httpRequest.onreadystatechange = function () {
    		
        if(httpRequest.readyState === XMLHttpRequest.DONE) {
          if(httpRequest.status === 200) {
            alert(httpRequest.responseText);
            location.reload();
          } else {
            alert('request 문제 발생 확인');
          }
        }
      };
      httpRequest.open('GET','/TeamProject/adm/resetImg.adm?id='+id);
      httpRequest.send();
    	
    } else {
    	return false;
    }
    	
    }