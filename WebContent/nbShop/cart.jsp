<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="VO.eduOrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	//Session내장객체 메모리 영역에 session값 얻기
	String id_ = (String)session.getAttribute("id");
	
	out.print(id_);
	
	// 팝업창이 띄워지면서 가지고 오는 펫 정보를 변수에 저장해놓는다
	eduOrderVo eduordervo = (eduOrderVo)request.getAttribute("eduordervo");
	
	int edu_num = eduordervo.getEdu_num();
	String edu_id = eduordervo.getEdu_id();
	String edu_name = eduordervo.getEdu_name();
	String edu_hp = eduordervo.getEdu_hp();
	String edu_email = eduordervo.getEdu_email();
	String edu_address1 = eduordervo.getEdu_address1();
	String edu_address2 = eduordervo.getEdu_address2();
	String edu_address3 = eduordervo.getEdu_address3();
	String edu_address4 = eduordervo.getEdu_address4();
	String edu_address5 = eduordervo.getEdu_address5();
	String pet_img = eduordervo.getPet_img();
	String pet_name = eduordervo.getPet_name();
	String pet_type = eduordervo.getPet_type();
	int pet_age = eduordervo.getPet_age();
	int	pet_weight = eduordervo.getPet_weight();
	String pet_gender = eduordervo.getPet_gender();
	String pet_op	= eduordervo.getPet_op();
	String tr_img = eduordervo.getTr_img();
	String tr_name = eduordervo.getTr_name();
	String tr_hp = eduordervo.getTr_hp();
	Date tr_reg_date = eduordervo.getTr_reg_date();
	Date date1 = eduordervo.getDate1();
	Date date2 = eduordervo.getDate2();
	Date date3 = eduordervo.getDate3();
	Date date4 = eduordervo.getDate4();
	Date date5 = eduordervo.getDate5();
	Date date6 = eduordervo.getDate6();
	Date date7 = eduordervo.getDate7();
	int edu_cnt = eduordervo.getEdu_cnt();
	String edu_totalprice = eduordervo.getEdu_totalprice();

	
	
	
	// list를 컨틀롤러에서 받아와서 변수에 저장
	List<String> list = (List<String>)request.getAttribute("list");

	
%>
<!DOCTYPE html>
<html>
<head>
<style>
/* 전체 CSS 설정 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#cartWrapper {

	border: 1px solid floralwhite;
	
	width: 1200px;
	height: 650px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#cartBox {

	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	border-radius: 30px;
	background : floralwhite;
    box-shadow: 0px 0px 15px 1px #e91e6357;
	
}

/* 수강 신청, 타이틀 CSS 설정 */
#titleBox {

/* 	border: 1px solid floralwhite; */
	
	width: 100%;
	height: 100px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#title {

/* 	border: 1px solid floralwhite; */
	
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
	font-size: 30px;
    background: pink;
    border-radius: 10px;
    color: #e91e63b0;
    font-weight: bold;
}

#filter {
	border: 1px solid floralwhite;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
}

#filter>div {
	border: 1px solid floralwhite;
	width: calc(100%/ 5);
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	float: left;
	line-height: 40px;
	font-size: 25px;
    background: #f443361c;
    border-radius: 10px;
    color : #f4433685;
}

#filterEdu {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterPet {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterTr {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterPrice {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

/* 수강 신청 CSS 설정 */
#eduResultBox {
	border: 1px solid floralwhite;
	width: 100%;
	height: 35%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#eduResultBox>div {
	float: left;
}

#eduBox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#eduBox>div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#eduBox>div>a {

	border: 1px solid floralwhite;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#petBox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#petBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0px;
	right: 0;
	float: left;
	width : 118px;
}

#petBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#trbox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#trbox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#trbox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#priceBox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#priceBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0px;
	right: 0;
	float: left;
	width : 118px;
}

#priceBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#InfoBox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#InfoBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#InfoBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}


/* 늘 봄샵 전체, 타이틀 CSS 설정 */
#nbshopResultBox {

/* 	border: 1px solid floralwhite; */

	width: 100%;
	height: calc(100%/ 2);
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#nbshopResultBox>div {
	float: left;
}

#nbtitleBox {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#nbtitle {
	border: 1px solid floralwhite;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
	font-size : 30px;
    background: pink;
    border-radius: 10px;
    color: #e91e63b0;
    font-weight: bold;
}

#nbfilter {
	border: 1px solid floralwhite;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
}

#nbfilter>div {
	border: 1px solid floralwhite;
	width: calc(100%/ 4);
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	float: left;
	line-height: 40px;
	font-size: 25px;
    background: #f443361c;
    border-radius: 10px;
    color : #f4433685;
}

#filterMem {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterOrder {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterCost {
	border: 1px solid floralwhite;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

