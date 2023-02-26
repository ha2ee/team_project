<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String tr_name = request.getParameter("tr_name");
String tr_price = request.getParameter("tr_price");
	
%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<title>일정 예약 페이지</title>
<style type="text/css">


     * {
     margin: 0;
     padding: 0;
     box-sizing: border-box;
     }
     
     #calandtotalWrapper{
        
/*  border : 1px solid red; */
   	position : relative;
   	width : 1200px;
   	height : 780px;
   	margin : 0 auto 0 auto;
   	left: 0;
   	right : 0;
   	top : 50px;
     
    }
     
    #calendarWrapper{
     
	position : relative;
    width: 600px;
    height: 600px;
    margin: 0 auto 0 auto;
    left : -270px;
    top : 40px;
    border-radius: 20px;
    border : ridge;
     
    }
     
	div#notice{
       	
  	width : 100%;
  	height : 50px;
  	position : relative;
  	margin : 0 auto;
  	left : 0;
    top : 0;
  	right : 0;
       	
    }
       
    div#tr_name_box {
 	margin : 0 auto 0 auto;
  	text-align: center;
  	position: relative;
  	top : 0px;
  	left : 0;
  	right : 0;
  	height: 100%;
  	width : 100%;
  	border-radius: 20px;
  	background : #ffebcd;
    }
    
    div#tr_name {
    text-align: center;
    position : relative;
    top : 5px;
    left : 0;
    right : 0;
    height : 100%;
    width : 100%;
    font-size: 23px;

    
    
    }
    
    div#tr_name > input {
    text-align: center;
    margin : 0 auto;
    border : 0px;
    background : #ffebcd;
    width: 150px;
    font-weight : bold;
    
    }
       
    div#dateTitle {
    font-size: 16px;
    text-align: left;
    margin : 0 auto 0 auto;
    position: relative;
    top : 15px;
    left : 30px;
    right : 0px;
    height:50px;
    width:100%;
    color : orangered;
    } 
    
    #titleBox{
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    height: 100%;
    width : 100%;
    }
    
    #calendarTitle {
   	background : #f8f8f8;
    }
    
/*     #calendarTitle:hover { */
/*   	background : #f8f8f8; */
/*     } */
    
    
/*     #calendar >  { */
/*     border :  1px solid rgb(0 0 0 / 8%); */
/*     }  */
       
     
   	.scriptCalendar {
  	position : relative;
    width: 90%;
    height: 350px;
    margin: 0 auto;
    left: 0;
    right: 0;
    top : 70px;
    border : none;
    text-align: center;
    }
     
    #ButtonWrapper {
    width: 100%;
    margin: 0 auto;
	position : absolute;
	height : 50px;     
	top : 530px;
	left : 0;
	right : 0;
   		
    }
        
    #Btnbox{
        width: 590px;
        margin: 0 auto;
   		position : relative;
   		height : 100%;     
   		top : 0;
   		left : 0;
   		right : 0;
    
    }
    
    
    #Btnbox > a {
    
    position : relative;
    top: 0;
    left: 0;
    right: 0;
    font-size: 23px;
    background : #cccccc21;
    border-radius : 15px;
    margin : 0 10px;
    
    }
    
    
    #Btnbox > a:hover {
 	background : #ffebcd;
 	
    }
    
    #totalBox{
        
	position : absolute;
    margin: 0 auto 0 auto;
    width: 500px;
    height:600px;
    overflow: hidden;
    top : 40px;
    left : 670px;
    border : ridge;
    border-radius: 20px;
    }
    
    #tableSelect{

	position : relative;
    margin : 0 auto;
    width : 100%;
    height : 52px;
    border : none;
    border-radius: 20px;
    left : 0;
    right : 0;
    top : 0;	
	}

	#selectHeader{
    width: 100%;
    height:100%;
    line-height: 30px;
    text-align: center;
    background : #ffebcd;
    color : black;
    position : relative;
    border-radius: 20px;
	}
	
	#selectHeader > div {
    width : calc(100% / 3);
    height: 100%;
    float : left;
    font-size : 20px;
    margin : 10px auto;
	}
	
	#result {
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 10px;
	position : relative;
	height: 320px;
	width : 100%;
	}
	
	#result > div {
	position : relative;
    width : calc(100% / 3);
    height: 100%;
    float : left;
    font-size : 14px;
    margin : 0 10px 0 10px;
    border : none;
	}
	
	#result > div > input {
	position : relative;
    margin : 12px auto;
    left:0;
    right:0;
    top:-3px;
    border : 0px;
    border-radius: 5px;
    background : #cccccc21;
    text-align: center;
    font-weight : bold;
    color : steelblue;
    
	}
	
	#result > div#selectDate {
	position : relative;
	left : 0;
	right: 0;
	top : 0;
	margin : 0 auto;
	}
	
	#result > div#selectDow {
	position : relative;
	left : 0;
	right: 0;
	top : 0;
	margin : 0 auto;
	}
	
	#result > div#selectNum {
	position : relative;
	left : 0;
	right: 0;
	top : 0;
	margin : 0 auto;
	}
	
	div#selectNum > input {

	}
	
	#selectResetBox{
	position : relative;
	left : 0;
	right: 0;
	top : 340px;
	margin : 0 auto;
	width: 100%;
	height : 40px;
	}
	
	#selectReset{
	position : relative;
	left : 0;
	right: 0;
	top : 0px;
	margin : 0 auto;
	width: 100%;
	height : 100%;
	
	}
	
	#selectReset > a{
	position : relative;
	left : 0;
	right: 0;
	top : -339px;
	margin : 0 auto;
	width: 150px;
	height : 100%;
	text-align: center;
	font-size: 20px;
	background: #cccccc50;
	
	}
	
	#selectReset > a:hover{
	background : #ffebcd;
	
	}
	
	div#resultBox{
  	position : absolute;
  	margin : 0 auto 0 auto;
  	left : 0;
  	right : 0;
  	top : 440px;
  	width : 100%;
  	height : 150px;
  	
   
   }
 
 	div#totalvalue{
 	font-size : 14px;
 	position : absolute;
 	height : 100%;
 	width : 390px;
 	margin : 0 auto 0 auto;
 	left : 0;
 	top : 0;
 	right : 0;
 	
   }
   
   div#totalvalue > div{
        
