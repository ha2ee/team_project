<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	//Session내장객체 메모리 영역에 session값 얻기
	String tr_loginid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>

 #top_line{

    position: relative;
    border-bottom: #F2DEE0 1px solid;
    display: inline-block;
    top: 0;
    left: 0;
    width: 100%;
    height: 10px;
    padding: 0px;
    margin: 0 auto;
    background: #fff5f3;

	}

.footer-line {
    position: relative;
    border-bottom: #F2DEE0 1px solid;
    display: inline-block;
    top: 0;
    left: 0;
    width: 100%;
    height: 10px;
    padding: 0px;
    margin: 0 auto;
    background: #fff5f3;
	}



</style>

<!--  # 캐러셀 사용을 위한 임포트  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<meta charset="utf-8">
<!--  	 trainer CSS 셋팅 -->
 	<link href="<%=request.getContextPath()%>/css/trainer.css" rel="stylesheet">
<script type="text/javascript"  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/owl-carousel/1.3.3/owl.carousel.min.js"></script>
<meta charset="UTF-8">
<title>edu.jsp</title>
</head>
<body>



	<!-- 	강사 소개  들어갈 항목 -->
	<div class="container">
                <h1 class="heading-title">늘 봄 훈련사 소개</h1>
            
            <div class="row">
                <div class="col-md-12">
                    <div id="news-slider1" class="owl-carousel">
                        <div class="post-slide">
                        
                            <div class="post-header">
                                <ul class="post-bar">
                                    <li><img src="<%=contextPath%>/nbShop/img/trainer1.png" alt=""/><br>강형욱<br></li>
                                </ul>
                            </div>
                            <div class="pic">
                                <img src="<%=contextPath%>/nbShop/img/trainer1.png" alt=""/>
                            </div>
                            <p class="post-description">
                               <br>강형욱 훈련사는..?<br><br><br><br><br>
                            </p>
                        </div>

                         <div class="post-slide">
                            <div class="post-header">
                                <ul class="post-bar">
                                    <li><img src="<%=contextPath%>/nbShop/img/trainer2.png" alt=""/><br>다니엘<br></li>
                                </ul>
                            </div>
                            <div class="pic">
                                <img src="<%=contextPath%>/nbShop/img/trainer2.png" alt=""/>
                            </div>
                            <p class="post-description">
                               <br>다니엘 헤니 훈련사는..?<br><br><br><br><br>
                            </p>
                        </div>

                         <div class="post-slide">
                            <div class="post-header">
                                <ul class="post-bar">
                                    <li><img src="<%=contextPath%>/nbShop/img/trainer3.png" alt=""/><br>김효진<br></li>
                                </ul>
                            </div>
                            <div class="pic">
                                <img src="<%=contextPath%>/nbShop/img/trainer3.png" alt=""/>
                            </div>
                            <p class="post-description">
                               <Br>김효진 훈련사는..?<br><br><br><br><br>
                            </p>
                        </div>

                        <div class="post-slide">
                            <div class="post-header">
                                <ul class="post-bar">
                                    <li><img src="<%=contextPath%>/nbShop/img/trainer4.png" alt=""/><br>이경규<br></li>
                                </ul>
                            </div>
                            <div class="pic">
                                <img src="<%=contextPath%>/nbShop/img/trainer4.png" alt=""/>
                            </div>
                            <p class="post-description">
                               <br>이경규 훈련사는..?<br><br><br><br><br>
                            </p>
                        </div>
   
               
                         <div class="post-slide">
                            <div class="post-header">
                                <ul class="post-bar">
                                    <li><img src="<%=contextPath%>/nbShop/img/trainer5.png" alt=""/><br>박&nbsp;&nbsp;봄<br></li>
                                </ul>
                            </div>
                            <div class="pic">
                                <img src="<%=contextPath%>/nbShop/img/trainer5.png" alt=""/>
                            </div>
                            <p class="post-description">
                               <br>박봄 훈련사는..?<br><br><br><br><br>
                            </p>
                        </div>
                    </div>
                </div>
               </div>
	</div>
	
	<div id="tr_selectbox">
		<div id="tr_select">
			<div id= "tr_name1">강형욱<br>특급 훈련사님
			<a href ="<%=request.getContextPath()%>/nb/calendar.do?tr_name=강형욱&tr_price=300000&center=/nbShop/calendar.jsp">
				<input class ="btn2" type="button" name="tr_name" value="일정 확인하기" readonly ="readonly" />
			</a>	
			</div>
			<div id= "tr_name2">다니엘 헤니<br>훈련사님<br>
			<a href ="<%=request.getContextPath()%>/nb/calendar.do?tr_name=다니엘헤니&tr_price=100000&center=/nbShop/calendar.jsp">
				<input class ="btn2"  type="button" name="tr_name" value="일정 확인하기" readonly ="readonly" />
			</a>
			</div>
			<div id= "tr_name3">김효진<br>훈련사님<br>
			<a href ="<%=request.getContextPath()%>/nb/calendar.do?tr_name=김효진&tr_price=100000&center=/nbShop/calendar.jsp">
				<input class ="btn2"  type="button" name="tr_name" value="일정 확인하기" readonly ="readonly" />
			</a>
			</div>
			<div id= "tr_name4">이경규<br>훈련사님<br>
			<a href ="<%=request.getContextPath()%>/nb/calendar.do?tr_name=이경규&tr_price=100000&center=/nbShop/calendar.jsp">
				<input class ="btn2"  type="button" name="tr_name" value="일정 확인하기" readonly ="readonly" />
			</a>
			</div>	
			<div id= "tr_name5">박&nbsp;봄<br>대표 훈련사님
			<a href ="<%=request.getContextPath()%>/nb/calendar.do?tr_name=박봄&tr_price=200000&center=/nbShop/calendar.jsp">
				<input class ="btn2"  type="button" name="tr_name" value="일정 확인하기" readonly ="readonly" />
			</a>
			</div>
		</div>
		
	</div>
	<br><br>
	
	

<script>

// 	함수로 캐러셀 동작 시키기
	$(document).ready(function() {
		    $("#news-slider1").owlCarousel({
		        items:3,
		        itemsDesktop:[1199,3],
		        itemsDesktopSmall:[1000,2],
		        itemsMobile : [650,1],
		        navigationText:false,
		        autoPlay:true
		    });
		

		
	});
</script>			  
</body>
</html>