<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 예약일 가져와서 변수에 저장
	String tr_date1 = request.getParameter("date1");
	String tr_date2 = request.getParameter("date2");
	String tr_date3 = request.getParameter("date3");
	String tr_date4 = request.getParameter("date4");
	String tr_date5 = request.getParameter("date5");
	String tr_date6 = request.getParameter("date6");
	String tr_date7 = request.getParameter("date7");
	
	// 총 수강 횟수 가져와서 변수에 저장
	int totalcnt = Integer.parseInt(request.getParameter("totalcnt"));
	
	// 총 수강 금액 가져와서 변수에 저장
	int tr_totalprice = Integer.parseInt(request.getParameter("totalprice"));
	
	// 선택 된 트레이너 가져와서 변수에 저장
	String tr_mem_name = request.getParameter("tr_name");
	
	// 예약 작성일 가져와서 변수에 저장
	String tr_mem_reg_date = request.getParameter("tr_mem_reg_date");
	String tr_reg_date = request.getParameter("reg_date");


%>    
    
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

/*  예약 신청화면 CSS 설정 */

#h3title{

    width: 250px;
    height: 50px;
    font-size: 24px;
    position: relative;
    left: 0;
    right: 0;
    top: 10px;
    margin: 0 auto;
    color: #ff191966;
    padding: 10px;
    border-radius: 20px;
    background: #f2dede6b;
}

/*  1) 예약자 CSS 설정 */
#reservationBox {
	
	border : 1px solid #fff5f373;
	
	position : relative;
	text-align :center;
	width : 100%;
	height : 1000px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 70px;
	

}

#reservationBox > #reservationFormWrapper{

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 250px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}

#mem_box {

 	border : 1px solid #fff5f373; 
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100%;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	background : #fff5f373;

}

#mem_box > #mem_title {

 	border : 1px solid #fff5f3; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #fff5f3;
	border-radius: 5px;

}



#mem_box > #member_check{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 35px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	border-radius: 5px;

}

#mem_box > #member_check > #membercheck {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 130px;
	height : 30px;
	margin : 0 auto;
	left : 500px;
	right : 0;
	top : 6px;
	background : aliceblue;
	border-radius: 10px;
	transition : all 0.5s;
	font-weight : bold;
	color : #ff5722;
	

}

#mem_box > #member_check > #membercheck:hover {

	background : #fff5f3;
	border-radius: 15px;
	transition : all 0.5s;
	
}

#mem_box > #memData {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 35px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 5px;
	float : left;
	border-radius: 5px;
	background : #fff5f3;
	

}



#mem_box > #memData > a{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 24%;
	height : 30px;
	margin : 0 5px;
	left : 0;
	right : 0;
	top : 1px;
	float : left;
	font-size : 15px;
	font-weight : bold;
	text-decoration: none;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;

}

#mem_box > #memData > a > input {

	border : 1px solid aliceblue; 
	
	position :relative;
	text-align :center;
	width : 170px;
	height : 93%;
	margin : 0 10px;
	left : 0;
	right : 0;
	top : 1px;
	font-weight : normal;
	border-radius: 5px;
	


}

#memAddress > #address_check{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :left;
	width : 1200px;
	height : 35px;
	margin : 0 auto;
	left : -2px;
	right : 0;
	top : 1px;
	font-weight : bold;
	color : #ff572282;

}

#memAddress > #address_check > #addresscheck {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 130px;
	height : 30px;
	margin : 0 auto;
	left : 971px;
	right : 0;
	top : 2px;
	background : aliceblue;
	border-radius: 10px;
	transition : all 0.5s;
	font-weight : bold;
	color : #ff5722;
	

}

#memAddress > #address_check > #addresscheck:hover {

	background : #fff5f3;
	border-radius: 15px;
	transition : all 0.5s;
	
}

#mem_box > #memAddress {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 80px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 20px;
	float : left;
	border-radius: 5px;
	

}


#mem_address {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 40px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 2px;
	float : left;
	border-radius: 5px;
	background : #fff5f3;


}

