<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>
</head>
<title>Slider</title>
<!-- 3 Bootstrap core CSS --> 
<link href="<%=contextPath%>/css/bootstrap.min.css" rel="stylesheet">

 <style>
 	
 	*{margin:0; padding:0}
 	
 	.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    width: 100%;
    height: 500px;
    }
    
    .carousel-indicators {
    position: relative;
    top: 480px;
    bottom: 480px;
    left: 85%;
    z-index: 15;
    width: 160px;
    padding-left: 0;
    margin-left: -35%;
    text-align: center;
    list-style: none;
    }
    .carousel-example-generic{
    width: 100%;
    }
    .image-text1{
    position: relative;
    top: -110px;
    bottom: 500px;
    right: 40%;			
    z-index: 1;
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
    z-index: 1;
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
    z-index: 1;
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
    z-index: 1;
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
    border-radius: 20px; 
    background-color:transparent; 
    font-size: 16px;
    font-weight: bold;
    }
    button:hover{
    background-color:navy;
    color:white;
    transition:0.4s;
    }
    .map{
    position: relative;
    margin : 0 auto;
	top : 0;
	left : 0;
	width : 100%;
    height: 350px;
    }
    .map > img{
    position: relative;
    margin : 0 auto;
	top : 0;
	left : 0;
	width : 100%;
    height: 350px;
    }
    
    @media(max-width: 1023px){
    .map > img{
    width: 100%
    }
    }
    .image-text5{
    position: relative;
    margin: 0 auto;
    top: -343px;
    left: -645px;
    width: 500px;
    height: 294px;
    } 
    #text1{
    position: relative;
    margin: 0 auto;
    top: 16px;
    left: -30px;
    width: 100px;
    height: 42px;
    font-size: 30px;
    font-weight: bold;
    }
    #text1-1{
    position: relative;
    margin: 0 auto;
    top: 17px;
    left: -10px;
    width: 261px;
    height: 38px;
    font-size: 27px;
    font-weight: 600;
	}
    #text2{
    position: absolute;
    margin: 0 auto;
    top: 148px;
    left: 122px;
    width: 341px;
    height: 189px; 
     }
    #text2 > a{
    position: absolute;
    margin: 0 auto;
    top: -30px;
    left: 90px;
    width: 50%;
    height: 145px;
	}
    #text2 > i{
    position: relative;
    margin: 0 auto;
    top: 125px;
    left: 5px;
    width: 50%;
    height: 19px;
    font-size: 16px;
    font-weight: bold;
    }
     #text2 >a{
     color: #ffd4db;
     transition:0.4s;
     }
    #text2 >a:hover{
    color:navy;
    transition:0.4s;
	}
	.center_wrap, .slider{
	width: 1920px;
	margin: 0 auto;
	}
	.bx-wrapper{
	margin: 0 auto;
	width: 1920px;
	height: 500px;
	background: #fff8d263;
	}
    .bx-wrapper .bx-pager {
    position: relative;
    top: 385px;
    border: none; 
    box-shadow: none;
    background: #fff8d263;
    height: 110px;
    }
   .slider1, .slider2, .slider3, .slider4{
    background: #fff8d263;
    }
   	.slider1 > iframe{
	position: relative;
    left: 50px;
    height: 380px;
    width: 685px;
    top: 10px;
    margin: 0 auto;
    }
    .slider2 > iframe{
	position: relative;
	background-size: cover;
    left: -50px;
    height: 380px;
    width: 685px;
    top: 10px;
	}
	.slider3 > iframe{
	position: relative;
    left: 50px;
    height: 380px;
    width: 685px;
    top: 10px;
	}
	.slider4 > iframe{
	position: relative;
    left: -50px;
    height: 380px;
    width: 685px;
    top: 10px;
	}
	.bx-wrapper .bx-pager.bx-default-pager a{
	position: relative;
	top: 0px;
	}
    
   
    <%--#ffe0fa--%>
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

<div class="center_wrap">
<!-- 실제 이미지 아이템 -->
<!-- class는 carousel-inner로 설정하고 role은 listbox에서 설정한다. -->
<div class="carousel-inner" role="listbox">
<!-- 이미지의 개수만큼 item을 만든다. 
중요한 포인트는 carousel-indicators의 li 태그 개수와 item의 개수는 일치해야 한다. -->
<!-- Wrapper for slides -->

<div class="item active">
<img src="<%=contextPath%>/images/slider1.png" alt="slide1">
<div class="carousel-caption">
<div class="image-text1">
<h4 style="font-weight:bold">훈련사 상담</h4>
	__________________________ <br>
<h1>반려견에게</h1> 
<h3>필요한 훈련은 뭘까요?</h3> <br>
<a style="text-decoration: none" href="<%=contextPath%>/tb/list.bo">
<button>상담하러가기</button></a>
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
<a style="text-decoration: none" href="<%=contextPath%>/nb/edu.do?center=/nbShop/trainer.jsp">
	<button>수강신청 바로가기</button>
</a>
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
 <a style="text-decoration: none" href="<%=contextPath%>/review/list.rv">
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
 <a style="text-decoration: none" href="<%=contextPath%>/freeboard/list.fb">
<button>소통하러가기</button></a>  
</div>
</div>
</div>

<div class="map">
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
<i class="fa-solid fa-store fa-10x"></i> 
</a>
<i class="fa fa-arrow-up">&nbsp;&nbsp;클릭해보세요</i>
</div>
</div>

</div>
</div>
</div>

<script src="<%=contextPath%>/js/jquery.min.js"></script>
<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
<script src="<%=contextPath%>/js/run_prettify.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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

  </head>
  <body>
<!--  <img src="< %=contextPath%>/images/slider5.png" alt="slide5"> -->
<div class="bx-wrapper" style="border:#fff8d263; height: 485px; background: #fff8d263;">
    
    <span style="font-size: 40px; font-weight: 700;">교육영상</span>
    
    <ul class="slider" style="border: none; box-shadow: none; background: #fff8d263;">
   		<li class="slider1">
		  <iframe width="500" height="380" src="https://www.youtube.com/embed/aFojR9xDl30" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> 
		  </li>
		<li class="slider2">

		    	<iframe width="500" height="380" src="https://www.youtube.com/embed/skxf5OEpoxk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

	    </li>
		<li class="slider3">
				<iframe width="500" height="380" src="https://www.youtube.com/embed/S9WWAMjDF8E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</li>
		    <li class="slider4">

		    	<iframe width="560" height="315" src="https://www.youtube.com/embed/V7c5SUIuswE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
			</li>
		</ul>


    </div>
</div>


</body>
</html>