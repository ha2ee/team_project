<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<% request.setCharacterEncoding("UTF-8"); %>
<%
String tr_name = request.getParameter("tr_name");
String tr_price = request.getParameter("tr_price");
//Session내장객체 메모리 영역에 session값 얻기
String id = (String)session.getAttribute("id");

//list를 컨틀롤러에서 받아와서 변수에 저장(예약확정 된 일정)
List<String> list = (List<String>)request.getAttribute("list");

//list2를 컨틀롤러에서 받아와서 변수에 저장(장바구니에 저장 된 일정)
List<String> list2 = (List<String>)request.getAttribute("list2");




%>
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>

<title>일정 예약 페이지</title>
<!--  	 calendar CSS 셋팅 -->
 	<link href="<%=request.getContextPath()%>/css/calendar.css" rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript">

    document.addEventListener("DOMContentLoaded", function() {
        buildCalendar();
    });

    var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
    var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할
    var calday = new Date();
    var realMonth = today.getMonth()+1;
    var resultcnt = 0;
    var resultprice = 0;
    var totalresult = <%=tr_price%>;
    
    var clickday = 0;
    var clickmonth = $("#calMonth").text();
    var clickyear = today.getFullYear();
	var clickdate = 0;

	var regdate = moment(date).format('YYYY-MM-DD');
	var reg_date = moment(date).format('LL');
	
    var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
    var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	var array = [];	

	
	
		