#mem_address > a{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 19%;
	height : 35px;
	margin : 0 5px;
	left : 0;
	right : 0;
	top : 2px;
	float : left;
	border-radius: 10px;
	font-size : 15px;
	font-weight : bold;
	text-decoration: none;
	background : #fff5f3;
	

}

#mem_address > a > input {

	border : 1px solid aliceblue; 
	
	position :relative;
	text-align :center;
	width : 90%;
	height : 25px;
	margin : 0 10px;
	left : 0;
	right : 0;
	top : 4px;
	font-weight : normal;
	border-radius: 5px;


}

/*  2) 예약자 반려견 설정 */
#reservationBox > #reservationPetFormWrapper{

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 310px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}

#pet_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 315px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	float : left;
	background : #fff5f373;

}

#pet_box > #mem_title {

 	border : 1px solid #fff5f3; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #fff5f3;
	border-radius: 5px;

}

#pet_box > #pet_img_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 250px;
	height : 240px;
	margin : 0 auto;
	left : -474px;
	right : 0;
	top : 0;

}

#pet_img_name {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 100%;
	height : 35px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;


}

#pet_img {

	border : 1px solid #fff5f373;
	
	vertical-align : middle;
	position :relative;
	text-align :center;
	width : 200px;
	height : 200px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 4px;
	padding : 10px;
	border-radius: 100px;

}

#pet_box > #pet_info_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 820px;
	height : 240px;
	margin : 0 auto;
	left : 65px;
	right : 0;
	top : -240px;

}

#pet_box > #pet_info_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 163px;
	height : 35px;
	margin : 0 auto;
	left : -6px;
	right : 0;
	top : 0;
	float : left;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#pet_box > #pet_info_box > a > input {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 40px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 70px;
	border-radius : 15px;
	color : royalblue;
	

}

#pet_box > #pet_op_box {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 133px;
	height : 240px;
	margin : 0 auto;
	left : 533px;
	right : 0;
	top : -480px;

}

#pet_box > #pet_op_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 133px;
	height : 35px;
	margin : 0 auto;
	left : -1px;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;
	

}

#radio{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :left;
	width : 100px;
	height : 70px;
	margin : 10px auto;
	left : 319px;
	right : 0;
	top : 50px;
	font-size : 17px;
	font-weight : bold;
	color:gray;

}


#radio > input {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 50px;
	height : 17px;
	margin : 5px auto;
	left : 0px;
	right : 0;
	top : 3px;

}

#radio2{

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :left;
	width : 70%;
	height : 50px;
	margin : 10px auto;
	left : 0px;
	right : 0;
	top : 10px;
	font-size : 15px;
	font-weight : bold;
	color:gray;

}


#radio2 > input {

/* 	border : 1px solid red; */
	
	position :relative;
	text-align :center;
	width : 40px;
	height : 17px;
	margin : 5px auto;
	left : 0px;
	right : 0;
	top : 3px;

}


#pet_input {

    border: 1px solid #fff5f373;
    position: relative;
    text-align: center;
    width: 100%;
    height: 20px;
    height: 20px;
    margin: 0 auto 0 auto;
    left: 0;
    right: 0;
    top: 100px;
    font-weight: 100;
    font-size: 11px;
    padding: 1px;
    color: darkgray;
}

/* 3) 예약 확인 설정 */

#reservationBox > #reservationResultWrapper{

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 315px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}

#reservation_result_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100%;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	background : #fff5f373;

}

#reservation_result_box > #mem_title {

 	border : 1px solid #fff5f3; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #fff5f3;
	border-radius: 5px;

}

/* 결과화면 CSS 설정 */

#tr_img_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 250px;
	height : 240px;
	margin : 0 auto;
	left : -474px;
	right : 0;
	top : 0;

}

#tr_img_name {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 100%;
	height : 35px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;


}

#tr_img {

	border : 1px solid #fff5f373;
	
	vertical-align : middle;
	position :relative;
	text-align :center;
	width : 200px;
	height : 200px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 4px;
	padding : 10px;
	border-radius: 100px;

}


#tr_info_box {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 160px;
	height : 240px;
	margin : 0 auto;
	left : -263px;
	right : 0;
	top : -240px;

}

