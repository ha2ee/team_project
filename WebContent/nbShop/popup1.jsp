<%@page import="VO.PetVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<%
	request.setCharacterEncoding("UTF-8");

	

	// 1) 수강 데이터
	// 예약일 가져와서 변수에 저장
	String tr_date1 = request.getParameter("date1");
	String tr_date2 = request.getParameter("date2");
	String tr_date3 = request.getParameter("date3");
	String tr_date4 = request.getParameter("date4");
	String tr_date5 = request.getParameter("date5");
	String tr_date6 = request.getParameter("date6");
	String tr_date7 = request.getParameter("date7");
	// 총 수강 횟수 가져와서 변수에 저장
	String totalcnt = request.getParameter("totalcnt");
	// 총 수강 금액 가져와서 변수에 저장
	String tr_totalprice = request.getParameter("totalprice");
	// 선택 된 트레이너 가져와서 변수에 저장
	String tr_mem_name = request.getParameter("tr_name");
	// 선택 된 트레이너의 금액을 가져와서 변수에 저장
	String tr_price = request.getParameter("tr_price");
	
	// 예약 작성일 가져와서 변수에 저장
	String tr_mem_reg_date = request.getParameter("tr_mem_reg_date");
	// 한글버젼으로 된 예약일을 가져와서 변수에 저장
	String tr_reg_date = request.getParameter("reg_date");


%>
<!DOCTYPE html>
<head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--     CSS popup1.css 추가 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/popup1.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>반려견 정보 조회창</title>

<script>

	// jquery 호출 옵션 
	$(document).ready(function(){
		
	<c:set var="vector" value="${vector}" />
	
	
	// 정보를 가져올 반려견이 없을 경우	
	<c:if test="${vector.isEmpty()}">
		alert("등록하신 반려견이 없습니다");
		if(window.confirm("반려견 정보를 등록하러 가시겠습니까?")){
			
			opener.location.href="<%=request.getContextPath()%>/member/petJoin.me";
			window.close();
			
		}else{
			
			alert("반려견 정보가 있어야 수강 신청이 가능합니다");
			alert("마이페이지->반려동물 정보관리에서 추가해주세요!");
			window.close();
		}
		$("#pet_box > div").css("display", "none");

	</c:if>
	
	
// 	새창을 닫을 때 부모창에 반려견 정보를 내보낸다.
// 	$("#submitbtn").on("click", function(){

// 	})
	
});

</script>
</head>
<body class="dimmed">
<form method = "post" action ="" >
	
<!-- 	edu_reservation에서 가져온 값들을 다시 넘겨 주기 -->
	<input type="hidden" name ="date1" value="<%=tr_date1 %>" />
	<input type="hidden" name ="date2" value="<%=tr_date2 %>" />
	<input type="hidden" name ="date3" value="<%=tr_date3 %>" />
	<input type="hidden" name ="date4" value="<%=tr_date4 %>" />
	<input type="hidden" name ="date5" value="<%=tr_date5 %>" />
	<input type="hidden" name ="date6" value="<%=tr_date6 %>" />
	<input type="hidden" name ="date7" value="<%=tr_date7 %>" />
	<input type="hidden" name ="totalcnt" value="<%=totalcnt %>" />
	<input type="hidden" name ="totalprice" value="<%=tr_totalprice %>" />
	<input type="hidden" name ="tr_name" value="<%=tr_mem_name %>" />
	<input type="hidden" name ="tr_price" value="<%=tr_price %>" />
	
<!-- 	반려견 정보 input에 담아서 부모창으로 전달하기 -->
	
	<input type="hidden" id ="petName" value="" />
	<input type="hidden" id ="petType" value="" />
	<input type="hidden" id ="petAge" value="" />
	<input type="hidden" id ="petWeight" value="" />
	<input type="hidden" id ="petImg" value="" />
	<input type="hidden" id ="petGender" value="" />	
	<input type="hidden" id ="petOp" value="" />	
		
	
    <div class="pop1">
        <div class="pop1title">반려견 정보 조회창</div>
        <div class="pop1content">
     
		
			<div id = "pet_box">

				<div id = "pet_name_box">
					<a id="pet_select" type= "text">선택</a>
					<a id="pet_img_name" type= "text">반려견 사진</a>
					<a type= "text">이름</a>
					<a type= "text">견종</a>
					<a type= "text">나이</a>
					<a type= "text">몸무게</a>
					<a type= "text">성별</a>
					<a type= "text">중성화여부</a>
				</div>
		<c:set var="j" value="1" />
		<c:forEach var="vo" items="${vector}">
				<div id = "pet_info_box">
					<input class = "pet_chk" onclick="checkOnlyOne(this)" id="pet_chk" name= "pet_chk" type="checkbox" value="${vo.p_name}" />
					<img id = "pet_img" name = "pet_img${j}" src="<%=request.getContextPath()%>/nbShop/img/${vo.p_img}" />
					<input id = "pet_name" name = "pet_name${j}" type="text" value="${vo.p_name}" readonly />
					<input id = "pet_type" name = "pet_type${j}" type="text" value="${vo.p_type}" readonly />
					<input id = "pet_age" name = "pet_age${j}" type="text"  value="${vo.p_age}"  readonly />
					<input id = "pet_weight" name = "pet_weight${j}" type="text" value="${vo.p_weight}"  readonly />
					<input id="pet_gender" name= "pet_gender${j}" type="text" value="${vo.p_gender}"  readonly />
					<input id="pet_op" name= "pet_op${j}" type="text" value="${vo.p_op}" readonly />
				</div>

			<c:set var="j" value="${j+1}" /> 
			</c:forEach>
			</div>
        </div>
        <div class="pop1cmd">

            <input onclick="returnPet()" id="submitbtn" type="button" name="btnclose" class="popbtn" value="반려견 선택 완료">
        </div>
    </div>