/*         	border : 1px solid red; */
 	text-align : right;
 	padding : 10px;
 	border-radius : 10px;
 	background: #cccccc21;
 	margin : 5px auto;
    height : 45px;
    width: 100%;
    position : relative;
    font-weight : bold;    
    }
    
    div#totalvalue > div > input{
        
/*         	border : 1px solid red; */
 	border-radius : 5px;
 	margin : 0 auto;
    height : 100%;
    width: 60%;
    position : relative;
    border : 0px;    
    font-weight : bold;
    color : indianred;
    }
    
    div#btnBox2{
	  
  	position : relative;
  	height : 50px;
  	width : 100%;
  	margin : 0 auto 0 auto;
  	left : 0;
  	top : -40px;
  	right:0;
	  
  	}
        
    div#totalvalue > div{
        
/*  border : 1px solid red; */
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
	left : 15px;
	right : 0;
	top : 0;
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
    
    #Totalsubmit > button {
    
   	background : #cccccc21; 
	border-radius : 20px;
	margin : 0 10px;
	font-size : 22px;
	touch-action : manipulation;
    
    }
    
    #Totalsubmit > button:hover {
    
	background : #ffebcd;
	border-radius : 20px;
	font-size : 22px;
    transition : 0.5s;
    }
    
    tbody > tr > td:first-child {
    	color : red;
    	pointer-events : none;
    }
    
    tbody > tr >td:last-child {
    	color : blue;
    }
    
     
    a { color:#000000;text-decoration:none; }
    .scriptCalendar > thead > tr > td { width:50px;height:50px; }
    .scriptCalendar > thead > tr:first-child > td { font-weight:bold; }
    .scriptCalendar > thead > tr:last-child > td { background-color:#f8f8f8; }
    .scriptCalendar > tbody > tr > td { width:50px;height:50px; border:1px solid white; border-radius : 5px;}
    .btn:hover > button {background : #ffebcd; }

</style>
<script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
    });

    var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
    var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할
    var realMonth = today.getMonth()+1;
    var resultcnt = 0;
    var resultprice = 0;
    var totalresult = <%=tr_price%>;
    
    var clickday = 0;
    var clickmonth = $("#calMonth").text();
    var clickyear = today.getFullYear();
	var clickdate = 0;




    
    /**
     * @brief   이전달 버튼 클릭
     */
    function prevCalendar() {

		
    	// 현재월이 전월보다 클 경우, 얼러트를 띄우고 빠져나가게 한다.
        if(today.getMonth() < realMonth){
        	alert("수강 예약은 당일기준 7일 이후 부터 가능합니다 (예약관리)");
        	return false;

        }
    	this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        buildCalendar();    // @param 전월 캘린더 출력 요청
    	
    }

    /**
     * @brief   다음달 버튼 클릭
     */
    function nextCalendar() {
    	if(today.getMonth()+1 == (realMonth +1)){
    		
    		// 금일기준 30일 이하로만 가능하다
    		alert('수강 예약은 "당일 + 한달이전!"까지만 가능합니다');
    		return false;
    		
    	}
        this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        buildCalendar();    // @param 명월 캘린더 출력 요청

    }

    /**
     * @brief   캘린더 오픈
     * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
     */
    function buildCalendar() {

        var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        var tbCalendar = document.querySelector(".scriptCalendar > tbody");

        document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
        document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월


        // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
        while(tbCalendar.rows.length > 0) {
            tbCalendar.deleteRow(tbCalendar.rows.length - 1);
        }


        // @param 첫번째 개행
        var row = tbCalendar.insertRow();



        // @param 날짜가 표기될 열의 증가값
        var dom = 1;

        // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
        //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
        var daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

        // @param 달력 출력
        // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
        for(var day = 1 - doMonth.getDay(); daysLength >= day; day++) {

            var column = row.insertCell();


            // @param 평일( 전월일과 익월일의 데이터 제외 )
            if(Math.sign(day) == 1 && lastDate.getDate() >= day) {


                // @param 평일 날짜 데이터 삽입

                column.innerText = autoLeftPad(day, 2);
                


                // @param 일요일인 경우
                if(dom % 7 == 1) {
                    column.style.color = "#FF4D4D";
                }

                // @param 토요일인 경우
                if(dom % 7 == 0) {
                    column.style.color = "#4D4DFF";
                    row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                }

            }

            // @param 평일 전월일과 익월일의 데이터 날짜변경
            else {
                var exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                column.style.color = "#E5E5E5";
            }

            // @brief   전월, 명월 음영처리
            // @details 현재년과 선택 년도가 같은경우
            if(today.getFullYear() == date.getFullYear()) {

                // @details 현재월과 선택월이 같은경우
                if(today.getMonth() == date.getMonth()) {

                    // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                    if(date.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#ffffff";
                        column.style.color = "E5E5E5";
                    }

                    // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                    else if(date.getDate() < day && lastDate.getDate() >= day) {
                        column.style.color = "#E5E5E5";                
                   
                    // 현재일 +6일 뒤 부터 선택 가능하게 만듬
                    }else if((date.getDate()+6) < day ) {

                        column.style.backgroundColor = "#f8f8f8";
                        column.style.color = "";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }    
                    	
                    	
                    }
                    // @details 현재일인 경우
                    else if(date.getDate() == day) {
                        column.style.backgroundColor = "#ffebcd";
                    }

                // @details 현재월보다 이전인경우
                } else if(today.getMonth() < date.getMonth()) {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#ffffff";
                        column.style.color = "E5E5E5";
                    }
                }

                // @details 현재월보다 이후인경우
                else {
                    if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#f8f8f8";
                        column.style.cursor = "pointer";
                        column.onclick = function(){ calendarChoiceDay(this); }
                    }
                }
            }

            // @details 선택한년도가 현재년도보다 작은경우
            else if(today.getFullYear() < date.getFullYear()) {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#ffffff";
                    column.style.color = "E5E5E5";
                }
            }

            // @details 선택한년도가 현재년도보다 큰경우
            else {
                if(Math.sign(day) == 1 && day <= lastDate.getDate()) {
                    column.style.backgroundColor = "#FFFFFF";
                    column.style.cursor = "pointer";
                    column.onclick = function(){ calendarChoiceDay(this); }
                }
            }


            dom++;

        }
    }

    /**
     * @brief   날짜 선택
     * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
     */
    function calendarChoiceDay(column) {
    	


    	
        // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
        if(document.getElementsByClassName("choiceDay")[0]) {
            document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "##00ff9575";
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
        }

        // @param 선택일 체크 표시
        column.style.backgroundColor = "##00ff9575";


        // @param 선택일 클래스명 변경
        column.classList.add("choiceDay");
        
        clickmonth = $("#calMonth").text();
        clickyear = today.getFullYear();
        clickday = $(".choiceDay").text();
        clickdate = clickyear+"-"+clickmonth+"-"+clickday;
        
        
        // @현재요일 구하기
        var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
		var clickdow = new Date(clickdate).getDay();
		var todayLabel = week[clickdow];
        console.log(todayLabel);
        
           
           //첫번째 예약란이 빈공백이면,
           if($("#selectDate1").val() == ""){
        	   
        	   resultcnt++;
        	   resultprice = <%=tr_price%>;
        	   totalresult = resultcnt * resultprice;
        	   
	   	        // 첫번째 예약 날짜에 입력 시킨다.
	           	$("#selectDate1").attr("value", clickdate);
	   	        $("#dow1").attr("value", todayLabel);
	   	        $("#Num1").attr("value", "1");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	        $("#tr_price > input").attr("value", resultprice);
	   	        $("#tr_totalprice > input").attr("value", totalresult);
	   	        $(".choiceDay").css("cursor", "text");
	   	        $(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	   	
	   	     return false;
	   	   
	       //두번째 예약란이 공백일때
           }else if($("#selectDate2").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
	   	        
        	   // 두번째 예약 날짜에 입력 시킨다.
	           	$("#selectDate2").attr("value", clickdate);
	           	$("#dow2").attr("value", todayLabel);
	           	$("#Num2").attr("value", "2");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
   	       		$(".choiceDay").css("background", "#00ff9575");
   	       		
   	       	return false;
   	       		
 	       //세번째 예약란이 공백일때
           }else if($("#selectDate3").val() == ""){
	   	        
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   
        	   // 세번째 예약 날짜에 입력 시킨다.
	           	$("#selectDate3").attr("value", clickdate);
	           	$("#dow3").attr("value", todayLabel);
	           	$("#Num3").attr("value", "3");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	       
   	       return false;    
	   	        
  	       //네번째 예약란이 공백일때
           }else if($("#selectDate4").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
	   	        
        	   // 네번째 예약 날짜에 입력 시킨다.
	           	$("#selectDate4").attr("value", clickdate);
	           	$("#dow4").attr("value", todayLabel);
	           	$("#Num4").attr("value", "4");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	        
   	     	return false;     
	   	        
  	       //다섯번째 예약란이 공백일때
           }else if($("#selectDate5").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
	   	        
        	   // 다섯번째 예약 날짜에 입력 시킨다.
	           	$("#selectDate5").attr("value", clickdate);
	           	$("#dow5").attr("value", todayLabel);
	           	$("#Num5").attr("value", "5");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
		  	   
   	    	 return false;
	   	        
  	       //여섯번째 예약란이 공백일때
           }else if($("#selectDate6").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
	        
	 	  		 // 여섯번째 예약 날짜에 입력 시킨다.
	        	$("#selectDate6").attr("value", clickdate);
	        	$("#dow6").attr("value", todayLabel);
	        	$("#Num6").attr("value", "6");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	   
   	    	 return false;     
	   	        
  	       //일곱번째 예약란이 공백일때
           }else if($("#selectDate7").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        
	  		 	// 여섯번째 예약 날짜에 입력 시킨다.
	   			$("#selectDate7").attr("value", clickdate);
	   			$("#dow7").attr("value", todayLabel);
	   			$("#Num7").attr("value", "7");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", resultprice);
	   	    	$("#tr_totalprice > input").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	        
	   	     return false;     
	   	        
			}else if($("#selectDate7").val() != ""){
				
				alert("최대 7회까지 예약가능합니다");
				
				return false;
			}


    }

    /**
     * @brief   숫자 두자릿수( 00 ) 변경
     * @details 자릿수가 한자리인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
     * @param   num     앞에 0을 붙일 숫자 값
     * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
     */
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join("0") + num;
        }
        return num;
    }
    
    
    $(document).ready(function(){
    	
    	$("#resetbtn").on("click",function(){
    		
    		$("#result > div > input").attr("value", "");
   	        $("#totalcnt > input").attr("value", "");
   	    	$("#tr_price > input").attr("value", "");
   	    	$("#tr_totalprice > input").attr("value", "");
   	    	resultcnt = 0;
   	    	totalresult = 0;
    		
    	})
    	
    	$("#submitbtn").on("click", function(){
    		
    		if($("#selectDate1").val() == ""){
    			
    			alert("최소 1회의 수강을 선택하셔야합니다");
    			
    			return false;
    		}
    	})
    	
    })
    

