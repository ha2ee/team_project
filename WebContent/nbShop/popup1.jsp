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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펫 정보 입력하기</title>
    
<!--     CSS popup1.css 추가 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/popup.css">
</head>
<body class="dimmed">
<form method = "post" action ="<%=request.getContextPath()%>/nbOrder/petUpdate.od" >
	
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
        <div class="pop1title">펫 정보 입력창</div>
        <div class="pop1content">
			<div id = "pet_box">
				<div id = "pet_name_box">
					<a id="pet_img_name" type= "text">반려견 사진</a>
				</div>
				<div id= "pet_img_box" >
						<img id="pet_img"  src="<%=request.getContextPath()%>/images/example.png" />
				</div>
				<div id= "pet_img_file_box">
					이미지 파일 선택
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" value="" placeholder="반려견이름" />
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" value="" placeholder="반려견종"  />
					<label style="color : #9e9e9ead;">ex) 푸들,믹스 등등..</label></a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text"  value="" placeholder="반려견나이"  />
					<label style="color : #9e9e9ead;">숫자만 입력</label></a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" value="" placeholder="반려견몸무게"  />
					<label style="color : #9e9e9ead;">숫자만 입력</label></a>
				</div>
			</div>
        </div>
        <div class="pop1cmd">
            <input id="submitbtn" type="submit" name="btnclose" class="popbtn" value="펫 정보 입력 완료">
        </div>
    </div>
</form>

</body>
</html>