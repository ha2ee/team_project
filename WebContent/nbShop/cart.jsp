<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="VO.eduOrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	//Session내장객체 메모리 영역에 session값 얻기
	String id_ = (String)session.getAttribute("id");
	
	// list를 컨틀롤러에서 받아와서 변수에 저장
	List<String> list = (List<String>)request.getAttribute("list");

	
%>
<!DOCTYPE html>
<html>
<head>
<style>

.modal{

position: fixed;
width: 1200px;
height: 750px;
margin: 0 auto;
top: 360px;
left: 0;
flex-wrap: nowrap;
justify-content: center;
align-items: center;

display : none;
}

</style>
<!--     CSS car.css 추가 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
<meta charset="UTF-8">
<title>intro.jsp</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
			</div>
				
	
<!-- 수강신청정보 -->
	<c:set var="j" value="1"/>
	<div id="edu_res_box">
	<c:forEach var="vo"  items="${vector}" >
	<c:if test="${vector.isEmpty()}">
		<h1>예약된 정보가 없습니다!!</h1>	
	</c:if>
		<div id="dataBox">
				<!--예약번호 -->
				<div id="eduNumBox">
					<div id="edu_num${j}">
						<input type="text" id="eduNum${j}" value="${vo.edu_num}" readonly="readonly" />
					</div>
				</div>
				
				<!--이름 -->
				<div id="eduNameBox">
					<div id="edu_name${j}">
						<input type="text" id="eduName${j}" value="${vo.edu_name}" readonly="readonly" />
					</div>
				</div>
				
				<!--전화번호 -->
				<div id="eduHpBox">
					<div id="edu_hp${j}">
						<input type="text" id="eduHp${j}" value="${vo.edu_hp}" readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 사진 -->
				<div id="pet_img_box">	
					<div id="pet_img${j}">
						<input type="image" class="gallery"  id="petImg${j}" src="<%=request.getContextPath()%>/nbShop/img/${vo.pet_img}"  readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 이름 -->
				<div id="pet_name_box">
					<div id="pet_name${j}">
						<input type="text" id="petName${j}" value="${vo.pet_name}" readonly="readonly"  />
					</div>
				</div>
				
				<!--훈련사 사진 -->
				<div id="tr_img_box">
					<div id="tr_img${j}">
						<input type="image" class="gallery" id="trImg${j}" src="<%=request.getContextPath()%>/nbShop/img/${vo.tr_img}" readonly="readonly" />
					</div>
				</div>
				
				<!--훈련사 이름 -->
				<div id="tr_name_box">
					<div id="tr_name${j}">
						<input type="text" id="trName${j}" value="${vo.tr_name }" readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 이름 -->
				<div id="tr_hp_box">
					<div id="tr_hp${j}">
						<input type="text" id="trHp${j}" value="${vo.tr_hp}" readonly="readonly"  />
					</div>
				</div>
				
				<!--예약 일정 -->
				<div id="edu_date_box">
					<div id="edu_date${j}">
						<input type="text" id="eduDate${j}" value="${vo.tr_reg_date}" readonly="readonly"  />
					</div>
				</div>
				
				<!--예약 횟수 -->
				<div id="edu_cnt_box">
					<div id="edu_cnt${j}">
						<input type="text" id="eduCnt${j}" value="${vo.edu_cnt}" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 예약 금액 -->
				<div id="edu_totalprice_box">	
					<div id="edu_totalprice${j}">
						<input type="text" id="eduTotalprice${j}" value="${vo.edu_totalprice}" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 상세 보기 -->
				<div id="edu_info_box">
					<div id="edu_info${j}">
						<input class="btn" type="button" id="eduInfo${j}" onclick=reply_click(this.id) value="상세보기"  />
					</div>
				</div>
				<!-- 비우기 -->
				<div id="cart_del_box">	
					<div id="cart_del${j}">
						<input class="btn" type="button" id="cartDel${j}" onclick=reply_click(this.id) value="비우기" />
					</div>
				</div>
				<!-- 수정 -->
				<div id="cart_mod_box">	
					<div id="cart_mod${j}">
						<input class="btn" type="button" id="cartMod${j}" onclick=reply_click(this.id) value="수정" />
					</div>
				</div>
			</div>	
		<c:set var="j" value="${j+1}" /> 
	</c:forEach>
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
				
<!-- 	늘봄 샵 관련 vector 구문 -->
<%-- 	<c:set var="h" value="1"/> --%>
		<div id="shop_res_box">
