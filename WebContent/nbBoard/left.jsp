<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
	String select = (String)request.getAttribute("pageChange");
%>

<html>
<head>
<meta charset="utf-8">
<title>FAQ 2</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


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


<h1 align="center" style="font-size:50px"><b>자주 묻는 질문</b></h1>


<button type="button" class="btn btn-primary btn-lg" id="qna1" onclick="test(1)">자주묻는질문</button>
<button type="button" class="btn btn-primary btn-lg" id="qna2" onclick="test(2)">회원서비스</button>
<button type="button" class="btn btn-primary btn-lg" id="qna3" onclick="test(3)">주문/결제</button>
<button type="button" class="btn btn-primary btn-lg" id="qna4" onclick="test(4)">배송</button>
<button type="button" class="btn btn-primary btn-lg" id="qna5" onclick="test(5)">취소/반품/교환</button>
<button type="button" class="btn btn-primary btn-lg" id="qna6" onclick="test(6)">사이트이용/혜택</button>
<c:choose>
	<c:when test="<%=select == null %>">
<jsp:include page="qna1.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="<%=select%>"/>
</c:otherwise>
</c:choose>

<script type="text/javascript">
function test(qnaNum) {
	location.href='/TeamProject/review/qna.bo?pageChange=qna'+qnaNum+'.jsp';
}

</script>
</body>
</html>