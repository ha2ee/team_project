<%@page import="java.util.Vector"%>
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
<!--     CSS car.css 추가 -->
<style>
    #mega_wrapper > ul {
    border: 1px solid white;
    text-align: center;
    color: black;
    font-size: 16px;
    float: left;
	}
	
	.list_lnb_01 {
	    margin-left: 75px;
	    width: 220px;
	}
	
	.list_lnb_02 {
    margin-left: 40px;
    width: 170px;
	}
    
    .list_lnb_04 {
    margin-left: 55px;
    width: 170px;
	}
		/*  로그인,회원가입,마이페이지,장바구니 버튼 백그라운드 컬러변경 시 사용 */
	
	
	#login_box > li > a:hover {
	
	  background: #fff5f3;
	  text-decoration: none;
	  border-radius: 20px;
	  transition : 0.3s;
	}

	
	#login_box > li > a {
	
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 15px;
    text-transform: uppercase;
    font-weight: 700;
    margin: 0 auto;
    letter-spacing: .75px;
    border: transparent;
    position: relative;
    display: inline-block;
    background: #fff;
    color: black;
    transition: 0.3s;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    line-height: 50px;
    padding: 0;
    
	}
	
	#login_box > li {
	
/*     border: 1px solid blue; */
    
    float: left;
    position: relative;
    text-align: center;
    margin: 0 auto;
    height: 50px;
    width: 105px;
    left: 15px;
    padding: 0;
    
	}
	
	#login_box {
/*     border: 1px solid rebeccapurple; */
    margin: 0 auto 0 auto;
    position: relative;
    width: 250px;
    height: 100px;
    top: -1px;
    left: 475px;
    right: 0;
    text-align: center;
}
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css">
<meta charset="UTF-8">
<title>intro.jsp</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form name="submitconfirm" method ="post" action ="<%=request.getContextPath()%>/nbOrder/eduOrder.od">
	
	<input type="hidden" name="memberid" value="<%=id_%>" />
	
	<br><br><br><br><br>
	
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
						<a id="eduInfo">상세 보기</a>
					</div>
					<div id="Cart_del">
						<a id="cartDel">예약 삭제</a>
					</div>
				</div>
			</div>
				
	
<!-- 수강신청정보 -->
	<c:set var="j" value="1"/>
	<div id="edu_res_box">
	<c:if test="${vector.isEmpty()}">
		<h3><Strong>예약된 정보가 없습니다!!</Strong></h3>	
	</c:if>
	<c:forEach var="vo"  items="${vector}" >

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
						<input class="btn" type="button" id="eduInfo${j}" onclick=reply_click(this.id) value="상세 보기"  />
					</div>
				</div>
				<!-- 예약 삭제 -->
				<div id="cart_del_box">	
					<div id="cart_del${j}">
						<a type="button" id="cartDel${j}"  href="<%=request.getContextPath()%>/nbOrder/eduDel.od?id=<%=id_%>&edu_num=${vo.edu_num}"  onclick='return window.confirm("정말 삭제하시겠습니까?")'>예약 삭제</a>
					</div>
				</div>
			</div>	
		<c:set var="j" value="${j+1}" /> 
	</c:forEach>
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
				<input id="eduPrice" type="text" value="" placeholder=" " readonly="readonly" />
				<input type="text" value="" placeholder=" " readonly="readonly"  />
			</div>
			<div id="edu_shop_total_price">
				<a>총 금액</a>
				<input id="edu_shop_totalprice" type="text" value="" placeholder=" " readonly="readonly"  />
			</div>
		</div>

		<div id="confirm_box">
			<a type="button"  class="btn" href="<%=request.getContextPath()%>/nbOrder/eduAlldel.od?id=<%=id_%>"  onclick='return window.confirm("수강 예약과 물품이 리스트에서 모두 삭제됩니다")'>모두 삭제하기</a>
			<a id="orderconfirm" onclick="requestPay()" type="submit"  class="btn" >결제 하기</a>
		</div>

	</div>
	
	
