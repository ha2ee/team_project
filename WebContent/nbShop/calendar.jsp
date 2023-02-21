<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 날짜 정보를 불러오고, SimpleDateForamt 메소드로 월만 가져온다
	Date MonthDate = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("MM월");

%>
<!DOCTYPE html>
<html>
<head> 
<style>

/* 	달력을 출력해줄 CSS 설정 */

<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        
        달력 안에 마우스가 지나갈때 마다 CSS 설정
        
        td.mon, td.tue, td.wed, td.thu, td.fri, td.sat, td.sun {
        
        
        }
        
        td.mon:hover, td.tue:hover, td.wed:hover, td.thu:hover, td.fri:hover, td.sat:hover, td.sun:hover {
       	
       	background : #ffebcd;
        
        }
        
        
        a#prev, a#next {
        font-size: 20px;
        background : #cccccc21;
        border-radius : 15px;
        margin : 0 10px;
        
        }
        
        a#prev:hover, a#next:hover {
     	background : #ffebcd;
     	
        }

        div#calAndTable {
        
        	border : 1px solid red;
         	position : relative;
         	width : 1200px;
         	height : 780px;
         	margin : 0 auto 0 auto;
         	left: 0;
         	right : 0;
         	top : 50px;
        }

        div#calWrapper {
        	position : relative;
            width: 600px;
            height: 600px;
            border: 1px solid black;
            margin: 0 auto 0 auto;
            left : -270px;
            top : 30px;
            border : ridge;
            
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
       		margin : 0 auto 0 auto;
       		font-size : 20px;
       		left : 410px;
       		right : 0;
       		top : -140px;
       		width: 100%;
       		height : 150px;
       		
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
        

        div#upper_menu {
       		background : #ffebcd;
        	position : relative;
            width: 100%;
            height: 50px;
            border-bottom: 1px solid black;
            text-align: center;
            left : 0;
            right : 0;
            border : ridge;
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

        div#period {
            border: 1px solid black;
            width: 100px;
            height: 25px;
            text-align: right;
            background-color: rgb(223, 219, 219);
            margin-top: 12.5px;
        }

        input[type="date"] {
            width: 125px;
            height: 25px;
            margin-top: 12.5px;
        }

        div#betweenDate {
            margin-top: 12.5px;
        }

        button#searchButton {
            width: 70px;
            height: 25px;
            font-size: 1.1rem;
            margin-top: 12.5px;
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

        div#betweenDate {
            margin-left: -20px;
            margin-right: -20px;
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
        
       div#notice > div{
        
        	position : relative;
        	font-size : 18px;
        	margin : 5px auto;
        	left : 0;
 	        top : 0;
        	right : 0;
        	padding : 10px;
        	
        }

        div#calendar {
        	position : relative;
            width: 90%;
            height: 350px;
            margin: 0 auto;
            left: 0;
            right: 0;
            top : 10px;
            border : ridge;
        }
        
        div#calendar > table {
           border :  1px solid rgb(0 0 0 / 8%);
        }

        div#pnButtonWrapper {
            width: 100%;
            margin: 0 auto;
       		position : relative;
       		height : 50px;     
       		top : 25px;
       		left : 0;
       		right : 0;
       		
        }

        div#pnButtonWrapper > a {
        
            padding : 10px;
        }

        div#selectedDateWrapper {
            text-align: center;
        }

        div#submitButtonWrapper {
            display: flex;
            flex-direction: row-reverse;
        }

        button#submit {
            width: 80px;
            height: 40px;
            font-size: 1.3rem;
            font-weight: 550;
            margin-right: 50px;
            margin-top: 20px;
        }

        td {
            width: calc(100%/7);
            font-weight: 550;
            height: 45px;
        }

        td.sun {
            color: red;
        }

        td.sat {
            color: blue;
        }

        table {
            width: 100%;
            height: 100%;
            text-align: center;
        }

        tr:first-child {
            height: 45px;
            background-color: #cccccc21;
        }

        div#tableWrapper {
        	position : relative;
            margin: 0 auto 0 auto;
            width: 500px;
            height:600px;
            border: 1px solid black;
            overflow: auto;
            top : -570px;
            left : 320px;
            border : ridge;
        }

        div.table {
        
       		position : relative;
            display : flex;
            margin : 0 auto;
            width : 100%;
            height : 9%;
            border : ridge;
        }

        div.table div {
            width: calc(100% / 3);
            height:46px;
            line-height: 30px;
            text-align: center;
            blackground : #ffebcd;
            color : black;
        }

