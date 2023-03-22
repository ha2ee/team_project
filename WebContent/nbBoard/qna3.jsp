<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String contextPath = request.getContextPath();
%>

<html>
<head>
<meta charset="utf-8">
<title>FAQ 3</title>
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
<style>
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');
ul, li, p { list-style:none; padding:0; margin:0; }
.listWrap { font-family:'Noto Sans KR', sans-serif; margin-bottom:20px; }
.listWrap .qa_li { position:relative; display:block; padding:0; border-bottom:1px solid #ededed; cursor:pointer; }
/* .listWrap .qa_li:first-child { border-top:1px solid #a6a6a6; } */
.listWrap .qa_li .ca_name { margin-bottom:14px; font-weight:400; color:#999; font-size:18px; }
.listWrap .qa_li .tit { color:#222; font-size:24px; transition:color 0.3s ease-out; }
.listWrap .qa_li:hover .tit { color:#0a7ac8; }
.qa_li .question { position:relative; display:block; padding:25px 100px 25px 120px; background:url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_q.png') 40px center no-repeat; }
.qa_li .question .iconDiv { position:absolute; right:40px; top:50%; -webkit-transform:translateY(-50%); -moz-transform:translateY(-50%); -o-transform:translateY(-50%); -ms-transform:translateY(-50%); transform:translateY(-50%); }
.qa_li .answer { position:relative; display:none; padding:40px 120px; font-size:16px; color:#222; line-height:28px; background:#f6f6f6 url('https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_a.png') 40px 40px no-repeat; border-top:1px solid #e4e4e4; }
.modA { position:absolute; right:30px; bottom:30px; color:#e82b2b; }
 
</style>
</head>

<body>

<!-- 주문/결제 질문페이지 -->

<ul class="listWrap">
    <li class="qa_li">
        <div class="question">
            <p class="tit">인터넷안전결제(ISP) 결제가 안돼요!</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">iOS (아이폰) 고양이대통령 앱에서 ISP 결제가 어려운 경우 PC 또는 모바일 웹(m.catpre.com) 을 이용해 주시고, 앱 쿠폰을 사용해야 할 경우 ISP 결제가 아닌 앱 카드(간편결제) 또는 다른 결제 수단을 선택하여 결제 바랍니다.</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">세금계산서 신청은 언제까지 할 수 있나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">결제한 날을 기준으로 다음 달 10일까지 신청하실 수 있습니다.</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">세금계산서, 거래내역서는 어떻게 발급 받나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">세금계산서는 결제 완료 후 사업자등록증 사본에 주문번호, 주문자명, 이메일 주소를 기재하여 팩스(02-585-8477)로 보내주시면 이메일 주소로 발행해 드립니다.<br>  
팩스 전송하신 후 꼭 고객센터(1588-2469)로 연락주셔야 발급이 가능하며, 늘봄은 법인사업자이기 때문에 전자세금계산서 발급만 가능합니다. <br>
거래내역서는 상품과 함께 배송 상자에 넣어서 보내드리고 있으며, 재발급은 불가능합니다. </div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">현금영수증은 어떻게 발급 받나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">결제 페이지에서 "현금영수증 발행"을 체크하신 후 정보를 입력해 주시면 되고, 결제 시 신청을 하지 못하신 경우 채팅 또는 1:1 문의로 요청하시면 신청해 드리겠습니다.<br>
다만, 수기 발행은 주문한 해당 년도에만 발행이 가능합니다.</div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">발급 받은 무통장 계솨로 송금이 되지 않아요.</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">무통장 계좌는 결제금액과 일치하지 않거나 계좌가 생성된 다음날 자정이 지나면 입금이 되지 않습니다.</div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">무통장 계좌에 주문자와 다른 이름으로 입금해도 되나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">무통장 계좌는 정확한 금액이 입금되면 입금자명과 관계 없이 정상 입금 처리됩니다.</div>
    </li>
        <li class="qa_li">
        <div class="question">
            <p class="tit">무통장 계좌를 발급 받은 후에 은행과 계좌번호를 변경할 수 있나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">발급 받은 무통장 계좌의 은행명과 계좌번호의 변경은 불가능합니다.<br> 
새로운 은행과 계좌번호가 필요할 경우 주문 단계를 처음부터 다시 진행하시면 됩니다.</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">무통장 결제는 어떻게 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">무통장 계좌는 각 주문마다 일회성으로 생성되는 전용 계좌이며 주문 시 주문확인 페이지 상단의 "결제방법'에서 선택하시면 됩니다.<br>
발급 받은 계좌로는 결제금액과 일치해야만 입금이 되며, 입금자명은 동일하지 않아도 됩니다.<br> 
또한, 무통장 계좌는 생성된 다음날 자정까지 입금하지 않으면 자동 소멸되고 주문도 취소됩니다.</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">질문3</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">답변3</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">질문3</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">답변3</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">질문3</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">답변3</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">질문3</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">답변3</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">질문3</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">답변3</div>
    </li>
    
        
</ul>

다른 도움이 필요하신가요?
<button type="button" class="btn btn-outline-primary">1:1 문의하기</button>


</body>
</html>