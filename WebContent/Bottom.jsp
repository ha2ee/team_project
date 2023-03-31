<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>
<title>Bottom.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>

<!--          			# Footer 관련 -->

    <!-- footer start -->
    <div class="footer_wrap">
    <div id ="top_line"></div>
    <div class="footer">
                <!-- footer-useful links-start -->
                <div class="useful_links">
                    <div class="footer-widget">
                        <h4 class="footer-title" >( 바로 가기 )</h4>
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/nb/Main">Home </a></li>
                            <li><a href="<%=request.getContextPath()%>/nb/Intro.do?center=/nbCompany/intro.jsp">회사 소개 </a></li>
                            <li> <a href="<%=request.getContextPath()%>/nb/navi.do?center=/nbCompany/navi.jsp">오시는 길</a></li>
                            <li><a href="<%=request.getContextPath()%>/nb/edu.do?center=/nbShop/trainer.jsp">수강 신청 </a></li>
                            <li><a href="<%=request.getContextPath()%>/review/list.rv">수강 후기</a></li>
                            <li><a href="<%=request.getContextPath()%>/nb/free.bo?center=/nbBoard/freeboard.jsp">자유 게시판 </a></li>
                            <li><a href="<%=request.getContextPath()%>/nb/trainer.bo?center=/nbBoard/trainerboard.jsp">훈련사 상담 </a></li>
                            <li> <a href="<%=request.getContextPath()%>/nb/qna.bo?center=/nbBoard/qna.jsp">Q&A</a></li>
                        </ul>
                    </div>
                </div>
                <!-- footer-useful links-close -->
                <!-- footer-contactinfo-start -->
                <div class=" contactinfo">
                    <div class="footer-widget">
                        <h4 class="footer-title"><br>( 늘 봄 고객지원 )<br></h4>
                        <div class="">
                            <ul >
                                <li> <i class="fa fa-map-marker"></i>경남 양산시 중부동 686-7 양산역프라자 2층</li>
                                <li><i class="fa fa-phone"></i>055-383-0000</li>
                                <li><i class="fa fa-envelope"></i>admin@nb.co.kr</li>
                            </ul>
                        </div>
                        <a id = "qna" href="#" class="btn btn-primary btn-sm" >1:1 상담하기<br></a></div>
                </div>
                <!-- footer-contactinfo-close -->
                <!-- footer-about-start -->
                <div class="about-start">
                    <div class="footer-widget">
                        <h4 class="footer-title" ><br>( 참고 )</h4>
                        <p >본 홈페이지는 1920x1080 해상도에 최적화 되어 있습니다. </p>
                    </div>
                </div>


        <!-- footer-address-close -->
    </div>
    <!-- footer close -->
    <div id ="bottom_line"></div>
      <p class="copyright">Copyright 2021.
      <a id = "link" href ="<%=request.getContextPath()%>/nb/Main"> nb All rights reserved</a>
      </p>
    </div>
</body>
</html>