// 	  var hz = document.getElementById('hz');
// 	  if (hz.innerText == "A") {
// 	    hz.innerText = "B";      
// 	  } else if (hz.innerText == "B") {
// 	    hz.innerText = "C";   
// 	  } else {
// 	    hz.innerText = "A";
// 	  }
	
	
    
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
    		// 금일기준 한달 이하로만 가능하다
    		alert('수강 예약은 "D+7일 한달이내" 까지만 가능합니다');
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
    	
    	

         doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
         lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

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
                column.setAttribute('id', "c"+day);
                column.align = "center";


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
                	
            		// 예약 된 날짜를 가져온다.
            		var list = <%=list%>;
            		var list2 = <%=list2%>;
            		
    	    		var monthtoday = new Date(today.getFullYear(), today.getMonth(), today.getDate()+7);
    	    		var mtd = moment(monthtoday).format('DD');
    	    		
            		// for 문을 돌려서 카트에 담긴 날짜와 일치하는 날짜를 가져온다.
            		for(var i =0; i < list2.length; i++){

            			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
            			for(var j=1; j < 32; j++ ){
            				

            				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
            				if(list2[i].toString() == j.toString()) {
            					
            					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
            					
            					// 만약에 현재일+7일보다 낮은 숫자에 예약이 있을경우
           						if(mtd > list2[i]) {
           							
           							if(list2[i] < 10){
           								
           								$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text("0"+list2[i]);
           								
           							}else {
           								$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text(list2[i]);
           								
           							}
           							
                        		}
            				}
           				}
           			}
            		
            		// for 문을 돌려서 예약날짜와 일치하는 날짜를 가져온다.
            		for(var i =0; i < list.length; i++){

            			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
            			for(var j=1; j < 32; j++ ){
            				

            				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
            				if(list[i].toString() == j.toString()) {
            					
            					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
            					
            					// 만약에 현재일+7일보다 낮은 숫자에 예약이 있을경우
           						if(mtd > list[i]) {
           							
           							if(list2[i] < 10){
           								
           								$("#c"+list[i]).css("font-size", "16px").css("color", "E5E5E5").text("0"+list[i]);
           								
           							}else {
           								
           								$("#c"+list[i]).css("font-size", "16px").css("color", "E5E5E5").text(list[i]);
           							}
           							
           	                        
                          		}
            				}
           				}
           			}
            		// 현재일의 배경색 주기
            		$("#"+mtd).css("background", "#fff5f3");
            		
                    // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                    if(date.getDate() > day && Math.sign(day) == 1) {
                        column.style.backgroundColor = "#ffffff";
                        column.style.color = "E5E5E5";
                  

                    // @details 7일뒤보다 이후이면서 현재월에 포함되는 일인경우
               		}else if((date.getDate()+6) < day && lastDate.getDate() >= day) {
               			
						    column.style.backgroundColor = "#f8f8f8";
	                        column.style.color = "";
	                        column.style.cursor = "pointer";
	                        column.onclick = function(){ calendarChoiceDay(this); }    

                   
                    // 현재일 +6일 뒤 부터 선택 가능하게 만듬
//                     }else if((date.getDate()+6) < day ) {

// //                         column.style.backgroundColor = "#f8f8f8";
// //                         column.style.color = "";
// //                         column.style.cursor = "pointer";
// //                         column.onclick = function(){ calendarChoiceDay(this); }    
                    	
                    	
                    
                    // @details 현재일인 경우
                	}else if(date.getDate() == day) {
                		column.style.backgroundColor = "pink";
                    
                    // 현재일부터 7일이전 까지 라면
                    }else{
                    	
                    	 column.style.color = "E5E5E5";
                    	
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
        clickyear = moment(date).format('YYYY');
        clickyear2 = moment(date).format('YY');
        clickday = $(".choiceDay").text();
        clickdate = clickyear2+"/"+clickmonth+"/"+clickday;
        clickdate2 = clickmonth+"월 "+clickday+"일";
        clickdate3 = clickyear+"-"+clickmonth+"-"+clickday;

        
        // @현재요일 구하기
        var week = new Array('일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일');
		var clickdow = new Date(clickdate3).getDay();
		var todayLabel = week[clickdow];
        console.log(todayLabel);

           //첫번째 예약란이 빈공백이면,
           if($("#selectDay1").val() == ""){
        	   
        	   resultcnt++;
        	   resultprice = <%=tr_price%>;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	   
	   	        // 첫번째 예약 날짜에 입력 시킨다.
	           	$("#selectDay1").attr("value", clickdate2);
	           	$("#selectDate1").attr("value", clickdate);
	   	        $("#dow1").attr("value", todayLabel);
	   	        $("#Num1").attr("value", "1");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	        $("#tr_price > input").attr("value", tr_price2);
	   	        $("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	   	        $(".choiceDay").css("cursor", "text");
	   	        $(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	   	
	   	     return false;
	   	   
	       //두번째 예약란이 공백일때
           }else if($("#selectDay2").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   	        
        	   // 두번째 예약 날짜에 입력 시킨다.
	           	$("#selectDay2").attr("value", clickdate2);
	           	$("#selectDate2").attr("value", clickdate);
	           	$("#dow2").attr("value", todayLabel);
	           	$("#Num2").attr("value", "2");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
   	       		$(".choiceDay").css("background", "#00ff9575");
   	       		
   	       	return false;
   	       		
 	       //세번째 예약란이 공백일때
           }else if($("#selectDay3").val() == ""){
	   	        
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        	   
        	   // 세번째 예약 날짜에 입력 시킨다.
	           	$("#selectDay3").attr("value", clickdate2);
	           	$("#selectDate3").attr("value", clickdate);
	           	$("#dow3").attr("value", todayLabel);
	           	$("#Num3").attr("value", "3");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	       
   	       return false;    
	   	        
  	       //네번째 예약란이 공백일때
           }else if($("#selectDay4").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   	        
        	   // 네번째 예약 날짜에 입력 시킨다.
	           	$("#selectDay4").attr("value", clickdate2);
	           	$("#selectDate4").attr("value", clickdate);
	           	$("#dow4").attr("value", todayLabel);
	           	$("#Num4").attr("value", "4");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	        
   	     	return false;     
	   	        
  	       //다섯번째 예약란이 공백일때
           }else if($("#selectDay5").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   	        
        	   // 다섯번째 예약 날짜에 입력 시킨다.
	           	$("#selectDay5").attr("value", clickdate2);
	           	$("#selectDate5").attr("value", clickdate);
	           	$("#dow5").attr("value", todayLabel);
	           	$("#Num5").attr("value", "5");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
		  	   
   	    	 return false;
	   	        
  	       //여섯번째 예약란이 공백일때
           }else if($("#selectDay6").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        
	 	  		 // 여섯번째 예약 날짜에 입력 시킨다.
	        	$("#selectDay6").attr("value", clickdate2);
	        	$("#selectDate6").attr("value", clickdate);
	        	$("#dow6").attr("value", todayLabel);
	        	$("#Num6").attr("value", "6");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
	           	$(".choiceDay").css("cursor" , "text");
	           	$(".choiceDay").css("pointer-events" , "none");
	   	        $(".choiceDay").css("background", "#00ff9575");
	   	   
   	    	 return false;     
	   	        
  	       //일곱번째 예약란이 공백일때
           }else if($("#selectDay7").val() == ""){
        	   
        	   resultcnt++;
        	   totalresult = resultcnt * resultprice;
        	   totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        
	  		 	// 여섯번째 예약 날짜에 입력 시킨다.
	   			$("#selectDay7").attr("value", clickdate2);
	   			$("#selectDate7").attr("value", clickdate);
	   			$("#dow7").attr("value", todayLabel);
	   			$("#Num7").attr("value", "7");
	   	        $("#totalcnt > input").attr("value", resultcnt);
	   	    	$("#tr_price > input").attr("value", tr_price2);
	   	    	$("#tr_totalprice > input").attr("value", totalresult2);
	   	        $("#totalprice").attr("value", totalresult);
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
    
    
    var lastDate2 = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	var dlastday  = moment(lastDate2).format('YYYYMMDD');
	var d_day = moment(today).format('YYYYMMDD');
	var diffday = dlastday-d_day;
	var monthd = new Date(today.getFullYear(), today.getMonth() + 1, 1);
	var month2 = new Date(today.getFullYear(), today.getMonth() + 1, 1);
	var nextmonth = moment(monthd).format('MM');
	
	console.log("당월마지막날짜 : "+dlastday);
	console.log("현재날짜 : "+d_day);
	console.log("당월-현재날짜 : "+diffday);
	
	
    
    // JQUERY - 화면이 요청 되었을 때,
    $(document).ready(function(){

    	// 리셋 버튼을 눌렀을 때,
    	$("#resetbtn").on("click",function(){

    		//현재 보이는 창이 현재달 이면
    		var dmon = document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);
    		var thisMonth = moment(lastDate2).format('MM');
    		
    		console.log("dmon :"+dmon);
    		console.log("nextmonth :"+nextmonth);
    		console.log("thisMonth : "+thisMonth);

    		
    		if(dmon == thisMonth){
    			
    			//예약 정보를 초기화 시킨다.
        		$("#result > div > input").attr("value", "");
       	        $("#totalcnt > input").attr("value", "");
       	    	$("#tr_price > input").attr("value", "");
       	    	$("#tr_totalprice > input").attr("value", "");
       	    	resultcnt = 0;
       	    	totalresult = 0;
    			
       	    	buildCalendar();
       	    	
    		}else{
    			
    			//예약 정보를 초기화 시킨다.
        		$("#result > div > input").attr("value", "");
       	        $("#totalcnt > input").attr("value", "");
       	    	$("#tr_price > input").attr("value", "");
       	    	$("#tr_totalprice > input").attr("value", "");
       	    	resultcnt = 0;
       	    	totalresult = 0;
       	    	
       	        this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
       	        
       	        console.log("this.today :"+this.today);
       	        buildCalendar();    // @param 명월 캘린더 출력 요청

	    		// 예약 된 날짜를 가져온다.
	    		var list = <%=list%>;
	    		var list2 =<%=list2%>;
	    		
	    		var monthtoday = new Date(today.getFullYear(), today.getMonth(), today.getDate()+7);
	    		var mtd = moment(monthtoday).format('DD');
	    		
	    		// for 문을 돌려서 카트에 담긴 날짜와 일치하는 날짜를 가져온다.
        		for(var i =0; i < list2.length; i++){

        			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
        			for(var j=1; j < 32; j++ ){
        				

        				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
        				if(list2[i].toString() == j.toString()) {
        					
        					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
        					
        					// 만약에 현재일+7일보다 낮은 숫자에 예약이 있을경우
//        						if(mtd > list2[i]) {
       	                       

//        							if(list2[i] < 10){
       	                        	
//        	                        	$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text("0"+list2[i]);
       	                        	
//        	                        }else{
       	                        	
       	                        	
//        	                         	$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text(list2[i]);
//        	                        }

//                       		 }
       						
       						
        				}
       				}
       			}
	    		
	    		// for 문을 돌려서 예약날짜와 일치하는 날짜를 가져온다.
	    		for(var i =0; i < list.length; i++){

	    			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
	    			for(var j=1; j < 32; j++ ){

	    				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
	    				if(list[i].toString() == j.toString() ){
	    					
	    					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
						
    					
		   				}
		   			}
		   		}

	    		
    		// 다음달 마지막날을 구해서 가져오고,
    		var nextmonthlastday = new Date(today.getFullYear(), today.getMonth()+1, 0);
    		// 다음달 오늘날을 구해서
    		var nextmonthtoday = new Date(today.getFullYear(), today.getMonth(), today.getDate()+7);
    		
    		// 방법1) 포맷형식을 바꾼다.
    		var nmld = moment(nextmonthlastday).format('YYYY-MM-DD');
    		var nmldint = moment(nextmonthlastday).format('DD');

    		var nmtd = moment(nextmonthtoday).format('YYYY-MM-DD');
    		
    		console.log(nmld);
    		console.log(nmtd);
    		
    		// 시작날짜+1일과 마지막 날을 구해서 그 사이 날짜 구해서 배열에 저장하기	
    		function getDateRange(startDate, endDate, listDate){
    	
    	        var dateMove = new Date(startDate);
    	        	
    	        var strDate = startDate;
 
    	
    	        if (startDate == endDate){
    	
    	            var strDate = dateMove.toISOString().slice(0,10);
    	            
    	            listDate.push(strDate);

    	            
    	        }else{
    	
    	            while (strDate < endDate){
    	
    	                var strDate = dateMove.toISOString().slice(0, 10);
    	                
    	                listDate.push(strDate.slice(8,10));

    	                dateMove.setDate(dateMove.getDate() + 1);

    	
    	            }
    	
    	        }
    	
    	        return listDate;
    	
    	    }

        	var listDate = [];
        	// 함수 호출 구문
        	getDateRange(nmtd, nmld, listDate);
 
        		// 16부터 시작
    			for(var i=listDate[0]; i <= nmldint; i++){
    				// 1부터 시작
    				for(var j=1; j < 32; j++ ){
						
    					// 만약에 일치하는 값이 있을때, 해당 컬럼 색상을 변경 시킨다.
    					if(i == j){
    						
    						if(i < 10){
    							$("#c"+i).css("font-size", "16px").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white").text("0"+i);
    							
    						}else{
    							
    							$("#c"+i).css("font-size", "16px").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white").text(i);
    							
    						}

    					}
    					
    				}
        		}// 복붙함
    			
    		}	
    		
    		
    	})
    	
    	
    	
    	
    	
    	$("#submitbtn").on("click", function(){
    		
    		$("#tr_mem_reg_date").attr("value", regdate);
    		$("#reg_date").attr("value", reg_date);
    		
    		if($("#totalcnt > input").val() == ""){
    			
    			alert("최소 1회의 수강을 선택해주세요!");
    			
    			return false;
    		}
    		
    	})
    	

    	
    	// 다음 버튼을 눌렀을 때,
    	$("#next").on("click", function (){
    		
   	    	
   	        this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
   	        
   	        console.log("this.today :"+this.today);
   	        buildCalendar();    // @param 명월 캘린더 출력 요청

    		// 예약 된 날짜를 가져온다.
    		var list = <%=list%>;
    		var list2 =<%=list2%>;
    		
    		var monthtoday = new Date(today.getFullYear(), today.getMonth(), today.getDate()+7);
    		var mtd = moment(monthtoday).format('DD');
    		
    		
    		// for 문을 돌려서 카트에 담긴 날짜와 일치하는 날짜를 가져온다.
    		for(var i =0; i < list2.length; i++){

    			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
    			for(var j=1; j < 32; j++ ){
    				

    				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
    				if(list2[i].toString() == j.toString()) {
    					
    					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
    					
//     					// 만약에 현재일+7일보다 낮은 숫자에 예약이 있을경우
//    						if(mtd > list2[i]) {
   	                        
   							
//    							if(list2[i] < 10){
								
// 								$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text("0"+list2[i]);
								
// 							}else{
								
// 								$("#c"+list2[i]).css("font-size", "16px").css("color", "E5E5E5").text(list2[i]);
								
// 							}
//                   		 }
   						
   						
    				}
   				}
   			}
    		
    		// for 문을 돌려서 예약날짜와 일치하는 날짜를 가져온다.
    		for(var i =0; i < list.length; i++){

    			// 캘린더의 날짜를 1부터 ~31일까지 가져온다.
    			for(var j=1; j < 32; j++ ){

    				// 만약에 일치하는 값이 있을때, 해당 컬럼을 예약불가 처리 한다.
    				if(list[i].toString() == j.toString() ){
    					
    					$("#c"+j).css("cursor" , "text").css("pointer-events" , "none").css("background", "#ffffff").text("수업 있음!").css("color", "#e9a9e7").css("font-size","12px");
					
					
	   				}
	   			}
	   		}
    		
    		
	
			// 다음달 마지막날을 구해서 가져오고,
			var nextmonthlastday = new Date(today.getFullYear(), today.getMonth()+1, 0);
			// 다음달 오늘날을 구해서
			var nextmonthtoday = new Date(today.getFullYear(), today.getMonth(), today.getDate()+7);
			
			// 방법1) 포맷형식을 바꾼다.
			var nmld = moment(nextmonthlastday).format('YYYY-MM-DD');
			var nmldint = moment(nextmonthlastday).format('DD');
	
			var nmtd = moment(nextmonthtoday).format('YYYY-MM-DD');
			
			console.log(nmld);
			console.log(nmtd);
			
			// 시작날짜+1일과 마지막 날을 구해서 그 사이 날짜 구해서 배열에 저장하기	
			function getDateRange(startDate, endDate, listDate){
		
		        var dateMove = new Date(startDate);
		        	
		        var strDate = startDate;
	
		
		        if (startDate == endDate){
		
		            var strDate = dateMove.toISOString().slice(0,10);
		            
		            listDate.push(strDate);
	
		            
		        }else{
		
		            while (strDate < endDate){
		
		                var strDate = dateMove.toISOString().slice(0, 10);
		                
		                listDate.push(strDate.slice(8,10));
	
		                dateMove.setDate(dateMove.getDate() + 1);
	
		
		            }
		
		        }
		
		        return listDate;
		
		    }
	
	    	var listDate = [];
	    	// 함수 호출 구문
	    	getDateRange(nmtd, nmld, listDate);
	
	    		// 16부터 시작
				for(var i=listDate[0]; i <= nmldint; i++){
					// 1부터 시작
					for(var j=1; j < 32; j++ ){
						
    					// 만약에 일치하는 값이 있을때, 해당 컬럼 색상을 변경 시킨다.
    					if(i == j){
    						
    						if(i < 10){
    							$("#c"+i).css("font-size", "16px").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white").text("0"+i);
    							
    						}else{
    							
    							$("#c"+i).css("font-size", "16px").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white").text(i);
    							
    						}

    					}
						
					}
	    		}// 복붙함
	    		

    	})
   			
    		// 당월 마지막 날짜에서 현재날짜를 뺀 값이 0이면
    		if (diffday == 0){
    			
    			$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c2").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c3").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c4").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c5").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c6").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");

    		// 1이면
    		}else if(diffday == 1){
    			
    			$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c2").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c3").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c4").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c5").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
   			// 2이면
    		}else if (diffday == 2){
    			
    			$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c2").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c3").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c4").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    		
   			// 3이면
    		}else if (diffday == 3){
    			
    			$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c2").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
    			$("#c3").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
			
   			// 4이면
			}else if (diffday == 4){
			
				$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
				$("#c2").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
			
			// 5이면
			}else if (diffday == 5){
			
				$("#c1").css("color", "#e5e5e5").css("cursor" , "text").css("pointer-events" , "none").css("background", "white");
			}
    		
    	
    	
    });
    
    	// 리퀘스트로 받아온 금액을
	var original = <%=tr_price%>;
	
	// 정규표현식으로 3자리숫자당 콤마로 구분한다.
	var tr_price2 = original.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	var totalresult2 = totalresult.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	