<%-- 	<c:forEach var="vo"  items="${vector}" >			 --%>
				
				<!-- 주문 번호 -->
				<div id="order_num_box">
					<div id="order_num1">
						<input type="text" id="orderNum1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 물품 사진 -->
				<div id="order_img_box">
					<div id="order_img1">
						<input type="image" class="gallery" id="orderImg1"  src="" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 물품 품명 -->
				<div id ="order_product_box">
					<div id="order_product1">
						<input type="text" id="orderProduct1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 명 -->
				<div id="mem_name_box">	
					<div id="mem_name1">
						<input type="text" id="memName1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 번호 -->
				<div id="mem_hp_box">
					<div id="mem_hp1">
						<input type="text" id="memHp1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 이메일-->
				<div id="mem_email_box">
					<div id="mem_email1">
						<input type="text" id="memEmail1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매 날짜 -->
				<div id="order_date_box">
					<div id="order_date1">
						<input type="text" id="orderDate1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매 갯수 -->
				<div id="order_cpt_box">
					<div id="order_cpt1">
						<input type="text" id="orderCpt1" value="test" readonly="readonly" />
					</div>
				</div>
				
				<!-- 구매 금액 -->
				<div id="order_price_box">
					<div id="order_price1">
						<input type="text" id="orderPrice1" value="test" readonly="readonly" />
					</div>
				</div>
		
				<!-- 상세 보기 -->
				<div id="order_info_box">
					<div id="order_info1">
						<input class="btn" type="button" id="orderInfo1" value="상세보기" />
					</div>
				</div>
				
				<!-- 수정 -->
				<div id="nbcart_mod_box">
					<div id="nbcart_mod1">
						<input class="btn" type="button" id="nbcartMod1" value="수정" />
					</div>
				</div>
				
				<!-- 비우기 -->
				<div id="nbcart_del_box">
					<div id="nbcart_del1">
						<input class="btn" type="button" id="nbcartDel1" value="비우기" />
					</div>
				</div>
<%-- 		<c:set var="h" value="${h+1}" />  --%>
		</div>
<%-- 	</c:forEach> --%>
				
			</div>
		</div>
	</div>
	
	<div id="total_price_box">
	
		<div id="total_box">
			<div>
				<a id="total_price" style="height:100%; font-size: 30px; line-height: 65px;">결제 할 금액</a>
			</div>
			<div id ="edu_shop_price">
				<a style="width: 50% " >수강 금액</a>
				<a style="width: 50% ">샵 금액</a>
				<input id="eduPrice" type="text" value="수강 금액" readonly="readonly" />
				<input type="text" value="샵 금액" readonly="readonly"  />
			</div>
			<div id="edu_shop_total_price">
				<a>총 금액</a>
				<input type="text" value="총금액" readonly="readonly"  />
			</div>
		</div>

		<div id="confirm_box">
			<a type="button" class="btn" >모두 비우기</a>
			<a type="button"  class="btn" >결제 하기</a>
		</div>

	</div>
	
	
