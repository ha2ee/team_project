<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<!--     CSS car.css 추가 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
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
				</div>
			</div>
			<div id="eduResultBox">
				<div id="eduBox">
					<div id="edu_name" style="width: 23%">
						<a id="eduName">이름<input id="eduNameInput" type="text"></a>
					</div>
					<div id="edu_hp" style="width: 37%">
						<a id="eduHp">전화번호<input id="eduHpInput" type="text"></a>
					</div>
					<div id="edu_email" style="width: 40%">
						<a id="eduEmail">이메일<input style="font-size: 11px"
							id="eduEmailInput" type="text"></a>
					</div>
					<div id="edu_address" style="width: 100%">
						<a id="eduAddress">주소<input style="font-size: 11px"
							id="eduAddressInput" type="text"></a>
					</div>
				</div>
				<div id="petBox">
					<div id="pet_img" style="height: 150px">
						<a id="petImg">사진<input style="height: 70px; top:10px;" id="petImgInput"
							type="image" src=""></a>
					</div>
					<div id="pet_name">
						<a id="petName">이름<input id="petNameInput" type="text"></a>
					</div>
					<div id="pet_type">
						<a id="petType">견종<input id="petTypeInput" type="text"></a>
					</div>
					<div id="pet_age">
						<a id="petAge">나이<input id="petAgeInput" type="text"></a>
					</div>
					<div id="pet_weight">
						<a id="petWeight">몸무게<input id="petWeightInput" type="text"></a>
					</div>
					<div id="pet_gender">
						<a id="petGender">성별<input id="petGenderInput" type="text"></a>
					</div>
					<div id="pet_op">
						<a id="petOp">중성화여부<input id="petOpInput" type="text"></a>
					</div>
				</div>
				<div id="trBox">
					<div id="tr_img">
						<a id="trImg">사진<input style="height:105px" id="trImgInput" type="image" src=""></a>
					</div>
					<div id="tr_name" style="height:75px;">
						<a style="height:40px" id="trName">훈련사<input id="trNameInput" type="text"></a>
					</div>
					<div id="tr_hp" style="height:75px;">
						<a style="height:40px" id="trHp">전화번호<input id="trHpInput" type="text"></a>
					</div>
				</div>

				<div id="priceBox">
					<div id="edu_cnt">
						<a id="eduCnt">수강횟수<input id="eduCntInput" type="text"></a>
					</div>
					<div id="edu_totalprice">
						<a id="eduTotalPrice">금액<input id="eduTotalPriceInput"
							type="text"></a>
					</div>
				</div>
			</div>

			<div id="nbshopResultBox">
				<div id="nbtitleBox">
					<div id="nbtitle">늘봄 샵 정보</div>
					<div id="nbfilter">
						<div id="filterMem" style="width: 25%">예약자 정보</div>
						<div id="filterOrder" style="width: 50%">물품 정보</div>
						<div id="filterCost" style="width: 25%">금액 정보</div>
					</div>
				</div>
				<div id="memBox">
					<div id="mem_name" style="width: 23%">
						<a id="memName">이름<input id="memNameInput" type="text"></a>
					</div>
					<div id="mem_hp" style="width: 37%">
						<a id="memHp">전화번호<input id="memHpInput" type="text"></a>
					</div>
					<div id="mem_email" style="width: 40%">
						<a id="memEmail">이메일<input style="font-size: 11px"
							id="memEmailInput" type="text"></a>
					</div>
					<div id="mem_address" style="width: 100%">
						<a id="memAddress">주소<input style="font-size: 11px"
							id="memAddressInput" type="text"></a>
					</div>
				</div>
				<div id="orderBox">
					<div id="order_num" style="width : 15%">
						<a id="orderNum">주문번호<input id="orderNumInput" type="text"></a>
					</div>
					<div id="order_img" style="width : 15%">
						<a id="orderImg">물품사진<input id="orderImgInput" type="image"
							src=""></a>
					</div>
					<div id="order_product" style="width : 70%">
						<a id="orderProduct">물품명<input id="orderProductInput"
							type="text"></a>
					</div>
				</div>
				<div id="costBox">
					<div id="order_cpt">
						<a id="orderCpt">수량<input id="orderCptInput" type="text"></a>
					</div>
					<div id="order_price">
						<a id="orderPrice">금액<input id="orderPriceInput" type="text"></a>
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