</script>
</head>
<body>
<form action ="<%=request.getContextPath()%>/nb/edureservation.do">

<!-- 캘린더 넣기 -->
<div id = "calandtotalWrapper">
	<div id = "calendarWrapper">

<!--         상단 날짜 조회 메뉴 -->
        <div id="notice">
        	<div id="tr_name_box">
        		<div id="tr_name">
        			<input type="text" name="tr_name" value="<%=tr_name%>" />&nbsp;훈련사님 예약 스케쥴표
        		</div>
       		</div>
        	<div id="dateTitle"> 
        	* "오늘 기준으로 일주일 뒤"부터, 그리고 <strong>"한달 뒤"</strong> 까지 예약 가능 *<br>
        	* "1회"부터 <strong>"최대 7회"</strong>까지 선택 가능합니다. <Strong>(매주 일요일 휴무 )</Strong>*
        	</div>
       	</div>

<table class="scriptCalendar">
    	<thead>
        	<tr id="titleBox">
            	<td id="calendarTitle" colspan="7">
                	<span id="calYear">YYYY</span>년
                	<span id="calMonth">MM</span>월
	            </td>
        	</tr>
        	<tr>
            	<td style="color : red;">일</td>
            	<td>월</td>
            	<td>화</td>
            	<td>수</td>
            	<td>목</td>
            	<td>금</td>
            	<td style="color : blue;">토</td>
        	</tr>
    	</thead>
    		<tbody>
    		</tbody>
	</table>
