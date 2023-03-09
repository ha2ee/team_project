<%@page import="VO.PetVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Session내장객체 메모리 영역에 session값 얻기
	String id_ = (String)session.getAttribute("id");
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
	// 1-1) 보여질 수강 데이터 변수에 저장
	String res_date1 = request.getParameter("selectDay1");
	String res_date2 = request.getParameter("selectDay2");
	String res_date3 = request.getParameter("selectDay3");
	String res_date4 = request.getParameter("selectDay4");
	String res_date5 = request.getParameter("selectDay5");
	String res_date6 = request.getParameter("selectDay6");
	String res_date7 = request.getParameter("selectDay7");
	
	// 총 수강 횟수 가져와서 변수에 저장
	String totalcnt = request.getParameter("totalcnt");
	// 총 수강 금액 가져와서 변수에 저장
	String tr_totalprice = request.getParameter("totalprice");
	// 선택 된 트레이너 가져와서 변수에 저장
	String tr_mem_name = request.getParameter("tr_name");
	// 선택 된 트레이너의 금액을 가져와서 변수에 저장
	String tr_price = request.getParameter("tr_price");
	
	// 2) 트레이너 데이터
	// TrainerVo에 저장한 tr_hp와, tr_img를 가져와 변수에 저장 시킨다.
	TrainerVo trainervo = (TrainerVo)request.getAttribute("trainervo");
	// 휴대전화번호 변수에 저장
	String tr_hp = trainervo.getTr_hp();
	// 이미지 변수에 저장
	String tr_img = trainervo.getTr_img();
	
	// 3) 회원 데이터
	// MemberVo에 저장한 값들을 가져와 변수에 저장 시킨다.
	MemberVo membervo = (MemberVo)request.getAttribute("membervo");
	// 아이디 저장
	String mem_id = membervo.getMem_id();
	// 이름 저장
	String mem_name = membervo.getMem_name();
	// 전화번호 저장
	String mem_hp = membervo.getMem_hp();
	// 이메일 저장
	String mem_email = membervo.getMem_email();
	// 주소1 저장
	String mem_address1 = membervo.getMem_address1();
	// 주소2 저장
	String mem_address2 = membervo.getMem_address2();
	// 주소3 저장
	String mem_address3 = membervo.getMem_address3();
	// 주소4 저장
	String mem_address4 = membervo.getMem_address4();
	// 주소5 저장
	String mem_address5 = membervo.getMem_address5();
	
	
	// 4) 회원 반려견 데이터 <초기값 설정>
	PetVo petvo;
	// 반려견 사진 저장
	String pet_img;
	// 반려견 이름 저장
	String pet_name;
	// 반려견 견종 저장
	String pet_type;
	// 반려견 나이 저장
	int	pet_age;
	// 반려견 몸무게 저장
	int pet_weight;
	// 반려견 성별 저장
	String pet_gender;
	// 반려견 중성화 여부 저장
	String pet_op;

