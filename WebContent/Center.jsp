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
<!-- 3 Bootstrap core CSS --> 
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
<head>

 <style>
	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    max-width: 100%;
    height: 500px;
    }
    .carousel-indicators {
    position: relative;
    top: 480px;
    bottom: 480px;
    left: 55%;			
    z-index: 15;
    width: 60%;
    padding-left: 0;
    margin-left: -35%;
    text-align: center;
    list-style: none;
    }
    .image-text1{
    position: relative;
    top: -110px;
    bottom: 500px;
    right: 40%;			
    z-index: 10;
    width: 50%;
    padding-left: 0;
    list-style: none;
    color: black;
    }
    .image-text2{
    position: relative;
    top: -110px;
    bottom: 500px;
    right: 35%;			
    z-index: 10;
    width: 50%;
    padding-left: 0;
    list-style: none;
    color: black;
    }
    .image-text3{
    position: relative;
    top: -110px;
    bottom: 500px;
    right: 40%;			
    z-index: 10;
    width: 50%;
    padding-left: 0;
    list-style: none;
    color: black;
    }
    .image-text4{
    position: relative;
    top: -110px;
    bottom: 500px;
    right: 40%;			
    z-index: 10;
    width: 50%;
    padding-left: 0;
    list-style: none;
    color: black;
    }
    .image-text5{
    position: relative;
    top: -30px;
    bottom: 500px;
    right: 35%;			
    z-index: 10;
    width: 50%;
    padding-left: 0;
    list-style: none;
    color: black;
    }
    button{
    position: relative;
    width: 200px;
    height: 40px;
    color: black; 
    border-width: 2; 
    border-radius: 20px; 
    background-color:transparent; 
    font-size: 16px;
    }
    
    }
    .slider2 > a> img{
	position: relative;
	background-size: cover;
    left: 70px;
    height: 380px;
    width: 450px;
    top: 10px;
	}
	.slider3 > a> img{
	position: relative;
    left: 50px;
    height: 380px;
    width: 450px;
    top: 10px;
	}
	.slider4 > a> img{
	position: relative;
    left: 50px;
    height: 380px;
    width: 450px;
    top: 10px;
	}
	.bx-wrapper .bx-pager.bx-default-pager a{
	position: relative;
	top: 30px;
    }

</style> 
<script src="https://kit.fontawesome.com/0ec4758f24.js" crossorigin="anonymous"></script>
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

<!-- 실제 이미지 아이템 -->
<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
<div class="carousel-inner" role="listbox">
<!-- 이미지의 개수만큼 item을 만든다. 
중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
<!-- Wrapper for slides -->
<div class="carousel-inner" role="list box">

<div class="item active">
<img src="<%=contextPath%>/images/slider1.png" alt="slide1">
<div class="carousel-caption">
<div class="image-text1">
<h4 style="font-weight:bold">늘봄샵</h4>
	__________________________ <br>
<h1>내 반려견에게</h1> 
<h3>필요한것은 뭘까요?</h3> <br>
<a style="text-decoration: none" href="<%=contextPath%>/nbShop/pet.jsp">
<button>늘봄샵 바로가기</button></a>
</div>
</div>
</div>
<div class="item">
<img src="<%=contextPath%>/images/slider2.png" alt="slide2">
<div class="carousel-caption">
<div class="image-text2">
 <h4 style="font-weight:bold">수강신청</h4>
	__________________________ <br>
<h1>함께 살아가기 위한</h1> 
<h3>수업을 받아보세요!</h3> <br>
<a style="text-decoration: none" href="<%=contextPath%>/nbShop/trainer.jsp">
<button>수강신청 바로가기</button></a>
</div>
</div>
</div>

<div class="item">
<img src= "<%=contextPath%>/images/slider3.png" alt="slide3">
<div class="carousel-caption">
<div class="image-text3">
<h4 style="font-weight:bold">수강후기</h4>
	__________________________ <br>
<h1>수강후기를</h1> 
<h3>들려주세요!</h3> <br>
 <a style="text-decoration: none" href="<%=contextPath%>/nbBoard/">
<button>수강후기 바로가기</button></a>  
</div>
</div>
</div>

<div class="item">
<img src= "<%=contextPath%>/images/slider4.png" alt="slide4">
<div class="carousel-caption">
<div class="image-text4">
<h4 style="font-weight:bold">자유게시판</h4>
	__________________________ <br>
<h1>자유롭게</h1> 
<h3>소통해봐요!</h3> <br>
 <a style="text-decoration: none" href="<%=contextPath%>/nbBoard/list.jsp">
<button>소통하러가기</button></a>  
</div>
</div>
</div>

<div class="map">
<img src="<%=contextPath%>/images/doghospital.png" alt="searchMap">
<div class="carousel-caption">
<div class="image-text5">
<h2>내 주변</h2>
<h3>편의 시설을 알아봐요!</h3> <br>
<a href="<%=request.getContextPath()%>/nbShop/map.jsp"><i class="fa-solid fa-store fa-10x" style="color: #fff5f3"></i></a>
<h5><i class="fa fa-arrow-up"></i> 클릭해보세요</h5>
</div>
</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<%=contextPath%>/js/jquery.min.js"></script>
<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script src="<%=contextPath%>/js/run_prettify.js"></script>

</div>
</div>
</div>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
    $(document).ready(function(){
        $('.slider').bxSlider({
          slideWidth: 500,
          minSlides: 3,
          maxSlides: 4,
          slideWidth: 800,
          touchEnabled: false,
          moveSlides: 1,
          infiniteLoop: false,
		  hideControlOnEnd: true,
		  controls: false
         });
      });
    </script>

  </head>
  <body>

<div class="bx-wrapper" style="border:#fff8d263;  height: 485px; background: #fff8d263;" >
    
    <span style="font-size: 40px; font-weight: 700;">교육영상</span> <br>
    <span style="font-size: 20px; font-weight: 600;">유튜브로 연결됩니다!</span>
    
    <ul class="slider" style="border: none; box-shadow: none; background: #fff8d263;">
   		<li class="slider1">
		   <a href="https://youtu.be/aFojR9xDl30"><img src="<%=contextPath%>/images/slider5.png" alt="slide5">
		   </a>
		</li>
		<li class="slider2">
		    	<a href="https://youtu.be/skxf5OEpoxk"><img src="<%=contextPath%>/images/slider8.png" alt="slide6">
	    		</a>
	    </li>
		<li class="slider3">
				<a href="https://youtu.be/S9WWAMjDF8E"><img src="<%=contextPath%>/images/slider6.png" alt="slide7">
				</a>
			</li>
		    <li class="slider4">
		    	<a href="https://youtu.be/V7c5SUIuswE"><img src="<%=contextPath%>/images/slider7.png" alt="slide8">
				</a>
			</li>
		</ul>
    </div>
</div>


</body>
</html>