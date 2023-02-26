<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

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
    color: #ff5722;
    padding: 10px;
    border-radius: 20px;
    background: antiquewhite;
}

/*  1) 예약자 CSS 설정 */
#reservationBox {
	
	border : 1px solid red;
	
	position : relative;
	text-align :center;
	width : 100%;
	height : 1100px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 70px;
	

}

#reservationBox > #reservationFormWrapper{

	border : 1px solid blue;
	
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

 	border : 1px solid red; 
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100%;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	background : floralwhite;

}

#mem_box > #mem_title {

 	border : 1px solid #ffebcd7a; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #ffebcd7a;
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

	background : #ffebcd;
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
	background : #ffebcd7a;
	

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
	background : #ffebcd7a;
	border-radius: 5px;
	color : #ff5722b8;

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
	color : #ff5722b8;

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

	background : #ffebcd;
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
	background : #ffebcd7a;


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
	background : #ffebcd7a;
	

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

	border : 1px solid blue;
	
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

	border : 1px solid blue;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 315px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	float : left;
	background : floralwhite;

}

#pet_box > #mem_title {

 	border : 1px solid #ffebcd7a; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #ffebcd7a;
	border-radius: 5px;

}

#pet_box > #pet_img_box {

	border : 1px solid floralwhite;
	
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

	border : 1px solid floralwhite;
	
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
	background : #ffebcd7a;
	border-radius: 5px;
	color : #ff572285;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;


}

#pet_img {

	border : 1px solid floralwhite;
	
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

	border : 1px solid floralwhite;
	
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

	border : 1px solid floralwhite;
	
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
	background : #ffebcd7a;
	border-radius: 5px;
	color : #ff572285;
	padding : 5px;
	font-weight : bold;
	text-decoration: none;

}

#pet_box > #pet_info_box > a > input {

	border : 1px solid floralwhite;
	
	position :relative;
	text-align :center;
	width : 100%;
	height : 40px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 70px;
	border-radius : 15px;
	

}

#pet_box > #pet_op_box {

	border : 1px solid floralwhite;
	
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

	border : 1px solid floralwhite;
	
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
	background : #ffebcd7a;
	border-radius: 5px;
	color : #ff572285;
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
	font-size : 15px;
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

    border: 1px solid floralwhite;
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

	border : 1px solid floralwhite;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 350px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}

#reservation_result_box {

	border : 1px solid green;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100%;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	background : floralwhite;

}

#reservation_result_box > #mem_title {

 	border : 1px solid #ffebcd7a; 
	
	position :relative;
	text-align :center;
	width : 1197px;
	height : 70px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	color : #ff5722;
	background : #ffebcd7a;
	border-radius: 5px;

}


/*  4) 버튼 CSS 설정 */
#reservationBox > #reservationBtnWrapper{

	border : 1px solid black;
	
	position :relative;
	text-align :center;
	width : 1200px;
	height : 100px;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;

}






</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<form action="<%=contextPath%>/nbMember/eduOrder.me" class="form">	
	<div id = "reservationBox" >
		<div id = "reservationFormWrapper">
			<div id = "mem_box">
				<div id = "mem_title">
					<h3 id="h3title">- 예약 회원 정보 -</h3>
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
					<h3 id="h3title">- 회원 반려견 정보 -</h3>
				</div>
				<div id = "pet_img_box">
					<a id="pet_img_name" type= "text">반려견 사진<img src="<%=request.getContextPath()%>/nbShop/img/bori.png" id = "pet_img" name = "pet_img"  /></a>
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" placeholder="반려견이름" readonly />
						<label id ="pet_input">강아지이름을 입력해주세요!</label>
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" placeholder="반려견종" readonly />
						<label id ="pet_input">품종 또는 믹스 등등</label>
					</a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text" placeholder="반려견나이" readonly />
						<label id ="pet_input">숫자로 입력해주세요 !</label>
					</a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" placeholder="반려견몸무게" readonly />
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
				<a><input id ="tr_mem_name" name = "tr_mem_name" type="text" placeholder="담당트레이너이름" readonly /></a>
				<a><input id ="tr_mem_hp" name = "tr_mem_hp" type="text" placeholder="담당트레이너전화번호" readonly /></a>
				<a><input id ="tr_reg_date" name = "tr_reg_date" type="text" placeholder="수강신청일자" readonly /></a>
				<a><input id ="tr_date1" name = "tr_date1" type="text" placeholder="첫번째예약일" readonly /></a>
				<a><input id ="tr_date2" name = "tr_date2" type="text" placeholder="두번째예약일" readonly /></a>
				<a><input id ="tr_date3" name = "tr_date3" type="text" placeholder="세번째예약일" readonly /></a>
				<a><input id ="tr_date4" name = "tr_date4" type="text" placeholder="네번째예약일" readonly /></a>
				<a><input id ="tr_date5" name = "tr_date5" type="text" placeholder="다섯번째예약일" readonly /></a>
				<a><input id ="tr_date6" name = "tr_date6" type="text" placeholder="여섯번째예약일" readonly /></a>
				<a><input id ="tr_date7" name = "tr_date7" type="text" placeholder="일곱번째예약일" readonly /></a>
				<a><input id ="edu_pet_name" name ="edu_pet_name" type="text" placeholder="예약요청한반려견" readonly /></a>
				<a><input id = "edu_pet_img" name = "edu_pet_img" type="text" placeholder="예약요청한반려견사진" readonly /></a>
				<a><input id = "totalcnt" name ="totalcnt" type="text" placeholder="수강 횟수" readonly /></a>
				<a><input id = "tr_totalprice" name ="tr_price" type ="text" placeholder="총 수강 금액" readonly /></a>
			</div>
		</div>
		<div id ="reservationBtnWrapper">
			<div>
				<a id ="back" class = btn href="#">일정 다시선택하기 </a>
				<a type="submit" class = "btn">예약 확정</a>
				<a class= "btn">늘봄 샵으로</a>
			</div>
		</div>
	</div>
</form>
	 <br>
	 <br>
<script>
	
	// jquery 호출 옵션 
	$(document).ready(function(){
		
		// id 값이 back인 버튼을 클릭했을 때
		$("#back").on("click", function(){
			
			 // 이전 페이지로 이동하게 한다.
			 history.back();
		})

	})
	
</script>
</body>
</html>