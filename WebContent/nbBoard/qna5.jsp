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

<!-- 취소관련 페이지 -->

<ul class="listWrap">
     <li class="qa_li">
        <div class="question">
            <p class="tit">부분 취소가 가능한가요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">부분 취소는 불가능합니다. <br>
다만, '입금대기, 입금완료' 상태인 경우 주문 취소 후 다시 주문하실 수 있습니다. </div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">주문 취소는 어떻게 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">'입금대기' 상태인 경우 취소 가능합니다. '입급완료'후엔 수강 시작일 7일 전까지는 무료취소 가능합니다.
 
</div>
    <li class="qa_li">
        <div class="question">
            <p class="tit">교환/반품처리 기간은 얼마나 걸리나요 ?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">교환/반품 완료까지 접수 후 약 4~5일 정도 소요됩니다.<br>

교환/반품 처리 기간은 상품에 따라 다를 수 있으며, 재고 여부(교환 시) 및 택배사와 위탁판매 업체 사정에 의해 처리 및 배송이 지연될 수 있습니다.<br>

접수일 기준으로 통상 3일 이내 택배 수거 지시가 이루어지며, 보듬 측으로 제품 회수 후 반품 및 교환 원하시는 상품으로 재배송해드리고 있습니다.</div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">[교환/반품 주소] 교환/반품은 어디로 보내면 되나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">교환/반품할 경우에는 수령한 제품의 택배 송장에 기재되어 있는 업체 주소지로 반품해야 합니다.<br>

위탁 판매 제품의 경우, 위탁 업체에 따라 교환/반품 주소와 배송비 및 환불 규정이 다를 수 있습니다.<br>

반드시 늘봄 고객센터(055-383-0000)를 통한 전화접수 후에 교환/반품이 가능합니다.<br>



[교환/반품 주소 안내]

* 택배 수령 시, ‘㈜늘봄컴퍼니’에서 보낸 제품일 경우

경남 양산시 중부동 686-7 양산역프라자 2층  ㈜보듬컴퍼니</div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">새 제품 텍이 떨어졌는데 교환/반품이 가능한가요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">상세페이지에도 기재되어 있듯이 텍이 훼손되면 상품 가치 하락으로 재판매가 어려우므로 교환/반품이 불가합니다.<br>

특히, 수입상품(하키하나, 니나오토슨, 멜슨 등)은 텍 훼손, 제품 박스 개봉만으로 교환/반품이 절대 불가하니 이점 참고하여 주시기 바랍니다.</div>
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