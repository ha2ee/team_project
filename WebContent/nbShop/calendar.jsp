<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<style>
body {
    color: #000;
    overflow-x: hidden;
    height: 100%;
    background-color: #CE93D8 !important;
    background-repeat: no-repeat;
}

.container-fluid { 
  padding-top: 120px;
  padding-bottom: 120px;
}

input {
    padding: 10px 20px 10px 20px;
    border: 1px solid lightgrey !important;
    border-radius: 6px !important;
    box-sizing: border-box;
    background-color: #fff !important;
    color: #2C3E50;
    font-size: 14px;
    letter-spacing: 1px;
}

input:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #512DA8;
    outline-width: 0;
}

::placeholder {
    color: #BDBDBD;
    opacity: 1;
}

:-ms-input-placeholder {
    color: #BDBDBD;
}

::-ms-input-placeholder {
    color: #BDBDBD;
}

button:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    outline-width: 0;
}

.datepicker {
  background-color: #fff;
  border: none;
}

.datepicker-dropdown {
  top: 0;
  left: 0;
}

.datepicker table tr td.today, span.focused {
  border-radius: 50% !important;
}

thead tr:nth-child(2) {
  background-color: #FF80AB !important;
}

thead tr:nth-child(3) th {
  color: #FF80AB !important;
  padding-top: 20px;
  padding-bottom: 10px;
}

.dow, .old-day, .day, .new-day {
  width: 40px !important;
  height: 40px !important;
  border-radius: 0px !important;
}

.old-day:hover, .day:hover, .new-day:hover, .month:hover, .year:hover, .decade:hover, .century:hover {
  border-radius: 50% !important;
  background-color: #eee;
}

.active {
  border-radius: 50% !important;
  background-image: linear-gradient(#90CAF9, #64B5F6) !important;
  color: #fff !important;
}

.prev, .next, .datepicker-switch {
  border-radius: 0 !important;
  padding: 20px 10px !important;
  text-transform: uppercase;
  font-size: 20px;
  color: #fff;
  opacity: 0.8; 
}

.prev:hover, .next:hover, .datepicker-switch:hover {
  background-color: inherit !important;
  opacity: 1;
}

</style>
<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<div class="container-fluid px-1 px-sm-5 mx-auto">
    <div class="row d-flex justify-content-sm-center px-2">
      <form autocomplete="off">
        <div class="form-group row">
          <input type="text" id="dp1" class="datepicker mr-2" placeholder="Select Date" name="date"><br>
          <button type="submit" class="btn btn-success">Submit</button>
        </div>
      </form>
    </div>
</div>


<table class="table-condensed"><thead><tr><th colspan="7" class="datepicker-title" style="display: block;"></th></tr><tr><th class="prev">«</th><th colspan="5" class="datepicker-switch">April 2023</th><th class="next">»</th></tr>
<tr><th class="dow">일요일</th><th class="dow">월요일</th><th class="dow">화요일</th><th class="dow">수요일</th><th class="dow">목요일</th><th class="dow">금요일</th><th class="dow">토요일</th></tr></thead>
<tbody><tr><td class="old day" data-date="1679788800000">26</td><td class="old day" data-date="1679875200000">27</td>
<td class="old day" data-date="1679961600000">28</td><td class="old day" data-date="1680048000000">29</td>
<td class="old day" data-date="1680134400000">30</td><td class="old day" data-date="1680220800000">31</td>
<td class="day" data-date="1680307200000">1</td></tr><tr><td class="day" data-date="1680393600000">2</td>
<td class="day" data-date="1680480000000">3</td><td class="day" data-date="1680566400000">4</td>
<td class="day" data-date="1680652800000">5</td><td class="day" data-date="1680739200000">6</td>
<td class="day" data-date="1680825600000">7</td><td class="day" data-date="1680912000000">8</td>
</tr><tr><td class="day" data-date="1680998400000">9</td><td class="day" data-date="1681084800000">10</td>
<td class="day" data-date="1681171200000">11</td><td class="day" data-date="1681257600000">12</td>
<td class="day" data-date="1681344000000">13</td><td class="day" data-date="1681430400000">14</td>
<td class="day" data-date="1681516800000">15</td></tr><tr><td class="day" data-date="1681603200000">16</td>
<td class="day" data-date="1681689600000">17</td><td class="day" data-date="1681776000000">18</td>
<td class="day" data-date="1681862400000">19</td><td class="day" data-date="1681948800000">20</td>
<td class="day" data-date="1682035200000">21</td><td class="day" data-date="1682121600000">22</td>
</tr><tr><td class="day" data-date="1682208000000">23</td><td class="day" data-date="1682294400000">24</td>
<td class="day" data-date="1682380800000">25</td><td class="day" data-date="1682467200000">26</td>
<td class="day" data-date="1682553600000">27</td><td class="day" data-date="1682640000000">28</td>
<td class="day" data-date="1682726400000">29</td></tr><tr><td class="day" data-date="1682812800000">30</td>
<td class="new day" data-date="1682899200000">1</td><td class="new day" data-date="1682985600000">2</td>
<td class="new day" data-date="1683072000000">3</td><td class="new day" data-date="1683158400000">4</td>
<td class="new day" data-date="1683244800000">5</td><td class="new day" data-date="1683331200000">6</td></tr></tbody>
<tfoot><tr><th colspan="7" class="today" style="display: none;">Today</th></tr>
<tr><th colspan="7" class="clear" style="display: none;">Clear</th></tr></tfoot></table>


	<br>
	<br>
	<br>
	<br>
	<br>
	
	<!-- 	캘린더  들어갈 항목 -->
	 예약 일정 확인 화면. jsp <br>
	 설명 : 캘린더를 띄워주고, 하단에 가능한 강사를 선택(?), 또는 자동으로 비어있는 강사를 매칭해서 일정 및 금액 확인 페이지로 넘김<br>
	 <br>
	 상단부에 캘린더, 하단부에 캘린더에 원하는 날짜를 클릭 했을때, 훈련사들의 예약내역을 조회 해 와서, 1명이라도 비어있으면 가능하다는 메세지를 띄우고 <br>
	 아무도 없을 경우에는 마감되었다고 메세지를 띄워준다. <br>
	 선택 된 값을 다음 페이지로 전달 시켜서 일정과 금액을 확인시킨다 <br>
	 <br>
	 예약 시작 가능일은 현재 날짜에서 1주일 이후부터 가능 (주문취소,주문수정 가능일이 7일 이내 이기 때문)<br>
	 
	 
	  체크 사항 : 가능한 트레이너를 초이스 하고 일정  배정<br>
	  
	  
	  
	  <a href="<%=request.getContextPath()%>/nb/member.do?center=/nbShop/edu_reservation.jsp" ><button>회원 예약</button></a> / <a href="<%=request.getContextPath()%>/nb/calendar.do?center=/nbShop/calendar.jsp" ><button>예약 초기화</button></a>
	 <br>
	 <br>
	 
<script>	 
$(document).ready(function(){

	$('.datepicker').datepicker({
	    format: 'dd-mm-yyyy',
	    todayHighlight: true,
	    toggleActive: true
	});

	});


	$(function() {
    	$(".datepicker").datepicker();
			$.datepicker.setDefaults({
		        dateFormat: 'yyyymmdd',
		        prevText: '이전 달',
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		        showMonthAfterYear: true,
		        yearSuffix: '년'
		   	});
		});	 
 
</script>
</body>
</html>