</script>
</head>
<body>
<form method ="post" action ="<%=request.getContextPath()%>/nb/edureservation.do">

<!-- 예약한 날짜와 트레이너금액, 총금액 원본 넘기기 -->
<input type="hidden" name = "id" id= "id" value="<%=id%>" readonly>
<input type="hidden" name ="tr_mem_reg_date" id="tr_mem_reg_date" readonly />
<input type="hidden" name ="reg_date" id="reg_date" readonly />
<input type="hidden" name ="tr_price" id="tr_price" value="<%=tr_price%>" readonly />
<input type="hidden" name ="totalprice" id="totalprice" readonly />
<input id="selectDate1" name="date1" type="hidden"  readonly="readonly"/>
<input id="selectDate2" name="date2" type="hidden"  readonly="readonly"/>
<input id="selectDate3" name="date3" type="hidden"  readonly="readonly"/>
<input id="selectDate4" name="date4" type="hidden"  readonly="readonly"/>
<input id="selectDate5" name="date5" type="hidden"  readonly="readonly"/>
<input id="selectDate6" name="date6" type="hidden"  readonly="readonly"/>
<input id="selectDate7" name="date7" type="hidden"  readonly="readonly"/>

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
        	* "오늘 기준으로 일주일 뒤"부터, 그리고 <strong>"한달"</strong> 까지 예약 가능 *<br>
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
	        		<input id="selectDay1"  type="text"  name= "selectDay1" readonly="readonly"/>
	        		<input id="selectDay2"  type="text"  name= "selectDay2" readonly="readonly"/>
	        		<input id="selectDay3"  type="text"  name= "selectDay3" readonly="readonly"/>
	        		<input id="selectDay4"  type="text"  name= "selectDay4" readonly="readonly"/>
	        		<input id="selectDay5"  type="text"  name= "selectDay5" readonly="readonly"/>
	        		<input id="selectDay6"  type="text"  name= "selectDay6" readonly="readonly"/>
	        		<input id="selectDay7"  type="text"  name= "selectDay7" readonly="readonly"/>
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
		<a class = "btn" id="resetbtn" type="reset">예약 초기화</a>
		</div>
	</div>
  
    
<!--       우측 하단의 요약 테이블 -->
    <div id="resultBox">
        <div id="totalvalue">
            <div id = "totalcnt">수강 횟수 : <input name="totalcnt" style="text-align: right;" type="text"  readonly="readonly">&nbsp;&nbsp;회</div>
            <div id = "tr_price">회당 금액 : <input style="text-align: right;" type="text"  readonly="readonly" >&nbsp;&nbsp;원</div>
            <div id = "tr_totalprice">총 예약금액 : <input style="text-align: right;" type="text"  readonly="readonly">&nbsp;&nbsp;원</div>
        </div>
	  </div>
	</div>
</div>
<!-- 	   하단의 3가지 버튼 메뉴 -->
		<div id = "btnBox2">
      		<div id = "Totalsubmit">
         	<a class = "btn" href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp" >이전 페이지로</a> 
         	<button id="submitbtn" type="submit" style="font-weight : bold; padding : 6px 12px; margin : 0 10px; font-size : 22px; border-radius: 20px; border:0px; " >예약 신청</button>
         	<a class = "btn" href="<%=request.getContextPath()%>/nb/Main" >홈으로</a>
        	</div>
        </div>

</form>
</body>
</html>