#tr_info_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 158px;
	height : 35px;
	margin : 45px auto;
	left : 0;
	right : 0;
	top : -45px;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#tr_info_box > a > input {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 30px;
	margin : 40px auto;
	left : 0;
	right : 0;
	top : -29px;
	border-radius : 15px;
	

}




#tr_date_box {

    border: 1px solid #fff5f373;
    
    position: relative;
    text-align: center;
    width: 160px;
    height: 240px;
    margin: 0 auto;
    left: -96px;
    right: 0;
    top: -480px;
}

#tr_date_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 158px;
	height : 35px;
	margin : 0px auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#tr_date_box > input {

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 140px;
	height : 25px;
	margin : 2px auto;
	left : 1px;
	right : 0;
	top : 0;
	border-radius : 15px;
	color : steelblue;
	

}


 #edu_img_box {
 
	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 250px;
	height : 240px;
	margin : 0 auto;
	left : 115px;
	right : 0;
	top : -720px;

}

#edu_img_name {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 100%;
	height : 35px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;


}

#edu_img {

	border : 1px solid #fff5f373;
	
	vertical-align : middle;
	position :relative;
	text-align :center;
	width : 200px;
	height : 200px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 4px;
	padding : 10px;
	border-radius: 100px;

}


#tr_result_box {

    border: 1px solid #fff5f373;
    
    position: relative;
    text-align: center;
    width: 330px;
    height: 240px;
    margin: 0 auto;
    left: 411px;
    right: 0;
    top: -960px;
}

#tr_result_box > #tr_totalcnt_box {

    border: 1px solid #fff5f373;
    
    position: relative;
    text-align: center;
    width: 160px;
    height: 240px;
    margin: 0 auto;
    left: -84px;
    right: 0;
    top: 0;

}

#tr_totalcnt_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 158px;
	height : 35px;
	margin : 0px auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#tr_totalcnt_box > a > input {

	border: 1px solid #fff5f373;
	
    position: relative;
    text-align: center;
    width: 80%;
    height: 40px;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 70px;
    border-radius: 15px;
    color: royalblue;

}


#tr_result_box > #tr_totalprice_box {

    border: 1px solid #fff5f373;
    
    position: relative;
    text-align: center;
    width: 160px;
    height: 240px;
    margin: 0 auto;
    left: 86px;
    right: 0;
    top: -240px;

}

#tr_totalprice_box > a {

	border : 1px solid #fff5f373;
	
	display : block;
	position :relative;
	text-align :center;
	width : 158px;
	height : 35px;
	margin : 0px auto;
	left : 0;
	right : 0;
	top : 0;
	font-size : 18px;
	background : #fff5f3;
	border-radius: 5px;
	color : #ff572282;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#tr_totalprice_box > a > input {

	border: 1px solid #fff5f373;
	
    position: relative;
    text-align: center;
    width: 80%;
    height: 40px;
    margin: 0 auto;
    left: 0;
    right: 0;
    top: 70px;
    border-radius: 15px;
    color: royalblue;

}

/*  4) 버튼 CSS 설정 */
#reservationBox > #reservationBtnWrapper{

	border : 1px solid #fff5f373;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}

#nb_backbtn {

    /* border: 1px solid red; */
    
    position: relative;
    text-align: center;
    width: 220px;
    height: 50px;
    margin: 0 auto;
    left: -50px;
    right: 0;
    top: 20px;
    background : #cccccc21;
    border-radius: 10px;
    transition: all 0.5s;
    color: black;
    font-size : 22px;

}

#nb_backbtn:hover {

	background : #fff5f3;
	border-radius: 20px;
	transition : all 0.5s;

}

#nb_submitbtn {

    /* border: 1px solid red; */
    
    position: relative;
    text-align: center;
    width: 130px;
    height: 50px;
    margin: 0 auto;
    left: -30px;
    right: 0;
    top: 20px;
    background : #cccccc21;
    border-radius: 10px;
    transition: all 0.5s;
    color: black;
    font-size : 22px;
	
}

#nb_submitbtn:hover {

	background : #fff5f3;
	border-radius: 20px;
	transition : all 0.5s;

}