</form>

<script>

function checkOnlyOne(chk){

	var chks = document.getElementsByName("pet_chk");
	
	for(var i=0; i<chks.length; i++){
		
		if(chks[i] != chk){
			
			chks[i].checked = false;
		}
	}
}

function returnPet(){
	
	var chkpet =  $(".pet_chk").is(":checked");
	var obj_length = document.getElementsByName("pet_chk").length;
	
		for(var i=0; i<obj_length; i++){
			if(document.getElementsByName("pet_chk")[i].checked == true){
				var chkpet2 = document.getElementsByClassName("pet_chk")[i].value;
			}
		}
		console.log(chkpet2);
	
	if(chkpet == false){
	   alert("반려견을 선택해주세요");
	   
	}
	
	var arr = new Array();
	
	<c:forEach items="${vector}" var="v" >
	
	arr.push({ p_name : "${v.p_name}",
			  	p_img : "${v.p_img}",
			 	p_weight : "${v.p_weight}",
			 	p_op		: "${v.p_op}",
			 	p_gender : "${v.p_gender}",
			 	p_age		: "${v.p_age}",
			 	p_type 	: "${v.p_type}"});
	</c:forEach>

	console.log(arr);
		
	function ispet(element){
		if(element.p_name === chkpet2){
			return true;
		}
	}
	
	var pet = arr.find(ispet);
	console.log(pet);
	
	// 배열에서 꺼내서 각 변수에 저장
    var petname = pet.p_name;
	var pettype = pet.p_type;
	var petage = pet.p_age;
	var petweight = pet.p_weight;
	var petgender = pet.p_gender;
	var petop = pet.p_op;
	var petimg = pet.p_img;
	

	// 각 변수의 값을 input에다가 저장 시킨다.
	document.getElementById("petName").value = petname;
	document.getElementById("petType").value = pettype;
	document.getElementById("petImg").src = "${contextPath}/nbShop/img/"+petimg;
	document.getElementById("petAge").value = petage;
	document.getElementById("petWeight").value = petweight;
	document.getElementById("petGender").value = petgender;
	document.getElementById("petOp").value = petop;


	// 부모창의 Id값을 가져와서 현재창의 Value 값을 전달한다.
	opener.document.getElementById("pet_name").value = document.getElementById("petName").value;
	opener.document.getElementById("edu_img_name").value = document.getElementById("petName").value;
	opener.document.getElementById("pet_type").value = document.getElementById("petType").value;
	opener.document.getElementById("pet_age").value = document.getElementById("petAge").value;
	opener.document.getElementById("pet_weight").value = document.getElementById("petWeight").value;
	
	
	// 성별 정보는 checked 타입으로 전달한다.
	if(document.getElementById("petGender").value == "남"){
		
		opener.document.getElementById("pet_gender1").checked = true;
	
	}else{
		
		opener.document.getElementById("pet_gender2").checked = true;
		
	}
	
	// 중성화 정보도 checked 타입으로 전달한다.
	if(document.getElementById("petOp").value == "예"){
		
		opener.document.getElementById("pet_op1").checked = true;
	
	}else if(document.getElementById("pet_op").value == "아니오"){
		
		opener.document.getElementById("pet_op2").checked = true;
		
	}else{
		
		opener.document.getElementById("pet_op3").checked = true;
		
	}
	
	// 부모창의 예약하기 버튼을 보이게 하고 , 최종 예약정보의 사진도 바꿔준다.
	opener.document.getElementById("nb_submitbtn").style.display = "block";
	opener.document.getElementById("pet_edu_img").value = "${contextPath}/nbShop/img/"+petimg;

		alert(petname+" 의 정보 불러오기 완료!");
		
		window.close();

}

</script>
</body>
</html>