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

<!-- 사이트 이용/혜택관련 질문페이지 -->

<ul class="listWrap">
   <li class="qa_li">
        <div class="question">
            <p class="tit">고객센터에 전화 연결이 되지 않을 경우는 어떻게 해야 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">고객센터 상담 시간은 평일 오전 9시 ~ 오후 6시이며(점심시간 오후 12시 ~ 13시), 토요일/공휴일은 휴무입니다. <br>
고객센터 상담 시간 이외 또는 상담량이 많아 전화 연결이 되지 않을 경우에는 [마이페이지 > 고객센터] 채팅 또는 1:1문의로 연락주시면 신속히 안내해 드리겠습니다.</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">포인트는 언제, 어떻게 사용 하는 건가요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">적립된 포인트는 늘봄사이트 상품 구매 시 현금처럼 할인 받아 사용하실 수 있으니<br>
학습을 통해 포인트도 적립하시고 할인 혜택도 받아보세요!<br><br>

* 포인트는 적립일 기준으로부터 1년 간 유효하며 소멸된 포인트는 복구되지 않으니 이용에 참고 부탁드립니다.<br>
* 포인트는 7만원 이상 구매시 적용 가능하며, 일부 특가 및 프로모션 상품은 포인트 적용이 불가할 수 있습니다.<br><br>


추가 문의사항은 고객센터로 연락주시거나<br>
마이페이지 1:1 문의, 카카오톡 상담을 통해 문의 부탁드립니다!<br>
감사합니다. <br><br>

[고객센터 운영시간]<br>
평일 오전 09:30~ 오후 06:30<br>
주말, 공휴일 휴무</div>
    </li>
    
    <li class="qa_li">
        <div class="question">
            <p class="tit">수강 중에 동영상이 자꾸 끊겨요.</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">학습은 온라인 스트리밍 방식으로 진행됩니다.<br>
동영상 재생 시 속도가 느리거나 끊기는 증상은 대부분 네트워크 환경(와이파이, 데이터 속도제한 등)이 원활하지 않아 재생에 영향이 가는 경우가 많습니다.<br><br>

먼저 네트워크 환경이 원활한 지 확인 및 다른 네트워크로 변경해보시고 <br>
웹 브라우저의 인터넷 사용 기록을 삭제 후 다시 한 번 접속 부탁드립니다. <br>
어플리케이션(아이폰,안드로이드)의 경우 최신 버전인지 함께 확인 부탁드립니다.</div>
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