<%@page import="VO.PetVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>반려견 정보 조회창</title>

<script>

	// jquery 호출 옵션 
	$(document).ready(function(){
	

	
	
	// 새창을 닫을 때 자식창의 반려견 정보를 내보낸다.
	$("#submitbtn").on("click", function(){
		
		// 기본 정보
		opener.document.getElementById("pet_img").src = document.getElementById("pet_img").src;
		opener.document.getElementById("edu_img").src = document.getElementById("pet_img").src;
		opener.document.getElementById("pet_name").value = document.getElementById("pet_name").value;
		opener.document.getElementById("edu_img_name").value = document.getElementById("pet_name").value;
		opener.document.getElementById("pet_type").value = document.getElementById("pet_type").value;
		opener.document.getElementById("pet_age").value = document.getElementById("pet_age").value;
		opener.document.getElementById("pet_weight").value = document.getElementById("pet_weight").value;
		
		// 성별 정보 
		if(document.getElementById("pet_gender").value == "남"){
			
			opener.document.getElementById("pet_gender1").checked = true;
		
		}else{
			
			opener.document.getElementById("pet_gender2").checked = true;
			
		}
		
		// 중성화 정보
		if(document.getElementById("pet_op").value == "예"){
			
			opener.document.getElementById("pet_op1").checked = true;
		
		}else if(document.getElementById("pet_op").value == "아니오"){
			
			opener.document.getElementById("pet_op2").checked = true;
			
		}else{
			
			opener.document.getElementById("pet_op3").checked = true;
			
		}

			alert('"반려견"의 정보 입력 완료!');
		
	})
	
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
		
	
    <div class="pop1">
        <div class="pop1title">반려견 정보 입력창</div>
        <div class="pop1content">
			<div id = "pet_box">
				<div id = "pet_name_box">
					<a id="pet_img_name" type= "text">반려견 사진</a>
				</div>
				<div id= "pet_img_box" >
						<a type= "text"><img id = "pet_img" name = "pet_img"  /></a>
				</div>
				<div id = "pet_info_box">
					<a type= "text">이름<input id = "pet_name" name = "pet_name" type="text" value=""  /></a>
					<a type= "text">견종<input id = "pet_type" name = "pet_type" type="text" value=""  /></a>
					<a type= "text">나이<input id = "pet_age" name = "pet_age" type="text"  value=""   /></a>
					<a type= "text">몸무게<input id = "pet_weight" name = "pet_weight" type="text" value=""   /></a>
					<a type= "text">성별<input id="pet_gender" name= "pet_gender" type="text" value=""   /></a>
					<a type= "text">중성화여부<input id="pet_op" name= "pet_op" type="text" value=""  /></a>
				</div>
			</div>
        </div>
        <div class="pop1cmd">
        	
            <input onclick="window.close();" id="submitbtn" type="submit" name="btnclose" class="popbtn" value="반려견 선택 완료">
        </div>
    </div>
</form>

</body>
</html>