#nb_shopbtn {

    /* border: 1px solid red; */
    
    position: relative;
    text-align: center;
    width: 150px;
    height: 50px;
    margin: 0 auto;
    left: -10px;
    right: 0;
    top: 20px;
    background : #cccccc21;
    border-radius: 10px;
    transition: all 0.5s;
    color: black;
    font-size : 22px;

}

#nb_shopbtn:hover {

	background : #fff5f3;
	border-radius: 20px;
	transition : all 0.5s;

}

</style>
<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>






	<!-- 	주문예약 들어갈 항목 -->
	
<!-- 	내용을 입력하고 예약확정 버튼을 눌렀을 때 /nbMemberCotroller/eduOrder.me 호출 -->
	<form method = "post" action="<%=contextPath%>/nbMember/eduOrder.me" id="form">	
	<div id = "reservationBox" >
		<div id = "reservationFormWrapper">
			<div id = "mem_box">
				<div id = "mem_title">
					<h3 id="h3title">- 회원 예약 정보 -</h3>
				</div>
				<div id = "member_check">
					<a id ="membercheck" class = btn href="#">내정보 수정하기</a>
				</div>
				<div id = "memData">
					<a type="text">아이디<input id = "mem_id" name = "mem_id" type="text" placeholder="회원아이디" readonly /></a>
					<a type="text">이름<input id = "mem_name" name = "mem_name" type="text" placeholder="회원이름" readonly /></a>
					<a type="text">&nbsp;&nbsp;전화번호<input id = "mem_hp" name = "mem_hp" type="text" placeholder= "회원전화번호" readonly /></a>
					<a type="text">이메일<input id = "mem_email" name = "mem_email" type="text" placeholder= "회원이메일" readonly /></a>
				</div>
				<div id = "memAddress">
					<div id = "address_check">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소<a id ="addresscheck" class = btn href="#">우편번호 찾기</a>
					</div>
					<div id = "mem_address">
						<a type="text"><input id = "mem_address1" name = "mem_address1" type ="text" placeholder= "우편번호" readonly /></a>
						<a type="text"><input id = "mem_address2" name = "mem_address2" type ="text" placeholder= "도로명주소" readonly /></a>
						<a type="text"><input id = "mem_address3" name = "mem_address3" type ="text" placeholder= "지번주소" readonly /></a>
						<a type="text"><input id = "mem_address4" name = "mem_address4" type ="text" placeholder= "상세주소" readonly /></a>
						<a type="text"><input id = "mem_address5" name = "mem_address5" type ="text" placeholder= "참고항목" readonly /></a>
					</div>	
				</div>
			</div>
		</div>
		<div id = "reservationPetFormWrapper">
			<div id = "pet_box">
				<div id = "mem_title">
					<h3 id="h3title">- 반려견 예약 정보 -</h3>
				</div>
				<div id = "pet_img_box">
					<a id="pet_img_name" type= "text">반려견 사진<img src="<%=request.getContextPath()%>/nbShop/img/bori.png" id = "pet_img" name = "pet_img"  /></a>
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" placeholder="반려견이름"  />
						<label id ="pet_input">강아지이름을 입력해주세요!</label>
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" placeholder="반려견종"  />
						<label id ="pet_input">품종 또는 믹스 등등</label>
					</a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text" placeholder="반려견나이"  />
						<label id ="pet_input">숫자로 입력해주세요 !</label>
					</a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" placeholder="반려견몸무게"  />
						<label id ="pet_input">숫자로 입력해주세요 !</label>
					</a>
					<a type= "text">반려견 성별</a>
					<div id="radio">					
						<input type="radio" name="pet_gender" value="남" />남
					</div>
					<div id="radio" >
						<input type="radio" name="pet_gender" value="여" />여
					</div>
				</div>
				<div id ="pet_op_box">
					<a type= "text">중성화 여부</a>
					<div id="radio2">					
						<input type="radio" name="pet_op" value="예" />예
					</div>
					<div id="radio2" >
						<input type="radio" name="pet_op" value="아니오" />아니오
					</div>
					<div id="radio2" >	
						<input type="radio" name="pet_op" value="모름"/>모름
					</div>
				</div>
			</div>	
		</div>
		<div id = "reservationResultWrapper">
			<div id = "reservation_result_box">
				<div id = "mem_title">
					<h3 id="h3title">- 최종 예약 확인 -</h3>
				</div>
				<div id = "tr_img_box">
					<a id="tr_img_name" type= "text">트레이너 사진<img src="<%=request.getContextPath()%>/nbShop/img/trainer5.png" id = "tr_img" name = "tr_img"  /></a>
				</div>
				
				<div id = "tr_info_box">
					<a id="tr_mem_name">담당 훈련사<input style="color : royalblue; " id ="tr_mem_name" name = "tr_mem_name" type="text" placeholder="훈련사이름" value="<%=tr_mem_name%>" readonly /></a>
					<a id="tr_mem_hp">전화번호<input id ="tr_mem_hp" name = "tr_mem_hp" type="text" placeholder="전화번호" readonly /></a>
					<a id="tr_mem_reg_date">예약신청일<input style="color : royalblue; " id ="tr_reg_date" name = "tr_reg_date" type="text" placeholder="수강신청일자" value="<%=tr_reg_date%>" readonly /></a>
					<input type="hidden" id="tr_mem_reg_date" name=  "tr_mem_reg_date" value = "<%=tr_mem_reg_date%>" />
				</div>
				<div id = "tr_date_box">
					<a id= "tr_date_title">수강예약일</a>
					<input id ="tr_date1" name = "tr_date1" type="text" placeholder="첫번째 예약일" value="<%=tr_date1%>" readonly />
					<input id ="tr_date2" name = "tr_date2" type="text" placeholder="두번째 예약일" value="<%=tr_date2%>" readonly />
					<input id ="tr_date3" name = "tr_date3" type="text" placeholder="세번째 예약일" value="<%=tr_date3%>"  readonly />
					<input id ="tr_date4" name = "tr_date4" type="text" placeholder="네번째 예약일" value="<%=tr_date4%>"  readonly />
					<input id ="tr_date5" name = "tr_date5" type="text" placeholder="다섯번째 예약일" value="<%=tr_date5%>"  readonly />
					<input id ="tr_date6" name = "tr_date6" type="text" placeholder="여섯번째 예약일" value="<%=tr_date6%>"  readonly />
					<input id ="tr_date7" name = "tr_date7" type="text" placeholder="일곱번째 예약일" value="<%=tr_date7%>"  readonly />
				</div>
				<div id = "edu_img_box">
					<a id="edu_img_name" type= "text">예약한 반려견이름<img src="<%=request.getContextPath()%>/nbShop/img/bori.png" id = "edu_img"  /></a>
				</div>
				<div id =  "tr_result_box">
					<div id = "tr_totalcnt_box">
						<a>수강 횟수<input id = "totalcnt" name ="totalcnt" type="text" placeholder="수강 횟수" value = "<%=totalcnt%>" readonly /></a>
					</div>
					<div id = "tr_totalprice_box">
						<a>총 수강 금액<input id = "tr_totalprice" name ="tr_price" type ="text" placeholder="총 수강 금액" value = "<%=tr_totalprice%>" readonly /></a>
					</div>
				</div>
			</div>
		</div>
		<div id ="reservationBtnWrapper">
			<div>
				<a id ="nb_backbtn" class = btn href="#">일정 다시선택하기 </a>
				<a id = "nb_submitbtn" type="submit" class = "btn"  onclick="document.getElementById('form').submit();" >예약 확정</a>
				<a id = "nb_shopbtn" class= "btn" href="<%=request.getContextPath()%>/nb/pet.shop?center=/nbShop/pet.jsp">늘봄 샵으로</a>
			</div>
		</div>
	</div>
	 <br>
	 <br>
<script type="text/javascript">
	
	// jquery 호출 옵션 
	$(document).ready(function(){
        
		// id 값이 back인 버튼을 클릭했을 때
		$("#nb_backbtn").on("click", function(){
			
			 // 이전 페이지로 이동하게 한다.
			 history.back();
			 
		});

	});

</script>
</form>
</body>
</html>