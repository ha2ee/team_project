<%@page import="VO.nbPetMemVo"%>
<%@page import="VO.trMemberVo"%>
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
	// 예약 작성일 가져와서 변수에 저장
	String tr_mem_reg_date = request.getParameter("tr_mem_reg_date");
	// 한글버젼으로 된 예약일을 가져와서 변수에 저장
	String tr_reg_date = request.getParameter("reg_date");
	
	// 2) 트레이너 데이터
	// trmembervo에 저장한 tr_hp와, tr_img를 가져와 변수에 저장 시킨다.
	trMemberVo trmembervo = (trMemberVo)request.getAttribute("trmembervo");
	// 휴대전화번호 변수에 저장
	String tr_hp = trmembervo.getTr_hp();
	// 이미지 변수에 저장
	String tr_img = trmembervo.getTr_img();
	
	// 3) 회원 데이터
	// nbpetMemVo에 저장한 값들을 가져와 변수에 저장 시킨다.
	nbPetMemVo nbpetmemvo = (nbPetMemVo)request.getAttribute("nbpetmemvo");
	// 아이디 저장
	String mem_id = nbpetmemvo.getMem_id();
	// 이름 저장
	String mem_name = nbpetmemvo.getMem_name();
	// 전화번호 저장
	String mem_hp = nbpetmemvo.getMem_hp();
	// 이메일 저장
	String mem_email = nbpetmemvo.getMem_email();
	// 주소1 저장
	String mem_address1 = nbpetmemvo.getMem_address1();
	// 주소2 저장
	String mem_address2 = nbpetmemvo.getMem_address1();
	// 주소3 저장
	String mem_address3 = nbpetmemvo.getMem_address1();
	// 주소4 저장
	String mem_address4 = nbpetmemvo.getMem_address1();
	
	// 4) 회원 반려견 데이터
	// 반려견 사진 저장
	String pet_img 	 = nbpetmemvo.getP_img();
	// 반려견 이름 저장
	String pet_name 	 = nbpetmemvo.getP_name();
	// 반려견 견종 저장
	String pet_type 	 = nbpetmemvo.getP_type();
	// 반려견 나이 저장
	int	pet_age	  	 = nbpetmemvo.getP_age();
	// 반려견 몸무게 저장
	int pet_weight 	 =  nbpetmemvo.getP_weight();
	// 반려견 성별 저장
	String pet_gender = nbpetmemvo.getP_gender();
	// 반려견 중성화 여부 저장
	String pet_op		 = nbpetmemvo.getP_op();
	


	
%>    
    
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

</style>
<meta charset="UTF-8">
<!--  	 edu_reservation.css CSS 셋팅 -->
 	<link href="<%=request.getContextPath()%>/css/edu_reservation.css" rel="stylesheet">
<title>intro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>






	<!-- 	주문예약 들어갈 항목 -->
	