<!-- 	상세보기 관련 vector 구문 -->
	<div class="modal">
	<div class="modalBox">
	<div id="pop_mem_box">
		<div id= "pop_num">
			<input type="text" value="예약 번호" readonly="readonly"  />
		</div>	
		<div id= "pop_reg_date">
			<input type="text" value="예약 날짜" readonly="readonly"  />
		</div>		 
		<div id= "pop_id">
			<input type="text" value="예약 아이디" readonly="readonly"  />
		</div>
		<div id= "pop_name">
			<input type="text" value="예약 이름" readonly="readonly"  />
		</div>
		<div id= "pop_hp">
			<input type="text" value="예약한 번호" readonly="readonly"  />
		</div>
		<div id= "pop_email">
			<input type="text" value="예약자 이메일" readonly="readonly"  />
		</div>
		<div id= "pop_address1">
			<input type="text" value="예약자주소1" readonly="readonly"  />
		</div>
		<div id= "pop_address2">
			<input type="text" value="예약자주소2" readonly="readonly"  />
		</div>
		<div id= "pop_address3">
			<input type="text" value="예약자주소3" readonly="readonly"  />
		</div>
		<div id= "pop_address4">
			<input type="text" value="예약자주소4" readonly="readonly"  />
		</div>
		<div id= "pop_address5">
			<input type="text" value="예약자주소5" readonly="readonly"  />
		</div>
	</div>	
	<div id= "pop_pet_box">
		<div id= "pop_pet_img">
			<img src=""  />
		</div>
		<div id= "pop_pet_name">
			<input type="text" value="반려견 이름" readonly="readonly"  />
		</div>
		<div id= "pop_pet_type">
			<input type="text" value="반려견 품종" readonly="readonly"  />
		</div>
		<div id= "pop_pet_age">
			<input type="text" value="반려견 나이" readonly="readonly"  />
		</div>
		<div id= "pop_pet_weight">
			<input type="text" value="반려견 몸무게" readonly="readonly"  />
		</div>
		<div id= "pop_pet_gender">
			<input type="text" value="반려견 성별" readonly="readonly"  />
		</div>
		<div id= "pop_pet_op">
			<input type="text" value="반려견 중성화여부" readonly="readonly"  />
		</div>
	</div>
	<div id= "pop_tr_box">
		<div id= "pop_tr_img">
			<img src=""  />
		</div>
		<div id= "pop_tr_name">
			<input type="text" value="훈련사 이름" readonly="readonly"  />
		</div>
		<div id= "pop_tr_hp">
			<input type="text" value="훈련사 번호" readonly="readonly"  />
		</div>
		<div id= "pop_tr_reg_date">
			<input type="text" value="훈련사 번호" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date1">
			<input type="text" value="예약일1" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date2">
			<input type="text" value="예약일2" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date31">
			<input type="text" value="예약일3" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date4">
			<input type="text" value="예약일4" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date5">
			<input type="text" value="예약일5" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date6">
			<input type="text" value="예약일6" readonly="readonly"  />
		</div>
		<div id= "pop_tr_date7">
			<input type="text" value="예약일7" readonly="readonly"  />
		</div>
		<div id= "pop_cnt">
			<input type="text" value="수강 횟수" readonly="readonly"  />
		</div>
		<div id= "pop_totalprice">
			<input type="text" value="수강 금액" readonly="readonly"  />
		</div>
	</div>
	<div id="pop_btn">
		<input id="popBtn" class="btn" type="button"  onclick="close()" value="닫기"/>
	</div>
	</div>
	</div>
	<br><br><br><br><br>
	

	</form>
<script>

$(document).ready(function(){
	
	// 모달창의 닫기 버튼을 눌렀을 때,
	$("#popBtn").on("click", function(){
		
		$(".modal").css("display", "none");
		
	})
	
	
	var i= 0;
	var x = 0;
	
	// 수강 가격 계산 하기 (작성중)
	for(i=1; i <= ${vector.size()}; i++){
		
		var price = document.getElementById("eduTotalprice"+i).value;

		var replaceprice = parseInt(price.replace(/,/g , ""));

		x += replaceprice++;
		
	}

	
	// 정규표현식으로 3자리숫자당 콤마로 구분한다.
	var edu_price = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	// 수강 신청 가격을 해당 구문에 넣기
	$("#eduPrice").attr("value", edu_price);
	
	// 샵 금액 (작성중)
	
	var shop_price = 0;
	
	// 수강금액 + 샵금액 = 총금액 계산 하기
	$("#edu_shop_total_price > input").attr("value", (edu_price+shop_price));

})

// 장바구니에서 각 버튼을 눌렀을 때,
function reply_click(clicked_id){
	
	//1. vector를 가져온다.
	
	//2. 가져온 vector를 저장시킨다.
	
	for(var num=1; num <= ${vector.size()}; num++ ){
	
		if(clicked_id == "eduInfo"+num){
			
		var edu_num = "${vector}";
		
		for(var i in edu_num){
			
			alert(edu_num[i]);
		}
		
// 		console.log(edu_num.toString());
// 		document.getElementById("pop_num").value = edu_num;
			
			
			
		}
	}

    var CloseModal = document.querySelector(".modal");
    CloseModal.style.display = "flex";
}

// 이미지 미리보기 
//마우스 오버시 preview 생성
$(document).on("mouseover",".gallery",function(e){
    var input_data = $(this).data("input");
    var add_caption = (input_data != undefined) ? "<br/>" + input_data : "" ;
    $("#middle").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' />"+ add_caption +"</p>");
    $("#preview")
    .css("z-index", "5")
    .fadeIn("fast");
});

//마우스 이동시 preview 이동
$(document).on("mousemove",".gallery",function(e){
    $("#preview")

});

// 마우스 아웃시 preview 제거
$(document).on("mouseout",".gallery",function(){
    $("#preview").remove();
});
</script>
</body>
</html>