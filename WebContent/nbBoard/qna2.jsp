<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String contextPath = request.getContextPath();
%>

<html>
<head> 
<!-- qna.css연결 -->
<link href="<%=request.getContextPath()%>/css/qna.css" rel="stylesheet">

<meta charset="utf-8">
<title>FAQ 2</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">



<script>
var qnaNum = -1;
$(document).ready(function(){
    $('.qa_li .question').click(function(){
        q = $(".qa_li .question").index(this);
        if(q!=qnaNum){
            $('.qa_li .answer').stop(true, true).slideUp(400);
            $('.qa_li').removeClass('open');
            TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
            qnaNum = q;
            $('.qa_li').eq(qnaNum).addClass('open');
            $('.qa_li .answer').eq(qnaNum).stop(true, true).slideDown(400);
            //TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:180});
            TweenMax.to($('.qa_li .question').eq(qnaNum).find('.iconDiv'), 0.4, {rotation:0});
        }else{
            $('.qa_li .answer').eq(qnaNum).stop(true, true).slideUp(400);
            $('.qa_li').eq(qnaNum).removeClass('open');
            TweenMax.to($('.qa_li').eq(qnaNum).find('.question p'), 0.4, {rotation:0});
            qnaNum = -1;
        }
    });
});    
</script>
</head>

<body>

<!-- 회원서비스 관련 질문페이지 -->

<ul class="listWrap">
    <li class="qa_li">
        <div class="question">
            <p class="tit">아이디/비밀번호를 잊어버렸는데 어떻게 찾을 수 있나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">가입하신 아이디나 비밀번호가 기억나지 않으시는 경우<br>
가입 시 등록하신 성함과 휴대전화번호가 필요하며<br>
휴면 계정이나 가입하신 정보로 찾으실 수 없는 경우 <br>
고객센터(1644-0549)로 문의해주시기 바랍니다. </div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">회원 탈퇴는 어떻게 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">PC 홈페이지 로그인 > 마이페이지 > 회원정보수정 > 회원탈퇴 메뉴를 통해 탈퇴하실 수 있습니다. <br>

단, 회원 탈퇴 시에는 탈퇴한 아이디 및 기존 학습 이력 복구, 이용 중인 학습 수강이 불가하니 신중하게 선택 부탁드립니다.<br>

추가 문의사항은 고객센터로 연락주시거나<br>
마이페이지 1:1 문의를 통해 문의 부탁드립니다!<br>
감사합니다. </div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">회원 탈퇴했던 아이디로 재가입할 수 있나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">현재 이용 중이거나 이미 탈퇴하신 아이디는 재사용하실 수 없습니다.<br>
불편하시겠지만 다른 아이디로 회원가입을 진행해 주시기 바랍니다.</div>
    </li>
       
        
</ul>

다른 도움이 필요하신가요?
<button onclick="javascript:addChannel()" class="btn btn-outline-primary">1:1 문의하기</button>
 
 <script type="text/javascript">
        function addChannel() {
        	  Kakao.Channel.addChannel({
        	    channelPublicId: '_Xpekxj',
        	  });
        	}
        
        </script>


</body>
</html>