<!-- 	내용을 입력하고 예약확정 버튼을 눌렀을 때 /nbMemberCotroller/eduOrder.me 호출 -->
	<form method = "post" action="<%=contextPath%>/nbOrder/eduOrder.od" id="form">	
	<div id = "reservationBox" >
		<div id = "reservationFormWrapper">
			<div id = "mem_box">
				<div id = "mem_title">
					<h3 id="h3title">- 회원 예약 정보 -</h3>
				</div>
				<div id = "member_check">
					<a id ="membercheck" class = btn href="">내 정보 수정하기</a>
				</div>
				<div id = "memData">
					<a type="text">아이디<input id = "mem_id" name = "mem_id" type="text"  readonly="readonly" value="<%=mem_id%>"/></a>
					<a type="text">이름<input id = "mem_name" name = "mem_name" type="text"  readonly="readonly" value="<%=mem_name%>" /></a>
					<a type="text">&nbsp;&nbsp;전화번호<input id = "mem_hp" name = "mem_hp" type="text"  value="<%=mem_hp%>" readonly="readonly" /></a>
					<a type="text">이메일<input id = "mem_email" name = "mem_email" type="text"  value="<%=mem_email%>" readonly="readonly" /></a>
				</div>
				<div id = "memAddress">
					<div id = "address_check">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소<a style="display : none;" id ="addresscheck" class = btn href="" onclick="Postcode()">우편번호 찾기</a>
					</div>
					<div id = "mem_address">
						<a type="text"><input id = "mem_address1" name = "mem_address1" type ="text" placeholder= "우편번호" value="<%=mem_address1%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address2" name = "mem_address2" type ="text" placeholder= "도로명주소" value="<%=mem_address2%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address3" name = "mem_address3" type ="text" placeholder= "지번주소" value="<%=mem_address3%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address4" name = "mem_address4" type ="text" placeholder= "상세주소" value="<%=mem_address4%>" readonly="readonly" /></a>
						<span id="guide" style="display:none"></span>
					</div>	
				</div>
			</div>
		</div>
		<div id = "reservationPetFormWrapper">
			<div id = "pet_box">
				<div id = "mem_title">
					<h3 id="h3title">- 반려견 예약 정보 -</h3>
				</div>
				<div id = "pet_check">
					<a id ="petcheck" class = btn href="">반려견 정보 가져오기</a>
				</div>
				<div id = "pet_name_box">
					<a id="pet_img_name" type= "text">반려견 사진</a>
				</div>
				<div id= "pet_img_box" >
						<img id="pet_img" name="pet_img"  src="<%=request.getContextPath()%>/nbShop/img/<%=pet_img%>" />
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" value="<%=pet_name%>"placeholder="반려견이름"  />
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" value="<%=pet_type%>" placeholder="반려견종"  />
					</a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text"  value="<%=pet_age%>" placeholder="반려견나이"  />
					</a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" value="<%=pet_weight%>" placeholder="반려견몸무게"  />
					</a>
					<a type= "text">반려견 성별</a>
					<div id="radio">					
						<input id="pet_gender1" type="radio" name="pet_gender" value="남" />남
					</div>
					<div id="radio" >
						<input id="pet_gender2" type="radio" name="pet_gender" value="여" />여
					</div>
				</div>
				<div id ="pet_op_box">
					<a type= "text">중성화 여부</a>
					<div id="radio2">					
						<input id="pet_op1" type="radio" name="pet_op" value="예" />예
					</div>
					<div id="radio2" >
						<input id="pet_op2" type="radio" name="pet_op" value="아니오" />아니오
					</div>
					<div id="radio2" >	
						<input id="pet_op3" type="radio" name="pet_op" value="모름"/>모름
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
					<a id="tr_img_name" type= "text">트레이너 사진<img src="<%=request.getContextPath()%>/nbShop/img/<%=tr_img%>" id = "tr_img" name = "tr_img"  /></a>
				</div>
				
				<div id = "tr_info_box">
					<a id="tr_mem_name">담당 훈련사<input style="color : #5cb85cc7; " id ="tr_mem_name" name = "tr_mem_name" type="text" placeholder="훈련사이름" value="<%=tr_mem_name%>" readonly /></a>
					<a id="tr_mem_hp">전화번호<input id ="tr_mem_hp" name = "tr_mem_hp" type="text" placeholder="전화번호" value=" <%=tr_hp%>" readonly /></a>
					<a id="tr_mem_reg_date">예약신청일<input style="color : #5cb85cc7; " id ="tr_reg_date" name = "tr_reg_date" type="text" placeholder="수강신청일자" value="<%=tr_reg_date%>" readonly /></a>
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
				<div id = "edu_name_box">
					<a id="edu_img_name" type= "text">예약한 반려견이름</a>
				</div>
				<div id = "edu_img_box">	
					<img  src="" id = "edu_img"  />
				</div>
				<div id =  "tr_result_box">
					<div id = "tr_totalcnt_box">
						<a>수강 횟수<input id = "totalcnt" name ="totalcnt" type="text" placeholder="수강 횟수" value = "<%=totalcnt%>" readonly /></a>
					</div>
					<div id = "tr_totalprice_box">
						<a>총 수강 금액<input id = "tr_totalprice" name ="tr_price" type ="text" placeholder="총 수강 금액"  readonly /></a>
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
		
		// 내정보 수정하기를 눌렀을때
		$("#membercheck").on("click", function(){
			
			// 내정보 수정가능하게 바꾸고, 내 우편번호 찾기 버튼 나오게 하기
			$("#mem_id").attr("value", "-").attr("readonly", false);
			$("#mem_name").attr("value", "-").attr("readonly", false);
			$("#mem_hp").attr("value", "-").attr("readonly", false);
			$("#mem_email").attr("value", "-").attr("readonly", false);
			$("#mem_id").attr("value", "-").attr("readonly", false);
			$("#addresscheck").css("display", "initial");
		})
			
			// 강아지 사진의 출처를 저장한 뒤,
			var src = $("#pet_img").attr("src");
			
			console.log(src);
			
			// 예약 반려견으로 바꿔준다.
			$("#edu_img").attr("src", src);
			
		
		// 강아지 이름을 입력하면,
		$("#pet_name").keyup(function(){
			
			// 강아지 이름을 저장한 뒤,
			var pet_name = $("#pet_name").val();

			
			// 예약 반려견명으로 바꿔준다.
			
			$("#edu_img_name").text(pet_name).css("color", "#5cb85cc7");
		})
		
		
		// 최종금액에 콤마단위가 들어간 금액으로 설정
		$("#tr_totalprice").attr("value", tr_totalprice2);
        
		// id 값이 back인 버튼을 클릭했을 때
		$("#nb_backbtn").on("click", function(){
			
			 // 이전 페이지로 이동하게 한다.
			 history.back();
			 
		});

	});
	
	// 리퀘스트로 받아온 금액을
	var original = <%=tr_totalprice%>;
	
	// 정규표현식으로 3자리숫자당 콤마로 구분한다.
	var tr_totalprice2 = original.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	
// 	 강아지 사진 업로드 시 썸네일 형식의 미리보기 만들기
// 	function setThumbnail(event) {
// 	  var reader = new FileReader();

// 	  reader.onload = function(event) {
// 	    var img = document.createElement("img");
// 	    img.setAttribute("src", event.target.result);
// 	    document.querySelector("#pet_img_box").appendChild(img);
// 	  };

// 	  reader.readAsDataURL(event.target.files[0]);
// 	}
	
	

</script>
<script
src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
crossorigin="anonymous"></script>
	<%-- 카카오 우편번호 API --%>	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function Postcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('mem_address1').value = data.zonecode;
	                document.getElementById("mem_address2").value = roadAddr;
	                document.getElementById("mem_address3").value = data.jibunAddress;
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("mem_address4").value = extraRoadAddr;//위로옮김
	                } 
	
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
	</script>	
</form>
</body>
</html>