%>    
    
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
<style>
  #mem_address > a > input#mem_address5::placeholder {
  color : #ccc;
  font-weight: bold;
  
  }
  
   #pet_info_box > a > input::placeholder {
  color : #ccc;
  font-weight: bold;
  font-size : 12px;
  
  }
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
	<input type="hidden" name="pet_img"  />
	<input type="hidden" name="tr_img"	value="<%=tr_img %>" />
	<div id = "reservationBox" >
		<div id = "reservationFormWrapper">
			<div id = "mem_box">
				<div id = "mem_title">
					<h3 id="h3title">- 회원 예약 정보 -</h3>
				</div>
				<div id = "member_check">
					<a id ="membercheck" class = btn href="#">예약 정보 수정하기</a>
				</div>
				<div id = "memData">
					<a type="text">아이디<input id = "mem_id" name = "edu_id" type="text"  readonly="readonly" value="<%=mem_id%>"/></a>
					<a type="text">이름<input id = "mem_name" name = "edu_name" type="text"  readonly="readonly" value="<%=mem_name%>" /></a>
					<a type="text">&nbsp;&nbsp;전화번호<input id = "mem_hp" name = "edu_hp" type="text"  value="<%=mem_hp%>" readonly="readonly" /></a>
					<a type="text">이메일<input id = "mem_email" name = "edu_email" type="text"  value="<%=mem_email%>" readonly="readonly" /></a>
				</div>
				<div id = "memAddress">
					<div id = "address_check">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주소<a style="display : none;" id ="addresscheck" class = btn  onclick="Postcode()">우편번호 찾기</a>
					</div>
					<div id = "mem_address">
						<a type="text"><input id = "mem_address1" name = "edu_address1" type ="text" placeholder= "우편번호" value="<%=mem_address1%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address2" name = "edu_address2" type ="text" placeholder= "도로명주소" value="<%=mem_address2%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address3" name = "edu_address3" type ="text" placeholder= "지번주소" value="<%=mem_address3%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address4" name = "edu_address4" type ="text" placeholder= "참고주소" value="<%=mem_address4%>" readonly="readonly" /></a>
						<a type="text"><input id = "mem_address5" name = "edu_address5" type ="text" placeholder= '"상세주소 입력바람"' value="<%=mem_address5%>"  readonly="readonly" /></a>
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
					<a id ="petcheck1" class = btn >반려견 정보 추가하기</a>
					<a id ="petcheck2" class = btn onclick="openChild()">반려견 정보 가져오기</a>
					<input type="hidden" id="pInput" name="id" value="<%=id_%>"/>
				</div>
				<div id = "pet_name_box">
					<a id="pet_img_name" type= "text">반려견 사진</a>
				</div>
				<div id= "pet_img_box" >
						<img id="pet_img"  src="<%=request.getContextPath()%>/images/example.png" />
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" value="" placeholder="이름을 입력해주세요"  />
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" value="" placeholder="ex) 푸들..믹스..웰시코기 등등"   />
					</a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text"  value="" placeholder="숫자로 입력해주세요"   />
					</a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" value="" placeholder="숫자로 입력해주세요"   />
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
					<a id="tr_img_name" type= "text">트레이너 사진<img src="<%=request.getContextPath()%>/nbShop/img/<%=tr_img%>" id = "tr_img" /></a>
				</div>
				
				<div id = "tr_info_box">
					<a id="tr_mem_name">담당 훈련사<input style="color : #5cb85cc7; " id ="tr_mem_name" name = "tr_name" type="text" placeholder="훈련사이름" value="<%=tr_mem_name%>" readonly /></a>
					<a id="tr_mem_hp">전화번호<input id ="tr_mem_hp" name = "tr_hp" type="text" placeholder="전화번호" value=" <%=tr_hp%>" readonly /></a>
					<a id="tr_mem_reg_date">예약신청일<input style="color : #5cb85cc7; " id ="tr_reg_date" name = "tr_mem_reg_date" type="text" placeholder="수강신청일자" value="" readonly /></a>
				</div>
				<div id = "tr_date_box">
					<a id= "tr_date_title">수강예약일</a>
					<input id ="tr_date1" type="text" placeholder="첫번째 예약일" value="<%=res_date1%>" readonly />
					<input id ="tr_date2" type="text" placeholder="두번째 예약일" value="<%=res_date2%>" readonly />
					<input id ="tr_date3" type="text" placeholder="세번째 예약일" value="<%=res_date3%>"  readonly />
					<input id ="tr_date4" type="text" placeholder="네번째 예약일" value="<%=res_date4%>"  readonly />
					<input id ="tr_date5" type="text" placeholder="다섯번째 예약일" value="<%=res_date5%>"  readonly />
					<input id ="tr_date6" type="text" placeholder="여섯번째 예약일" value="<%=res_date6%>"  readonly />
					<input id ="tr_date7" type="text" placeholder="일곱번째 예약일" value="<%=res_date7%>"  readonly />
					<!-- 	보여질 수강 데이터 -->
					<input  name = "date1" type="hidden" value="<%=tr_date1%>" readonly />
					<input  name = "date2" type="hidden" value="<%=tr_date2%>" readonly />
					<input  name = "date3" type="hidden" value="<%=tr_date3%>"  readonly />
					<input  name = "date4" type="hidden" value="<%=tr_date4%>"  readonly />
					<input  name = "date5" type="hidden" value="<%=tr_date5%>"  readonly />
					<input  name = "date6" type="hidden" value="<%=tr_date6%>"  readonly />
					<input  name = "date7" type="hidden" value="<%=tr_date7%>"  readonly />
				</div>
				<div id = "edu_name_box">
					<a type= "text">반려견 이름<input id = "edu_img_name" name = "edu_name" type="text" value="" placeholder="이름"  readonly /></a>
				</div>
				<div id = "edu_img_box">	
					<img  src="<%=request.getContextPath()%>/images/example.png" id = "edu_img" name="pet_img"  />
				</div>
				<div id =  "tr_result_box">
					<div id = "tr_totalcnt_box">
						<a>수강 횟수<input id = "totalcnt" name ="edu_cnt" type="text" placeholder="수강 횟수" value = "<%=totalcnt%>" readonly /></a>
					</div>
					<div id = "tr_totalprice_box">
						<a>총 수강 금액<input id = "tr_totalprice" name ="edu_totalprice" type ="text" placeholder="총 수강 금액"  readonly /></a>
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