/*         div.table div:nth-child(2) { */
/*             border-left: 1px solid black; */
/*             border-right: 1px solid black; */
/*         } */

/*         div.table:nth-child(2n) div { */
/*             background-color: rgb(159, 206, 206); */
/*         } */

/*         div.table:nth-child(2n+1) div { */
/*             background-color: rgb(228, 240, 240); */
/*         } */

         div.table:first-child div { 
             background-color: #ffebcd;
             color: black; 
             font-weight: 550; 
         } 

/*         div.table:first-child div{ */
/*             height:50px; */
/*             line-height: 50px; */
/*             font-size: 1.1rem; */
/*         } */

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        img {
            width:40px;
            height:40px;
        }

        div#iconWrapper {
            width:200px;
            margin: 0 auto;
            margin-bottom: 20px;
        }
        
        #tr_Month {
        width : 180px;
        border-radius : 15px;
        background :  #ffebcd;	
        
        }

</style>

<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<!-- 캘린더 넣기 -->

   <h1>예약 가능 일자 선택하기</h1>

    <div id="calAndTable">
    <!-- 캘린더 전체 Wrapper -->
    <div id="calWrapper">

<!--         상단 날짜 조회 메뉴 -->
        <div id="upper_menu">
        	<div id="tr_name"><h3>??? 훈련사님 예약 스케쥴표</h3></div>
<!--             <div id="period"><span style="color:red">*</span> 기간</div> -->
<!--             <input type="date" id="firstDate"> -->
<!--             <div id="betweenDate">~</div> -->
<!--             <input type="date" id="secondDate"> -->
<!--             <button id="searchButton">조회</button> -->
        </div>

        <!-- 달력 상단 년, 월 -->
        <div id = "notice">
        <div id="dateTitle"> * 오늘 기준으로 일주일 뒤부터, 그리고 한달 뒤 까지 예약 가능합니다 *</div>
		<div id = "tr_Month"><%=sdf.format(MonthDate)%></div>
		</div>	
        <!-- 달력 -->
        <div id="calendar">
            <table border="1">
                <tr>
                    
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td>토</td>
                    <td>일</td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
                <tr>
                    <td class="mon"></td>
                    <td class="tue"></td>
                    <td class="wed"></td>
                    <td class="thu"></td>
                    <td class="fri"></td>
                    <td class="sat"></td>
                    <td class="sun"></td>
                </tr>
            </table>
        </div>

        <!-- 달력 하단 이전, 다음 버튼 -->
        <div id="pnButtonWrapper"><a id="prev" class="btn">이전</a><a  id="next" class="btn">다음</a></div>

        <!-- 적용 버튼 -->
<!--         <div id="submitButtonWrapper"><button id="submit">적용</button></div> -->

    </div>

	<!-- 	우측에 결과 값 테이블 -->
    <div id="tableWrapper">
        <div class="table" id="tableHeader">
            <div><h4>날짜</h4></div>
            <div><h4>요일</h4></div>
            <div><h4>횟수</h4></div>
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
</div>






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
	  
	  
	  
	 <br>
	 <br>
<script>

// 함수 생성 (다음 버튼을 눌렀을때 현재월 기준 다음달로 넘기기) and (바로 이전 버튼 눌렀을때는 작동하지 않고, 다음 눌리고 난뒤에 작동 시키기)
$(document).ready(function(){
	$("#next").on("click", function(){
		<% MonthDate.setMonth(MonthDate.getMonth() +1); %>
		$("#tr_Month").text("<%=sdf.format(MonthDate)%>");
	})
	
	$("#prev").on("click", function(){
		<% MonthDate.setMonth(MonthDate.getMonth() -1); %>
		$("#tr_Month").text("<%=sdf.format(MonthDate)%>");
	})
	
})


</script>	 
</body>
</html>