<!-- 	상세보기 관련 vector 구문 -->

	<!-- 	늘봄 샵 상세보기 관련 vector 구문 -->
	
		<div class="modal" style="display : none;">
		<c:set var="a" value="1"/>
		<c:forEach var="vo"  items="${vector}" >
		<div id="modalBox${a}" style="display : none;">
		<div id="pop_title">
			<div id="pop_mem_title_box">
				<a type="text">예약 정보</a>
			</div>
			<div id="pop_pet_title_box">
				<a type="text">반려견 정보</a>
			</div>
			<div id="pop_tr_title_box">
				<a type="text">훈련사 정보</a>
			</div>
		</div>
		<div id="pop_mem_box">			
			<div id= "pop_num${a}">
				<a id="pop1">예약 번호</a>
				<input id="popNum${a}" type="text" value="${vo.edu_num}" readonly="readonly"  />
			</div>	
			<div id= "pop_reg_date">
				<a id="pop2">예약 일자</a>
				<input id="popRegDate${a}" type="text" value="${vo.tr_reg_date}" readonly="readonly"  />
			</div>		 
			<div id= "pop_id${a}">
				<a id="pop3">예약 아이디</a>
				<input id="popId${a}" name="edu_id" type="text" value="${vo.edu_id}" readonly="readonly"  />
			</div>
			<div id= "pop_name${a}">
				<a id="pop4">예약자 이름</a>
				<input id="popName${a}" name="edu_name" type="text" value="${vo.edu_name}" readonly="readonly"  />
			</div>
			<div id= "pop_hp${a}">
				<a id="pop5">예약자 전화번호</a>
				<input id="popHp${a}"type="text" name="edu_hp" value="${vo.edu_hp}" readonly="readonly"  />
			</div>
			<div id= "pop_email${a}">
				<a id="pop6">예약자 이메일</a>
				<input id="popEmail${a}"type="text" name="edu_email" value="${vo.edu_email}" readonly="readonly"  />
			</div>
			<div id= "pop_address1">
				<a id="pop7">우편 번호</a>
				<input type="text" name="edu_address1" value="${vo.edu_address1}" readonly="readonly"  />
			</div>
			<div id= "pop_address2">
				<a id="pop8">도로명 주소</a>
				<input type="text" name="edu_address2" value="${vo.edu_address2}" readonly="readonly"  />
			</div>
			<div id= "pop_address3">
				<a id="pop8">지번 주소</a>
				<input type="text" name="edu_address3" value="${vo.edu_address3}" readonly="readonly"  />
			</div>
			<div id= "pop_address4">
				<a id="pop9">참고 주소</a>
				<input type="text" name="edu_address4" value="${vo.edu_address4}" readonly="readonly"  />
			</div>
			<div id= "pop_address5">
				<a id="pop10">상세 주소</a>
				<input type="text" name="edu_address5" value="${vo.edu_address5}" readonly="readonly"  />
			</div>
		</div>	
	
		<div id= "pop_pet_box">
			<div id= "pop_pet_img${a}" style="width: 200px; height : 200px; margin : 0 auto; position : relative; left: 0; top :0;">
				<a id="pop11" style="width : 100%; height : 50px; line-height: 50px;">반려견 사진</a>
				<img style="width : 100%; height : 150px; border-radius: 20px;" id="popPetImg${a}" src="<%=request.getContextPath()%>/nbShop/img/${vo.pet_img}"  />
				<input type="hidden" name="pet_img"  value="${vo.pet_img}" />
			</div>
			<div id= "pop_pet_name${a}">
				<a id="pop12">반려견 이름</a>
				<input id="popPetName${a}"type="text" name="pet_name" value="${vo.pet_name}" readonly="readonly"  />
			</div>
			<div id= "pop_pet_type${a}">
				<a id="pop13">반려견 품종</a>
				<input id="popPetType${a}" type="text" name="pet_type" value="${vo.pet_type}" readonly="readonly"  />
			</div>
			<div id= "pop_pet_age${a}">
				<a id="pop14">반려견 나이</a>
				<input type="text" id="popPetAge${a}" name="pet_age" value="${vo.pet_age}" readonly="readonly"  />
			</div>
			<div id= "pop_pet_weight${a}">
				<a id="pop15">반려견 몸무게</a>
				<input type="text" id="popPetWeight${a}" name="pet_weight" value="${vo.pet_weight}" readonly="readonly"  />
			</div>
			<div id= "pop_pet_gender${a}">
				<a id="pop16">반려견 성별</a>
				<input type="text" id="popPetGender${a}" name="pet_gender" value="${vo.pet_gender}" readonly="readonly"  />
			</div>
			<div id= "pop_pet_op${a}">
				<a id="pop17">반려견 중성화여부</a>
				<input type="text" id="popPetOp${a}" name="pet_op" value="${vo.pet_op}" readonly="readonly"  />
			</div>
		</div>
		
		<div id= "pop_tr_box">
			<div id= "pop_tr_img${a}" style="width: 200px; height : 200px; margin : 0 auto; position : relative; left: 0; top :0;">
				<a id="pop18" style="width : 100%; height : 50px; line-height: 50px;">훈련사 사진</a>
				<img style="width : 100%;  height : 150px; border-radius: 20px;"  id="popTrImg${a}" src="<%=request.getContextPath()%>/nbShop/img/${vo.tr_img}"  />
				<input type="hidden" name="tr_img"  value="${vo.tr_img}" />
			</div>
			<div id= "pop_tr_name${a}">
				<a id="pop19">훈련사 이름</a>
				<input id="popTrName${a}" type="text" name="tr_name"value="${vo.tr_name}" readonly="readonly"  />
			</div>
			<div id= "pop_tr_hp${a}">
				<a id="pop20">훈련사 번호</a>
				<input id="popTrHp${a}" type="text" name="tr_hp" value="${vo.tr_hp}" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date1">
				<a id="pop21">수강 예약 1회</a>
				<input type="text" value="${vo.date1}" name="tr_date1" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date2">
				<a id="pop22">수강 예약 2회</a>
				<input type="text" value="${vo.date2}" name="tr_date2" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date3">
				<a id="pop23">수강 예약 3회</a>
				<input type="text" value="${vo.date3}" name="tr_date3" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date4">
				<a id="pop24">수강 예약 4회</a>
				<input type="text" value="${vo.date4}" name="tr_date4" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date5">
				<a id="pop25">수강 예약 5회</a>
				<input type="text" value="${vo.date5}" name="tr_date5" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date6">
				<a id="pop26">수강 예약 6회</a>
				<input type="text" value="${vo.date6}" name="tr_date6" readonly="readonly"  />
			</div>
			<div id= "pop_tr_date7">
				<a id="pop27">수강 예약 7회</a>
				<input type="text" value="${vo.date7}" name="tr_date7"  readonly="readonly"  />
			</div>
			<div id= "pop_cnt${a}">
				<a id="pop28">수강 횟수</a>
				<input id="popCnt${a}" type="text" name="edu_cnt" value="${vo.edu_cnt}" readonly="readonly"  />
			</div>
			<div id= "pop_totalprice${a}">
				<a id="pop29">수강 금액</a>
				<input id="popTotalPrice${a}" type="text" name="edu_totalprice" value="${vo.edu_totalprice}" readonly="readonly"  />
			</div>
		</div>
		<div id="pop_btn">
			<input class="btn popBtn" type="button"  value="닫기"/>
		</div>
		

		
	</div>
		<c:set var="a" value="${a+1}" /> 
		</c:forEach>
	</div>
	
