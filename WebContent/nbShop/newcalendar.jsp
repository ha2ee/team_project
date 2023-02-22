<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 날짜 정보를 불러오고, SimpleDateForamt 메소드로 월만 가져온다
	Date MonthDate = new Date();
	Date dayDate = new Date();
	Date day = dayDate = new Date(dayDate.getYear(), dayDate.getMonth(), 1);
	SimpleDateFormat sdf = new SimpleDateFormat("MM");
	SimpleDateFormat sdf2 = new SimpleDateFormat("dd");
	
	

%>
<!DOCTYPE html>
<html>
<head>

<!--  	달력을 출력해줄 CSS 설정  -->


<!-- 달력 만들기 위한 스크립트 설정  -->
<script type="text/javascript">
var today = new Date();
function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	cnt += 1;
  }

  row = calendarTable.insertRow();

  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	clickedYear = today.getFullYear();
    	clickedMonth = ( 1 + today.getMonth() );
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

    	opener.document.getElementById("date").value = clickedYMD;
    	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}
</script>
<style>

<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
       	#TotalWraper {
        
        	border : 1px solid red;
         	position : relative;
         	width : 1200px;
         	height : 780px;
         	margin : 0 auto 0 auto;
         	left: 0;
         	right : 0;
         	top : 50px;
        }
        
        div#calendarBox {
      	 
        	position : relative;
            width: 600px;
            height: 600px;
            margin: 0 auto 0 auto;
            left : -270px;
            top : 160px;
            border-radius: 20px;
            border : ridge;
            
        }
        
       div#notice{
        	
        	width : 100%;
        	height : 100px;
        	position : relative;
        	margin : 0 auto;
        	left : 0;
 	        top : 0;
        	right : 0;
        	
        }
        
        div#tr_name {
        	margin : 0 auto 0 auto;
        	text-align: center;
        	position: relative;
        	top : -10px;
        	left : 0;
        	right : 0;
        	height: 100%;
        	width : 100%;
        }
        
        div#dateTitle {
            font-size: 17px;
            text-align: center;
            margin : 0 auto 0 auto;
            position: relative;
            top : 10px;
            left : 0px;
            right : 0px;
            color : rgb(255 0 0);
        }
        
		#calendar {
        	position : relative;
            width: 90%;
            height: 350px;
            margin: 0 auto;
            left: 0;
            right: 0;
            top : 10px;
            border : ridge;
        }
        
        #calendarTitle {
        	background : #ffebcd;
        }
        
	    #calendarTitle:hover {
        	background : #ffebcd;
        }
        
        #calendar >  {
           border :  1px solid rgb(0 0 0 / 8%);
        }
        
        
        달력 안에 마우스가 지나갈때 마다 CSS 설정
        
        td.sun, td.mon, td.tue, td.wed, td.thu, td.fri, td.sat {
        background : #cccccc21 !important;

        }
        
        td.sun, td.mon, td.tue, td.wed, td.thu, td.fri, td.sat {
        background : #cccccc21 !important;

        }
        
        td:hover {
       	
       	background : #ffebcd;
        
        }
        
        #ButtonWrapper {
            width: 100%;
            margin: 0 auto;
       		position : relative;
       		height : 114px;     
       		top : 0;
       		left : 0;
       		right : 0;
       		
        }
        
        #Btnbox{
            width: 100%;
            margin: 0 auto;
       		position : relative;
       		height : 100%;     
       		top : 0;
       		left : 0;
       		right : 0;
        
        }
        
        
        #Btnbox > a {
        
        position : relative;
        top: 50px;
        font-size: 23px;
        background : #cccccc21;
        border-radius : 15px;
        margin : 0 10px;
        
        }
        
        
        #Btnbox > a:hover {
     	background : #ffebcd;
     	
        }
        
        
        #SelectWrapper{
        
        	position : relative;
            margin: 0 auto 0 auto;
            width: 500px;
            height:600px;
            border: 1px solid black;
            overflow: auto;
            top : -570px;
            left : 320px;
            border : ridge;
            border-radius: 20px;
        }
        
        #Selectbox{
        
       		position : relative;
            margin : 0 auto;
            width : 100%;
            height : 9%;
            border : ridge;
            border-radius: 20px;
        }
        
        #sbox{
        
            width: 100%;
            height:100%;
            line-height: 30px;
            text-align: center;
            background : #ffebcd;
            color : black;
            position : relative;
            border-radius: 20px;
            
        
        }
        
        
        #sbox > div {
       	    width : calc(100% / 3);
            height: 100%;
            float : left;
            font-size : 20px;
            margin : 10px auto;
        }
        
        div#TotalWrapper{
        	position : relative;
        	margin : 0 auto 0 auto;
        	left : 0;
        	right : 0;
        	top : -530px;
        	width : 100%;
        	height : 150px;
        	text-align : left;
        	
        
        }
        
        div#totalvalue{
        
        	font-size : 14px;
        	position : relative;
        	height : 100%;
        	width : 390px;
        	margin : 0 auto 0 auto;
        	left : 320px;
        	top : -215px;
        	
        
        }
        
        div#totalvalue > div{
        
