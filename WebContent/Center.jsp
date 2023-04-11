<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>

<title>Slider</title>

<link href="<%=contextPath%>/css/bootstrap_center.css" rel="stylesheet">
<!-- center.css연결 -->
<link href="<%=request.getContextPath()%>/css/center.css" rel="stylesheet">

<script src="https://kit.fontawesome.com/0ec4758f24.js" crossorigin="anonymous"></script>
</head>

<body>
<!-- Images Slider Start -->

<div id="carousel-example-generic" class ="carousel slide" data-ride="carousel">
<!-- Indicators -->
<!-- carousel의 지시자 -->
<!-- 지시자라고는 하는데 ol태그의 class에 carousel-indicators를 넣는다. -->
<ol class="carousel-indicators">
<!-- li는 이미지 개수만큼 추가하고 data-target은 carousel id를 가르킨다. -->
<!-- data-slide-to는 순서대로 0부터 올라가고 0은 active를 설정한다. -->
<!-- 딱히 이 부분은 옵션별로 설정하게 없다. -->
<li data-target= "#carousel-example-generic" data-slide-to="0" class="active"></li> 
<li data-target= "#carousel-example-generic" data-slide-to="1"></li>
<li data-target="#carousel-example-generic" data-slide-to="2"></li>
<li data-target="#carousel-example-generic" data-slide-to="3"></li>
</ol>

<div class="center_wrap">
<!-- 실제 이미지 아이템 -->
<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
<div class="carousel-inner" role="listbox">
<!-- 이미지의 개수만큼 item을 만든다. 
중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
<!-- Wrapper for slides -->

<div id="c_slider_1" class="item active">
<img src="<%=contextPath%>/images/slider1.png" alt="slide1">
<div class="carousel-caption">
<div class="image-text1">
<h4 id="nb_slide_title" style="font-weight:bold">훈련사 상담</h4>
<br>__________________________ <br>
<h1 id="nb_slider_text1">반려견에게</h1> 
<h3 id="nb_slider_text2">필요한 훈련은 뭘까요?</h3> <br>
<a style="text-decoration: none" href="<%=contextPath%>/tb/list.bo">
<button class="slide1_item">상담하러가기</button></a>
</div>
</div>
</div>
<div id="c_slider_2" class="item">
<img src="<%=contextPath%>/images/slider2.png" alt="slide2">
<div class="carousel-caption">
<div class="image-text2">
 <h4 id="nb_slide_title" style="font-weight:bold">수강신청</h4>
<br>__________________________ <br>
<h1 id="nb_slide_title1">함께 살아가기 위한</h1> 
<h3 id="nb_slide_title2" >수업을 받아보세요!</h3> <br>
<a style="text-decoration: none" href="<%=contextPath%>/nb/edu.do?center=/nbShop/trainer.jsp">
	<button class="slide2_item">수강신청 바로가기</button>
</a>
</div>
</div>
</div>

<div id="c_slider_3" class="item">
<img src= "<%=contextPath%>/images/slider3.png" alt="slide3">
<div class="carousel-caption">
<div class="image-text3">
<h4 style="font-weight:bold">수강후기</h4>
<br>__________________________ <br>
<h1 id="nb_slide_title1">수강후기를</h1> 
<h3 id="nb_slide_title2">들려주세요!</h3> <br>
 <a style="text-decoration: none" href="<%=contextPath%>/review/list.rv">
<button class="slide3_item">수강후기 바로가기</button></a>  
</div>
</div>
</div>

<div id="c_slider_4" class="item">
<img src= "<%=contextPath%>/images/slider4.png" alt="slide4">
<div class="carousel-caption">
<div class="image-text4">
<h4 style="font-weight:bold">자유게시판</h4>
<br>__________________________ <br>
<h1 id="nb_slider_text1">자유롭게</h1> 
<h3 id="nb_slider_text2">소통해봐요!</h3> <br>
 <a style="text-decoration: none" href="<%=contextPath%>/freeboard/list.fb">
<button class="slide4_item">소통하러가기</button></a>  
</div>
</div>
</div>

</div>
</div>
</div>

<div class="doghospital_map">
<img src="<%=contextPath%>/images/doghospital.png" alt="searchMap">
<div class="image-text5">
<div  id="text1">
내 주변 <br>
</div> 
<div id="text1-1">
편의 시설을 알아봐요!
</div>
</div> 

<div id="text2">
<a href="<%=request.getContextPath()%>/nbShop/map.jsp">
<i id="house" class="fa-solid fa-store fa-10x"></i> 
</a>
<i class="fa fa-arrow-up">&nbsp;&nbsp;클릭해보세요</i>
</div>
</div>



<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
     $(document).ready(function(){
        $('.slider').bxSlider({
          speed: 1000,
          minSlides: 2,
          maxSlides: 4,
          slideWidth: 1000,
          touchEnabled: false,
          moveSlides: 2,
          infiniteLoop: false,
		  hideControlOnEnd: true,
		  controls: false,
		  pager: true
         });
      });
    </script>

 	<div class="bx-wrapper" style="border:#fff8d263; background: #fff8d263;">
    
    <span style="font-size: 40px; font-weight: 700;">교육영상</span>
    
    <ul class="slider" >
   		<li id="slider_box1" class="slider1">
		  <iframe id="slider4" width="500" height="380" src="https://www.youtube.com/embed/aFojR9xDl30" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> 
		  </li>
		<li id="slider_box2"  class="slider2">

		    	<iframe id="slider4" width="500" height="380" src="https://www.youtube.com/embed/skxf5OEpoxk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

	    </li>
		<li id="slider_box3"  class="slider3">
				<iframe id="slider4" width="500" height="380" src="https://www.youtube.com/embed/S9WWAMjDF8E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</li>
		    <li id="slider_box4"  class="slider4">

		    	<iframe id="slider4" width="500" height="380" src="https://www.youtube.com/embed/V7c5SUIuswE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</li>
		</ul>


    </div>

</body>
</html>