<!-- 		늘봄 샵 상세보기 끝 -->
	<br><br><br><br><br>
	

</form>
<script>

$(document).ready(function(){

	
	// 모달창의 닫기 버튼을 눌렀을 때,
	$(".popBtn").on("click", function(){
		
		$(".modal").css("display", "none");
		$(".modal > div").css("display", "none");
		
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
	
	
	// 수강금액 + 샵금액 = 총금액 계산 하기
	$("#edu_shop_total_price > input").attr("value", edu_price);

})

// 장바구니에서 각 버튼을 눌렀을 때,
function reply_click(clicked_id){
	
	// vector 배열의 길이만큼의 배열을 가져오고
	for(var a=1; a <= ${vector.size()}; a++){

			
		// 만약 클릭한 아이디가 eduInfo+배열길이숫자와 동일하다면,
		if(clicked_id == "eduInfo"+a){

			// 모달창을 오픈시킨다.
			$(".modal").css("display", "block");
			$("#modalBox"+a).css("display", "block");
		}
		
	}
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
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function requestPay(){
	
	alert("카카오페이로 간편 결제됩니다!! 본인 휴대폰을 준비해주세요!");
	
	var arr = new Array();
	
	<c:forEach items="${vector}" var="v" >
	
	arr.push({ edu_id : "${v.edu_id}",
			  	edu_name : "${v.edu_name}",
			 	edu_hp : "${v.edu_hp}",
			 	edu_email		: "${v.edu_email}",
			 	edu_address : "${v.edu_address1}"+"${v.edu_address2}"+"${v.edu_address3}"+"${v.edu_address4}"+"${v.edu_address5}",
			 	});
	</c:forEach>


	console.log(arr);
	
	var edu_id = arr[0].edu_id;
	var edu_name = arr[0].edu_name;
	var edu_hp = arr[0].edu_hp;
	var edu_email = arr[0].edu_email;
	var edu_address = arr[0].edu_address;
	var edu_totalprice = document.getElementById("edu_shop_totalprice").value;
	
	var IMT = window.IMP;
		
	
	  IMP.init("imp22854080"); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	  IMP.request_pay({
	    pg: "TC0ONETIME",
	    pay_method: "card",
	    merchant_uid : 'merchant_'+new Date().getTime(),
	    name : edu_name+"님의 결제페이지 입니다.",
	    amount : edu_totalprice,
	    buyer_email : edu_email,
	    buyer_name : edu_name,
	    buyer_tel : edu_hp,
	    buyer_addr : edu_address,
	    buyer_postcode : '000-000'
	  }, function (rsp) { // callback
	      if (rsp.success) {
	    	  
	          var msg = '결제가 완료되었습니다. 수강 내역은 마이페이지 확인가능합니다!';
	          alert(msg);
	          
	          document.submitconfirm.submit();

	      } else {
	    	  
	          var msg = '결제에 실패하였습니다.';
	          msg += '에러내용 : ' + rsp.error_msg;
	          alert(msg);
	        
	        
	      }
	  });
	  

}

</script>
</body>
</html>