/* 늘봄샵 내부 CSS 설정	 */

#memBox {

	border: 1px solid aliceblue;
	
	width: 25%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#memBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0px;
	right: 0;
	float: left;
	width : 99px;
}

#memBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}



#orderBox {

	border: 1px solid aliceblue;
	
	width: 30%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#orderBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 118px;
}

#orderBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}


#costBox {

	border: 1px solid aliceblue;
	
	width: 25%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#costBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 148px;
}

#costBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#nbInfoBox {

	border: 1px solid aliceblue;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#nbInfoBox > div {

	border: 1px solid aliceblue;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#nbInfoBox > div > a {

	border: 1px solid aliceblue;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}




</style>
<!--     CSS car.css 추가 -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css"> --%>
<meta charset="UTF-8">
<title>intro.jsp</title>

</head>
<body>
	<form action=""></form>
	<div id="cartWrapper">
		<div id="cartBox">
			<div id="titleBox">
				<div id="title">수강 예약 정보</div>
				<div id="filter">
					<div id="filterEdu">예약 정보</div>
					<div id="filterPet">반려견 정보</div>
					<div id="filterTr">훈련사 정보</div>
					<div id="filterPrice">수강 예약금액</div>
					<div id="filtermod">비고</div>
				</div>
			</div>
			<div id="eduResultBox">
				<div id="eduBox">
					<div id="edu_num" >
						<a id="eduNum">예약번호</a>
					</div>
					<div id="edu_name" >
						<a id="eduName">이름</a>
					</div>
					<div id="edu_hp" >
						<a id="eduHp" >전화번호</a>
					</div>
				</div>
				<div id="petBox">
					<div id="pet_img" >
						<a id="petImg">사진</a>
					</div>
					<div id="pet_name">
						<a id="petName">이름</a>
					</div>

				</div>
				<div id="trBox">
					<div id="tr_img">
						<a id="trImg">사진</a>
					</div>
					<div id="tr_name" >
						<a  id="trName">훈련사</a>
					</div>
					<div id="tr_hp" >
						<a  id="trHp">전화번호</a>
					</div>
				</div>

				<div id="priceBox">
					<div id="edu_cnt">
						<a id="eduCnt">수강횟수</a>
					</div>
					<div id="edu_totalprice">
						<a id="eduTotalPrice">금액</a>
					</div>

				</div>
				
				<div id="InfoBox">
					<div id="edu_info">
						<a id="eduInfo">상세 보기</a>
					</div>
					<div id="Cart_del">
						<a id="cartDel">삭제하기</a>
					</div>
					<div id="Cart_mod">
						<a id="cartMod">수정하기</a>
					</div>
				</div>
			</div>

			<div id="nbshopResultBox">
				<div id="nbtitleBox">
					<div id="nbtitle">늘봄 샵 정보</div>
					<div id="nbfilter">
						<div id="filterOrder" style="width : 30%;">물품 정보</div>
						<div id="filterMem">주문자 정보</div>
						<div id="filterCost">금액 정보</div>
						<div id="filterInfo" style="width : 20%;">비고</div>
						
					</div>
				</div>

				<div id="orderBox" >
					<div id="order_num" >
						<a id="orderNum">주문번호</a>
					</div>
					<div id="order_img" >
						<a id="orderImg">물품사진</a>
					</div>
					<div id="order_product" >
						<a id="orderProduct">물품명</a>
					</div>
				</div>
				
				<div id="memBox" >
					<div id="mem_name" >
						<a id="memName">이름</a>
					</div>
					<div id="mem_hp" >
						<a id="memHp">전화번호</a>
					</div>
					<div id="mem_email" >
						<a id="memEmail">이메일</a>
					</div>
				</div>
				
				
				<div id="costBox" >
					<div id="order_cpt">
						<a id="orderCpt">수량</a>
					</div>
					<div id="order_price">
						<a id="orderPrice">금액</a>
					</div>

				</div>
		
				<div id="nbInfoBox">
					<div id="order_Info">
						<a id="orderInfo">상세보기</a>
					</div>
				
					<div id="nbCart_del">
						<a id="nbcartDel">삭제하기</a>
					</div>
					<div id="nbCart_mod">
						<a id="nbcartMod">수정하기</a>
					</div>
				</div>
				
			</div>
		</div>
	</div>


	<!-- 	장바구니  들어갈 항목 -->
	장바 구니 화면. jsp
	<br> 설명 : 상단에는 신청한 수강정보를 확인 할 수있도록 하고
	<br>
	<br> 하단부에는 샵에서 장바구니에 담은 목록을 확인 시킨다
	<br> 그 밑에는 최종 합산 금액 및 결제하기, ,장바구니비우기(?), 결제취소하기(고민중일 경우) 버튼을 만든다.
	<br>
	<br>
	</form>
</body>
</html>