// 팝업창 띄우기

var openWindow;

function openChild() {
	
	alert("팝업창이 열립니다");
	
	window.name = "parentForm";
	
	var popupX = (window.screen.width/2)-(750/2);
	var popupY = (window.screen.height/2)-(500/2);
	
	openWindow = window.open("<%=request.getContextPath()%>/nbOrder/petUpdate.od", "childForm", "height=500, width=750, left="+popupX+", top="+popupY+", screenX="+popupX+", screenY="+popupY+" resizable=no, scrollbars=no");
	
}
	
	// jquery 호출 옵션 
	$(document).ready(function(){
		
		
		
		
		// 반려견 정보 추가하기 메소드 
		// 1)처음 페이지에 왔을 때 펫 정보 입력문구를 보이지 않게 한다.
		$("#pet_img_name").css("display", "none");
		$("#pet_img_box").css("display", "none");
		$("#pet_info_box").css("display", "none");
		$("#pet_op_box").css("display", "none");

		
		
		// 2) 반려견 정보 추가하기 버튼을 눌렸을 때 입력문구가 나오게 한다.
		
		$("#petcheck1").on("click", function(){
			
			
			alert("빠짐 없이 입력 해주세요~!")
			$("#pet_img_name").css("display", "block");
			$("#pet_img_box").css("display", "block");
			$("#pet_info_box").css("display", "block");
			$("#pet_op_box").css("display", "block");

		
		})
	
		// 3) 반려견 정보 가져오기 버튼을 눌렸을 때 팝업창이 나오게 한다.
		
		var openwindow;
	
		
		$("#petcheck2").on("click", function(){
			
			$("#pet_img_name").css("display", "block");
			$("#pet_img_box").css("display", "block");
			$("#pet_info_box").css("display", "block");
			$("#pet_op_box").css("display", "block");
			
		})
		
		
		var date = new Date();
		var reg_date = moment(date).format('LL');
		
		$("#tr_reg_date").attr("value" , reg_date);
		

		
		// 내정보 수정하기를 눌렀을때
		$("#membercheck").on("click", function(){
			
			// 내정보 수정가능하게 바꾸고, 내 우편번호 찾기 버튼 나오게 하기
			$("#mem_name").attr("value", "").attr("readonly", false);
			$("#mem_hp").attr("value", "").attr("readonly", false);
			$("#mem_email").attr("value", "").attr("readonly", false);
			$("#mem_address5").attr("value", "").attr("readonly", false);
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
			
			$("#edu_img_name").attr("value", pet_name).css("color", "#5cb85cc7");
		})

		
		// 최종금액에 콤마단위가 들어간 금액으로 설정
		$("#tr_totalprice").attr("value", tr_totalprice2);
        
		// id 값이 back인 버튼을 클릭했을 때
		$("#nb_backbtn").on("click", function(){
			
			 // 이전 페이지로 이동하게 한다.
			 history.back();
			 
		});

		
			

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

	
	// 강아지 사진 업로드 시 썸네일 형식의 미리보기 만들기
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
	<script src="<%=request.getContextPath()%>/js/edu.js"></script>

</form>
</body>
</html>