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

<!-- 배송관련 질문페이지 -->

<ul class="listWrap">
    <li class="qa_li">
        <div class="question">
            <p class="tit">택배사 파업지역인데 타 택배로 발송 가능한가요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">- 파업으로 배송이 원활하지 않은 지역은 타 택배를 통해 대체 발송됩니다.<br>
- 타 택배 발송 대상 건에도 CJ대한통운 발송 완료 기본 알림이 전송됩니다.<br>
-  마이페이지 > 주문 · 배송 페이지에는 CJ대한통운 운송장 번호가 확인되지만 실제 배송은 타 택배사를 통해 진행됩니다.<br>
- 타 택배 발송 완료 후, 문자로 실제 배송 정보를 전달드립니다.</div>
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