<!-- 달력 하단 이전, 다음 버튼 -->
       	<div id="ButtonWrapper">
           <div id ="Btnbox">
        	<a id="prev" class="btn" onclick="prevCalendar();">이전</a>
        	<a  id="next" class="btn" onclick="nextCalendar();">다음</a>
           </div>
        </div>
   	</div>	
	
<!--      	우측에 결과 값 테이블 -->
  	<div id = "totalBox">
      <div id="tableSelect">
        <div id="selectHeader">
            <div>날짜</div>
            <div>요일</div>
            <div>횟수</div>
        </div>
        	<div id="result">
        		<div id="selectDate">
	        		<input id="selectDate1" name="date1" type="text"  readonly="readonly"/>
	        		<input id="selectDate2" name="date2" type="text"  readonly="readonly"/>
	        		<input id="selectDate3" name="date3" type="text"  readonly="readonly"/>
	        		<input id="selectDate4" name="date4" type="text"  readonly="readonly"/>
	        		<input id="selectDate5" name="date5" type="text"  readonly="readonly"/>
	        		<input id="selectDate6" name="date6" type="text"  readonly="readonly"/>
	        		<input id="selectDate7" name="date7" type="text"  readonly="readonly"/>
        		</div>
        		<div id="selectDow">
	        		<input id="dow1" type="text"  readonly="readonly"/>
	        		<input id="dow2" type="text"  readonly="readonly"/>
	        		<input id="dow3" type="text"  readonly="readonly"/>
	        		<input id="dow4" type="text"  readonly="readonly"/>
	        		<input id="dow5" type="text"  readonly="readonly"/>
	        		<input id="dow6" type="text"  readonly="readonly"/>
	        		<input id="dow7" type="text"  readonly="readonly"/>
        		</div>
        		<div id="selectNum">
	        		<input id="Num1" type="text"  readonly="readonly"/>
	        		<input id="Num2" type="text"  readonly="readonly"/>
	        		<input id="Num3" type="text"  readonly="readonly"/>
	        		<input id="Num4" type="text"  readonly="readonly"/>
	        		<input id="Num5" type="text"  readonly="readonly"/>
	        		<input id="Num6" type="text"  readonly="readonly"/>
	        		<input id="Num7" type="text"  readonly="readonly"/>
        		</div>

        </div>	
        
      </div>