/*         	border : 1px solid red; */
        	text-align : right;
        	padding : 10px;
        	border-radius : 10px;
        	background: #cccccc21;
        	margin : 5px auto;
        
        }
        
       div#Totalsubmit {
       		position : relative;
       		margin : 0 auto;
       		font-size : 20px;
       		left : 20px;
       		right : 0;
       		top : -120px;
       		width: 1200px;
       		height : 100%;
       		text-align: center;
       		
       }
       
       div#Totalsubmit > a{
       
        	background : #cccccc21; 
       		border-radius : 20px;
       		margin : 0 10px;
       		font-size : 22px;

       		
       }
       
       div#Totalsubmit > a:hover{

			background : #ffebcd;
       		border-radius : 20px;
       		font-size : 22px;

       		
       }
</style>


<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>

<!-- 캘린더 넣기 -->

   <h1>예약 가능 일자 선택하기</h1>

<div id="TotalWraper">
    <!-- 캘린더 전체 Wrapper -->
    <div id="calendarBox">

<!--         상단 날짜 조회 메뉴 -->
        <div id="notice">
        	<div id="tr_name">
        		<h3>??? 훈련사님 예약 스케쥴표</h3>
       		</div>
        	<div id="dateTitle"> 
        	* 오늘 기준으로 일주일 뒤부터, 그리고 한달 뒤 까지 예약 가능합니다 *
        	</div>
       	</div>
		
		
        <!-- 달력 -->
       <table id = "calendar"  align="center'">
		<tr>
			<td colspan="7" align="center" id="calendarTitle"> m월</td>
		</tr>
		<tr>
			<td class="sun"  align="center"><font color ="#F79DC2">일</td>
			<td class="mon" align="center">월</td>
			<td class="tue"  align="center">화</td>
			<td class="wed" align="center">수</td>
			<td class="thu"  align="center">목</td>
			<td class="fri"   align="center">금</td>
			<td class="sat"  align="center"><font color ="skyblue" >토</td>
		</tr>
			<script type="text/javascript">buildCalendar();</script>
		</table>


        <!-- 달력 하단 이전, 다음 버튼 -->
       	<div id="ButtonWrapper">
           <div id ="Btnbox">
        	<a id="prev" class="btn" onclick="prevCalendar()">이전</a>
        	<a  id="next" class="btn" onclick="nextCalendar()">다음</a>
           </div>
        </div>
   	  </div>	
   </div>

	<!-- 	우측에 결과 값 테이블 -->
	
  <div id="SelectWrapper">
  	<div id= "Selectbox">
        <div id="sbox">
            <div>날짜</div>
            <div>요일</div>
            <div>횟수</div>
        </div>
     </div>
  </div>
</div>

    
    <!-- 하단의 요약 테이블 -->
    <div id="TotalWrapper">
        <div id="totalvalue">
            <div id = "totalcnt">횟수 : <input style="text-align: right;" type="text" value="5" readonly="readonly"></div>
            <div id = "tr_price">금액 : <input style="text-align: right;" type="text" value="???원"readonly="readonly"></div>
            <div id = "tr_totalprice">총 예약금액 : <input style="text-align: right;" type="text" value="???원" readonly="readonly"></div>
        </div>
        <div id = "Totalsubmit">
         <a class = "btn" href="<%=request.getContextPath()%>/nb/calendar.do?center=/nbShop/calendar.jsp" >예약 초기화</a> 
         <a class = "btn" href="<%=request.getContextPath()%>/nb/member.do?center=/nbShop/edu_reservation.jsp" >예약 신청</a>
         <a class = "btn" href="<%=request.getContextPath()%>/nb/Main" >홈으로</a>
        </div>
    </div>
	
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
	  
	 
</body>
</html>