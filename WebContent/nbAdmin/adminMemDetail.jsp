<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회화면</title>
<style type="text/css">
.memDetail_Board {
border-collapse: collapse;
width : 1200px;
}

.memDetail_Board th, .memDetail_Board td {
		  padding: 10px 20px; 
 		  text-align: center; 
		  border: 1px solid #ddd; 
		}
		
.memDetail_Board td {
	width : 80%;
}

.updateMem {
border : none;
outline : none;
text-align : center;
font-size: 16px;
readonly:none;

}

/* input[type="text"] {
border : none;
outline : none;
text-align : center;
font-size: 16px;
readonly:readonly;

} */

/* 모달 창 스타일 */
.modal {
  display: none; /* 모달 창을 초기에 숨김 */
  position: fixed; /* 모달 창이 화면에 고정됨 */
  z-index: 1; /* 다른 요소들보다 위에 표시됨 */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* 모달 내용이 화면 크기를 초과하면 스크롤바를 표시함 */
  background-color: rgba(0,0,0,0.4); /* 배경색을 검정색 반투명으로 지정 */
}

/* 모달 내용 스타일 */
.modal-content {
  background-color: white;
  margin: 10% auto; /* 모달 창이 화면 중앙에 위치하도록 함 */
  padding: 20px;
  border: 1px solid #888;
  width: 800px;
}

.modal-content table {
	width : 100%;
	margin : 0 auto;
	border: 1px solid #888;
}

.modal-content th {
	text-align: center;
	width : 30%;
}

.modal-content td {
	width : 70%;
}
input[type="text"] {
	width: 250px;
}

p {
font-size: 10px;
display: inline;
}

/* 모달 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>

	<h3>회원 상세 정보 페이지</h3>

	<table class="memDetail_Board">
		<tr>
			<th>등록된 이미지</th>
			<td>${memberVO.mem_img}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${memberVO.mem_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memberVO.mem_name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${memberVO.mem_nick}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${memberVO.mem_pw}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${memberVO.mem_email}</td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td>${memberVO.mem_hp}</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${memberVO.mem_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${memberVO.mem_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${memberVO.mem_joindate}</td>
		</tr>
		<tr>
			<th>펫 유무</th>
			<td>${memberVO.mem_pet}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${memberVO.mem_address1}</td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td>${memberVO.mem_address2}</td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td>${memberVO.mem_address3}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${memberVO.mem_address4}</td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td>${memberVO.mem_address5}</td>
		</tr>						
	</table>
	
<button onclick="openModal()">정보수정하기</button>
<div id="memModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
   	<form action="${contextPath}/adm/updatePro.adm" method="post" id="updateForm">
   	<input type="hidden" value="${memberVO.mem_id}" name="id">
   	<h2>회원정보 수정</h2>
    	<table>
		<tr>
			<th>등록된 이미지</th>
			<td>${memberVO.mem_img}<button type="button" onclick="">이미지제거</button></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${memberVO.mem_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memberVO.mem_name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" value="${memberVO.mem_nick}" name="nickname" id="nickname"><button id="checkBtn" type="button">닉네임중복체크</button><p id="nickInput"></p> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" value="${memberVO.mem_pw}" name="pass" id="pass"><p id="passInput"></p></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="text" value="${memberVO.mem_pw}" name="checkpass" id="checkpass"><p id="checkpassInput"></p></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="${memberVO.mem_email}" name="email" id="email"><p id="emailInput"></p></td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td><input type="text" value="${memberVO.mem_hp}" name="hp" id="hp"><p id="hpInput"></p></td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${memberVO.mem_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${memberVO.mem_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${memberVO.mem_joindate}</td>
		</tr>
		<tr>
			<th>펫 유무</th>
			<td>
				<select class="pet" name="pet" id="pet">
					<option value="네">네</option>
					<option value="아니요">아니요</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" value="${memberVO.mem_address1}" id="sample4_postcode" name="address1" readonly="readonly"> <p id="addressInput"></p> </td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type="text" value="${memberVO.mem_address2}" id="sample4_roadAddress" name="address2" readonly="readonly"></td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td><input type="text" value="${memberVO.mem_address3}" id="sample4_jibunAddress" name="address3" readonly="readonly"><span id="guide" style="color:#999; display:none;"></span></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" value="${memberVO.mem_address4}" id="sample4_detailAddress" name="address4"></td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td><input type="text" value="${memberVO.mem_address5}" id="sample4_extraAddress" name="address5" readonly="readonly"></td>
		</tr>						
	</table>
	<a href="#" id="adClick" onclick="sample4_execDaumPostcode(); return false;" style="text-decoration: none; color:black;">우편번호찾기</a>
<!-- 	<input type="submit" value="정보수정" style="float:right; position:relative; bottom:30px;"> -->
<a href="#" onclick="check(); return false;" type="button" id="update" style="text-decoration: none; color:black;">정보수정</a>
</form>
  </div>
</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

document.getElementById("adClick").addEventListener('click', () =>{
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

document.getElementById("pet").value="${memberVO.mem_pet}";


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



</script>

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

</script>

</body>
</html>