<!--       우측 중단 초기화 버튼 테이블 -->
	<div id="selectResetBox">
		<div id="selectReset">
		<a class = "btn" id="resetbtn" onclick="buildCalendar();">예약 초기화</a>
		</div>
	</div>
  
    
<!--       우측 하단의 요약 테이블 -->
    <div id="resultBox">
        <div id="totalvalue">
            <div id = "totalcnt">수강 횟수 : <input name="totalcnt" style="text-align: right;" type="text"  readonly="readonly">&nbsp;&nbsp;회</div>
            <div id = "tr_price">회당 금액 : <input name="tr_price" style="text-align: right;" type="text"  readonly="readonly" >&nbsp;&nbsp;원</div>
            <div id = "tr_totalprice">총 예약금액 : <input name="totalprice" style="text-align: right;" type="text"  readonly="readonly">&nbsp;&nbsp;원</div>
        </div>
	  </div>
	</div>
</div>
<!-- 	   하단의 3가지 버튼 메뉴 -->
		<div id = "btnBox2">
      		<div id = "Totalsubmit">
         	<a class = "btn" href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp" >이전 페이지로</a> 
         	<button id="submitbtn" type="submit" style="font-weight : 400; padding : 6px 12px; margin : 0 10px; font-size : 22px; border-radius: 20px; border:0px; background : #8f8f8; ">예약 신청</button>
         	<a class = "btn" href="<%=request.getContextPath()%>/nb/Main" >홈으로</a>
        	</div>
        </div>

</form>
</body>
</html>