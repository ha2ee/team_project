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
            <p class="tit">무통장 결제는 어떻게 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">무통장 계좌는 각 주문마다 일회성으로 생성되는 전용 계좌이며 주문 시 주문확인 페이지 상단의 "결제방법'에서 선택하시면 됩니다.<br> 
발급 받은 계좌로는 결제금액과 일치해야만 입금이 되며, 입금자명은 동일하지 않아도 됩니다. <br> 
또한, 무통장 계좌는 생성된 다음날 자정까지 입금하지 않으면 자동 소멸되고 주문도 취소됩니다.</div>
    </li>
    <li class="qa_li">
        <div class="question">
            <p class="tit">신용카드 결제가 되지않을경우 어떻게 하나요?</p>
            <p class="iconDiv"><img src="https://happyjung.diskn.com/data/lecture/icon_jquery_faq2_icon_arrow.png"></p>
        </div>
        <div class="answer">신용카드 결제가 되지 않는 것은 PC 환경 또는 Active X 컨트롤이 정상적으로 설치되지 않은 경우들로 상황에 따라 다음과 같이 하시면 됩니다. <br> <br> 
  
1. 결제수단 선택 후 결제창이 나타나지 않는 경우<br> 
 (1) 임시 파일 및 쿠키 삭제<br> 
     “인터넷 익스플로러 > 도구 > 인터넷 옵션” 클릭 후 일반 탭에서 검색기록, 쿠키 선택 후 삭제<br> 
 (2) 오류 자동복구 및 프로그램 실행<br> 
  ① http://www.inicis.com/blog/archives/496에 접속 <br> 
  ② 'INIpay 마법사' 프로그램 실행<br> 
  ③ 'INIpay 마법사' 안내에 따라 PC점검 및 결제창 플러그인 설치 진행<br> <br> 
  
2. 결제 중 Load Library Error라는 에러 메시지가 나오는 경우<br> 
 (1) 현재 실행 중인 플러그인 모두 닫기<br> 
 (2) 새로운 인터넷 브라우저 실행<br> 
 (3) 주소 입력 부분에 "http://www.inicis.com/Support_new/Demo_INIsecurepay.php" 입력하고 엔터키 클릭<br> 
 (4) 지불 테스트 화면이 나타나면 ‘지불’ 버튼 클릭<br> 
 (5) 정상적으로 신용카드 입력 화면이 나오는지 확인<br> 
 (6) 정상 작동하면 다시 결제 시도<br> <br> 
   
3. "initialize fail(초기화 실패)" 또는 "플러그인 초기화"라고 나오는 경우<br> 
 (1) 열려 있는 인터넷 익스플로러 창 모두 닫기<br> 
 (2) C:\WINDOWS\Downloaded Program Files 에서 KVPplugin00 Control 파일 삭제<br> 
 (3) 다시 인터넷안전결제(ISP)를 신청하거나, 수동설치파일을 설치한 후 재신청<br> <br> 
  
4. 카드번호와 이메일 주소 입력 후 다음 단계로 넘어가지 못하고 화면이 종료되는 경우<br> 
 (1) 시작 버튼을 클릭하고 검색의 "파일 또는 폴더 찾기"에서 kvpvcd.dll 검색<br> 
 (2) 검색결과에서 C:WINDOWSSYSTEM32(SYSTEM) 위치에 있는 kvpvcd.dll 파일을 삭제 후 다시 시도<br> <br> 

5. 크롬 브라우저에서 결제하려는데 페이지 이동이 안 되는 경우<br> 
 (1) 플러그인이 설치되지 않은 경우<br> 
  ① URL 주소 입력창 오른쪽 끝에 표시 된 "플러그인 차단 됨" 아이콘 클릭<br> 
  ② www.dogpre.com에서 "플러그인 항상 허용" 선택 후 완료 버튼 클릭<br> 
  ③ 크롬 브라우저를 새로고침(F5)한 후 결제 재시도<br> 
  ④ 재시도 해도 안 될 경우 안내 창의 [수동설치하기] 버튼을 클릭하여 플러그인을 수동으로 설치<br> 
 (2) 팝업이 차단 된 경우<br> 
  ① 크롬 브라우저의 "설정 > 고급 설정 표시"를 클릭<br> 
  ② "개인정보 > 콘텐츠 설정 > 팝업"에서 "모든 사이트에서 팝업 표시 허용"을 체크한 후 완료 클릭<br> 
  ③ 크롬 브라우저를 새로고침(F5)한 후 결제 재시도<br> <br> 

6. 파이어폭스 브라우저에서 결제하려는데 페이지 이동이 안되는 경우<br> 
 (1) 브라우저 상단에 INICIS INIpay 플러그인을 설치하라는 안내 메시지에서 "허락" 버튼 클릭<br> 
      (안내가 영문으로 제공되는 경우 "Allow www.dogpre.com to run "INICIS INIpay?" 에서 "Allow" 버튼 클릭)<br> 
 (2) URL 주소 입력창 왼쪽 상단에서 허락하고 유지한다는 버튼 클릭<br> 
      (안내가 영문으로 제공되는 경우 "Allow and Remenber" 버튼 클릭)<br> 
 (3) "결제하기" 버튼 클릭하여 결제 재시도</div>
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