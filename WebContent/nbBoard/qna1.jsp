<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	String contextPath = request.getContextPath();
%>

<html>
<head>
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
<style>
@import url('http://fonts.googleapis.com/earlyaccess/notosanskr.css');
/* ul, li, p { list-style:none; padding:0; margin:0; } */
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

<!-- 전제질문페이지 -->

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
            <p class="tit">택배사 파업지역인데 타 택배로 발송 가능한가요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">- 파업으로 배송이 원활하지 않은 지역은 타 택배를 통해 대체 발송됩니다.<br>
- 타 택배 발송 대상 건에도 CJ대한통운 발송 완료 기본 알림이 전송됩니다.<br>
-  마이페이지 > 주문 · 배송 페이지에는 CJ대한통운 운송장 번호가 확인되지만 실제 배송은 타 택배사를 통해 진행됩니다.<br>
- 타 택배 발송 완료 후, 문자로 실제 배송 정보를 전달드립니다.</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">고객센터에 전화 연결이 되지 않을 경우는 어떻게 해야 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">고객센터 상담 시간은 평일 오전 9시 ~ 오후 6시이며(점심시간 오후 12시 ~ 13시), 토요일/공휴일은 휴무입니다. 
고객센터 상담 시간 이외 또는 상담량이 많아 전화 연결이 되지 않을 경우에는 [마이페이지 > 고객센터] 채팅 또는 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</div>
    </li>
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
            <p class="tit"></p>
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