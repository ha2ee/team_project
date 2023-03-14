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
<!--     CSS car.css 추가 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
<meta charset="UTF-8">
<title>intro.jsp</title>

</head>
<body>

	<br><br><br><br><br>
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
				<div id="eduNumBox">
					<div id="edu_num1">
						<input type="text" id="eduNum1" value="" />
					</div>
					<div id="edu_num2">
						<input type="text" id="eduNum2" value="" />
					</div>
					<div id="edu_num3">
						<input type="text" id="eduNum3" value="" />
					</div>
					<div id="edu_num41">
						<input type="text" id="eduNum4" value="" />
					</div>
					<div id="edu_num5">
						<input type="text" id="eduNum5" value="" />
					</div>
				</div>
				<div id="eduNameBox">
					<div id="edu_name1">
						<input type="text" id="eduName1" value="" />
					</div>
					<div id="edu_name2">
						<input type="text" id="eduName2" value="" />
					</div>
					<div id="edu_name3">
						<input type="text" id="eduName3" value="" />
					</div>
					<div id="edu_name4">
						<input type="text" id="eduName4" value="" />
					</div>
					<div id="edu_name5">
						<input type="text" id="eduName5" value="" />
					</div>
				</div>
				<div id="eduHpBox">
					<div id="edu_hp1">
						<input type="text" id="eduHp1" value="" />
					</div>
					<div id="edu_hp2">
						<input type="text" id="eduHp2" value="" />
					</div>
					<div id="edu_hp3">
						<input type="text" id="eduHp3" value="" />
					</div>
					<div id="edu_hp4">
						<input type="text" id="eduHp4" value="" />
					</div>
					<div id="edu_hp5">
						<input type="text" id="eduHp5" value="" />
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
					
				<div id="pet_img_box">	
					<div id="pet_img1">
						<a type="image" id="petImg1" ></a>
					</div>
					<div id="pet_img2">
						<a type="image" id="petImg2" ></a>
					</div>
					<div id="pet_img3">
						<a type="image" id="petImg3" ></a>
					</div>
					<div id="pet_img4">
						<a type="image" id="petImg4" ></a>
					</div>
					<div id="pet_img5">
						<a type="image" id="petImg5" ></a>
					</div>
				</div>

				<div id="pet_name_box">
					<div id="pet_name1">
						<input type="text" id="petName1" value="" />
					</div>
					<div id="pet_name2">
						<input type="text" id="petName2" value="" />
					</div>
					<div id="pet_name3">
						<input type="text" id="petName3" value="" />
					</div>
					<div id="pet_name4">
						<input type="text" id="petName4" value="" />
					</div>
					<div id="pet_name5">
						<input type="text" id="petName5" value="" />
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
					
				<div id="tr_img_box">
					<div id="tr_img1">
						<a type="image" id="trImg1" ></a>
					</div>
					<div id="tr_img2">
						<a type="image" id="trImg2" ></a>
					</div>
					<div id="tr_img3">
						<a type="image" id="trImg3" ></a>
					</div>
					<div id="tr_img4">
						<a type="image" id="trImg4" ></a>
					</div>
					<div id="tr_img5">
						<a type="image" id="trImg5" ></a>
					</div>
				</div>
					
				<div id="tr_name_box">
					<div id="tr_name1">
						<input type="text" id="trName1" value="" />
					</div>
					<div id="tr_name2">
						<input type="text" id="trName2" value="" />
					</div>
					<div id="tr_name3">
						<input type="text" id="trName3" value="" />
					</div>
					<div id="tr_name4">
						<input type="text" id="trName4" value="" />
					</div>
					<div id="tr_name5">
						<input type="text" id="trName5" value="" />
					</div>
				</div>

				<div id="tr_hp_box">
					<div id="tr_hp1">
						<input type="text" id="trHp1" value="" />
					</div>
					<div id="tr_hp2">
						<input type="text" id="trHp2" value="" />
					</div>
					<div id="tr_hp3">
						<input type="text" id="trHp3" value="" />
					</div>
					<div id="tr_hp4">
						<input type="text" id="trHp4" value="" />
					</div>
					<div id="tr_hp5">
						<input type="text" id="trHp5" value="" />
					</div>
				</div>

				<div id="priceBox">
					<div id="edu_date">
						<a id="eduDate">예약신청일</a>
					</div>
					<div id="edu_cnt">
						<a id="eduCnt">수강횟수</a>
					</div>
					<div id="edu_totalprice">
						<a id="eduTotalPrice">금액</a>
					</div>
				</div>
				
				<div id="edu_date_box">
					<div id="edu_date1">
						<input type="text" id="eduDate1" value="" />
					</div>
					<div id="edu_date2">
						<input type="text" id="eduDate2" value="" />
					</div>
					<div id="edu_date3">
						<input type="text" id="eduDate3" value="" />
					</div>
					<div id="edu_date4">
						<input type="text" id="eduDate4" value="" />
					</div>
					<div id="edu_date5">
						<input type="text" id="eduDate5" value="" />
					</div>
				</div>
				
				<div id="edu_cnt_box">
					<div id="edu_cnt1">
						<input type="text" id="eduCnt1" value="" />
					</div>
					<div id="edu_cnt2">
						<input type="text" id="eduCnt2" value="" />
					</div>
					<div id="edu_cnt3">
						<input type="text" id="eduCnt3" value="" />
					</div>
					<div id="edu_cnt4">
						<input type="text" id="eduCnt4" value="" />
					</div>
					<div id="edu_cnt5">
						<input type="text" id="eduCnt5" value="" />
					</div>
				</div>
				
				<div id="edu_totalprice_box">	
					<div id="edu_totalprice1">
						<input type="text" id="eduTotalprice1" value="" />
					</div>
					<div id="edu_totalprice2">
						<input type="text" id="eduTotalprice2" value="" />
					</div>
					<div id="edu_totalprice3">
						<input type="text" id="eduTotalprice3" value="" />
					</div>
					<div id="edu_totalprice4">
						<input type="text" id="eduTotalprice4" value="" />
					</div>
					<div id="edu_totalprice5">
						<input type="text" id="eduTotalprice5" value="" />
					</div>
				</div>
				
				<div id="InfoBox">
					<div id="edu_info">
						<a id="eduInfo">상세보기</a>
					</div>
					<div id="Cart_mod">
						<a id="cartMod">수정</a>
					</div>
					<div id="Cart_del">
						<a id="cartDel">비우기</a>
					</div>
				</div>
					
				<div id="edu_info_box">
					<div id="edu_info1">
						<input type="text" id="eduInfo1" value="" />
					</div>
					<div id="edu_info2">
						<input type="text" id="eduInfo2" value="" />
					</div>
					<div id="edu_info3">
						<input type="text" id="eduInfo3" value="" />
					</div>
					<div id="edu_info4">
						<input type="text" id="eduInfo4" value="" />
					</div>
					<div id="edu_info5">
						<input type="text" id="eduInfo5" value="" />
					</div>
				</div>
				
				<div id="cart_del_box">	
					<div id="cart_del1">
						<input type="text" id="cartDel1" value="" />
					</div>
					<div id="cart_del2">
						<input type="text" id="cartDel2" value="" />
					</div>
					<div id="cart_del3">
						<input type="text" id="cartDel3" value="" />
					</div>
					<div id="cart_del4">
						<input type="text" id="cartDel4" value="" />
					</div>
					<div id="cart_del5">
						<input type="text" id="cartDel5" value="" />
					</div>
				</div>
				
				<div id="cart_mod_box">	
					<div id="cart_mod1">
						<input type="text" id="cartMod1" value="" />
					</div>
					<div id="cart_mod2">
						<input type="text" id="cartMod2" value="" />
					</div>
					<div id="cart_mod3">
						<input type="text" id="cartMod3" value="" />
					</div>
					<div id="cart_mod4">
						<input type="text" id="cartMod4" value="" />
					</div>
					<div id="cart_mod5">
						<input type="text" id="cartMod5" value="" />
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
				
				<div id="order_num_box">
					<div id="order_num1">
						<input type="text" id="orderNum1" value="" />
					</div>
					<div id="order_num2">
						<input type="text" id="orderNum2" value="" />
					</div>
					<div id="order_num3">
						<input type="text" id="orderNum3" value="" />
					</div>
					<div id="order_num4">
						<input type="text" id="orderNum4" value="" />
					</div>
					<div id="order_num5">
						<input type="text" id="orderNum5" value="" />
					</div>
				</div>
				
				<div id="order_img_box">
					<div id="order_img1">
						<a type="image" id="orderImg1"  ></a>
					</div>
					<div id="order_img2">
						<a type="image" id="orderImg2"  ></a>
					</div>
					<div id="order_img3">
						<a type="image" id="orderImg3"  ></a>
					</div>
					<div id="order_img4">
						<a type="image" id="orderImg4"  ></a>
					</div>
					<div id="order_img5">
						<a type="image" id="orderImg5" ></a>
					</div>
				</div>
	
				<div id ="order_product_box">
					<div id="order_product1">
						<input type="text" id="orderProduct1" value="" />
					</div>
					<div id="order_product2">
						<input type="text" id="orderProduct2" value="" />
					</div>
					<div id="order_product3">
						<input type="text" id="orderProduct3" value="" />
					</div>
					<div id="order_product4">
						<input type="text" id="orderProduct4" value="" />
					</div>
					<div id="order_product5">
						<input type="text" id="orderProduct5" value="" />
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
					
				<div id="mem_name_box">	
					<div id="mem_name1">
						<input type="text" id="memName1" value="" />
					</div>
					<div id="mem_name2">
						<input type="text" id="memName2" value="" />
					</div>
					<div id="mem_name3">
						<input type="text" id="memName3" value="" />
					</div>
					<div id="mem_name4">
						<input type="text" id="memName4" value="" />
					</div>
					<div id="mem_name5">
						<input type="text" id="memName5" value="" />
					</div>
				</div>
				
				<div id="mem_hp_box">
					<div id="mem_hp1">
						<input type="text" id="memHp1" value="" />
					</div>
					<div id="mem_hp2">
						<input type="text" id="memHp2" value="" />
					</div>
					<div id="mem_hp3">
						<input type="text" id="memHp3" value="" />
					</div>
					<div id="mem_hp4">
						<input type="text" id="memHp4" value="" />
					</div>
					<div id="mem_hp5">
						<input type="text" id="memHp5" value="" />
					</div>
				</div>
					
				<div id="mem_email_box">
					<div id="mem_email1">
						<input type="text" id="memEmail1" value="" />
					</div>
					<div id="mem_email2">
						<input type="text" id="memEmail2" value="" />
					</div>
					<div id="mem_email3">
						<input type="text" id="memEmail3" value="" />
					</div>
					<div id="mem_email4">
						<input type="text" id="memEmail4" value="" />
					</div>
					<div id="mem_email5">
						<input type="text" id="memEmail5" value="" />
					</div>
				</div>
				
				
				<div id="costBox" >
					<div id="order_date">
						<a id="orderDate">주문일</a>
					</div>
					<div id="order_cpt">
						<a id="orderCpt">수량</a>
					</div>
					<div id="order_price">
						<a id="orderPrice">금액</a>
					</div>
				</div>
				
				<div id="order_date_box">
					<div id="order_date1">
						<input type="text" id="orderDate1" value="" />
					</div>
					<div id="order_date2">
						<input type="text" id="orderDate2" value="" />
					</div>
					<div id="order_date3">
						<input type="text" id="orderDate3" value="" />
					</div>
					<div id="order_date4">
						<input type="text" id="orderDate4" value="" />
					</div>
					<div id="order_date5">
						<input type="text" id="orderDate5" value="" />
					</div>
				</div>
				
				<div id="order_cpt_box">
					<div id="order_cpt1">
						<input type="text" id="orderCpt1" value="" />
					</div>
					<div id="order_cpt2">
						<input type="text" id="orderCpt2" value="" />
					</div>
					<div id="order_cpt3">
						<input type="text" id="orderCpt3" value="" />
					</div>
					<div id="order_cpt4">
						<input type="text" id="orderCpt4" value="" />
					</div>
					<div id="order_cpt5">
						<input type="text" id="orderCpt5" value="" />
					</div>
				</div>
				
				<div id="order_price_box">
					<div id="order_price1">
						<input type="text" id="orderPrice1" value="" />
					</div>
					<div id="order_price2">
						<input type="text" id="orderPrice2" value="" />
					</div>
					<div id="order_price3">
						<input type="text" id="orderPrice3" value="" />
					</div>
					<div id="order_price4">
						<input type="text" id="orderPrice4" value="" />
					</div>
					<div id="order_price5">
						<input type="text" id="orderPrice5" value="" />
					</div>
				</div>
		
				<div id="nbInfoBox">
					<div id="order_Info">
						<a id="orderInfo">상세보기</a>
					</div>
					
					<div id="nbCart_mod">
						<a id="nbcartMod">수정</a>
					</div>
					
					<div id="nbCart_del">
						<a id="nbcartDel">비우기</a>
					</div>
				</div>
				<div id="order_info_box">
					<div id="order_info1">
						<input type="text" id="orderInfo1" value="" />
					</div>
					<div id="order_info2">
						<input type="text" id="orderInfo2" value="" />
					</div>
					<div id="order_info3">
						<input type="text" id="orderInfo3" value="" />
					</div>
					<div id="order_info4">
						<input type="text" id="orderInfo4" value="" />
					</div>
					<div id="order_info5">
						<input type="text" id="orderInfo5" value="" />
					</div>
				</div>
				
				<div id="nbcart_del_box">
					<div id="nbcart_del1">
						<input type="text" id="nbcartDel1" value="" />
					</div>
					<div id="nbcart_del2">
						<input type="text" id="nbcartDel2" value="" />
					</div>
					<div id="nbcart_del3">
						<input type="text" id="nbcartDel3" value="" />
					</div>
					<div id="nbcart_del4">
						<input type="text" id="nbcartDel4" value="" />
					</div>
					<div id="nbcart_del5">
						<input type="text" id="nbcartDel5" value="" />
					</div>
				</div>
				
				<div id="nbcart_mod_box">
					<div id="nbcart_mod1">
						<input type="text" id="nbcartMod1" value="" />
					</div>
					<div id="nbcart_mod2">
						<input type="text" id="nbcartMod2" value="" />
					</div>
					<div id="nbcart_mod3">
						<input type="text" id="nbcartMod3" value="" />
					</div>
					<div id="nbcart_mod4">
						<input type="text" id="nbcartMod4" value="" />
					</div>
					<div id="nbcart_mod5">
						<input type="text" id="nbcartMod5" value="" />
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	<div id="total_price_box">
	
		<div id="total_box">
			<div>
				<a id="total_price" style="height:100%; font-size: 30px; line-height: 65px;">결제 할 금액</a>
			</div>
			<div id ="edu_shop_price">
				<a style="width: 50% ">수강 금액</a>
				<a style="width: 50% ">샵 금액</a>
				<input type="text" value="수강 금액" />
				<input type="text" value="샵 금액" />
			</div>
			<div id="edu_shop_total_price">
				<a>총 금액</a>
				<input type="text" value="총금액" />
			</div>
		</div>

		<div id="confirm_box">
			<a type="button" class="btn" >모두 비우기</a>
			<a type="button"  class="btn" >결제 하기</a>
		</div>

	</div>

	<br><br><br><br><br>


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