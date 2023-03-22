<%@page import="VO.ReviewVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%
  request.setCharacterEncoding("UTF-8");
  String contextPath = request.getContextPath(); 
  String reviewUploadPath = contextPath + "/reviewUpload/";
  System.out.println(contextPath);
  System.out.println(reviewUploadPath);
  
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Album example · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
    <script src="https://cdn.jsdelivr.net/gh/marshallku/infinite-scroll/dist/infiniteScroll.js"></script>
    
    

    

<link href="../css/review.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      .card-text{
/*       padding: 1rem; */
 
      /* 추가하기 */
      display: -webkit-box;
      -webkit-line-clamp: 3;
     -webkit-box-orient: vertical; 
      overflow: hidden;
      }
      
      .card-content__more-btn {
  appearance: none;
  border: 1px solid black;
  padding: 0.5em;
  border-radius: 0.25em;
  cursor: pointer;
  margin: 1rem;
    }

    .card-content__more-btn::before {
      content: '더보기';
    }
    
    .card-content__more-btn:checked::before {
      content: '닫기';
    }
    
    .card-text:has(+ .card-content__more-btn:checked) {
      -webkit-line-clamp:unset
    }
      
    </style>

    
  </head>
  <body style="font-size: 15px;">
<!--  스무스하게 내려갔다 올라가는 슬라이드??? 일단 킵
<header>
  <div class="collapse bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4 class="text-white">About</h4>
          <p class="text-muted">Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4 class="text-white">Contact</h4>
          <ul class="list-unstyled">
            <li><a href="#" class="text-white">Follow on Twitter</a></li>
            <li><a href="#" class="text-white">Like on Facebook</a></li>
            <li><a href="#" class="text-white">Email me</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="#" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
        <strong>Album</strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>
 -->
<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">수강 후기</h1>
        <p class="lead text-muted" style="font-size: 15px;">샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라샬라</p>
        <p>
          <a class="btn btn-primary my-2" onclick="clickWrite('${sessionScope.id}')" style="font-size: 15;">수강후기 작성</a>
<!--           <a href="#" class="btn btn-secondary my-2" style="font-size: 15">추가할 액션?</a> -->
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="container">
<!-------------------------응용해보자 ------------------------->
  <c:forEach var="review" items="${requestScope.list}">
        <div class="col item">
          <div class="card shadow-sm">
           <img alt="dd" src="<%=reviewUploadPath%>${review.img}" style="height: 300px; object-fit: contain;">
            <div class="card-body">
              <div class="card-text" style="margin-bottom:0;"><b style="font-size: 15;">${review.title}</b><br><span><c:if test="${empty review.context}"><br></c:if>${review.context}</span></div>
              <input type="checkbox" class="card-content__more-btn">
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
<!--                   <button type="button" class="btn btn-sm btn-outline-secondary">View</button> -->
                  <c:if test="${sessionScope.id eq review.id}">
                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="del(${review.idx})">Delete</button>
                  </c:if>
                </div>
                <small class="text-muted">${review.review_date}</small>
              </div>
            </div>
          </div>
        </div>
        
  </c:forEach>
<!-------------------------응용해보자 ------------------------->
        
<!------------------------- 반복 되는 부분인 듯? ------------------------->

        </div>
        </div>
        
<!------------------------- 반복 되는 부분인 듯? ------------------------->





      </div>
</main>


    <script src="../js/review.min.js"></script>
    <script type="text/javascript">
      const fullContent = document.querySelector("#container"); // 전체를 둘러싼 컨텐츠 정보획득

      function clickWrite(id){
        if(!id){
          alert("로그인 후 작성이 가능합니다.");
        }else{
          location.href='<%=contextPath%>/review/write.rv';
        }
      }
      
      function del(idx){
  			var result = window.confirm("정말로 글을 삭제하시겠습니까?");
  			
//   			if(result == true){//확인 버튼 클릭
//   				//비동기방식으로 글삭제 요청!
//   				$.ajax({
//   					type : "post",
//   					async : true,
<%--   					url : "<%=contextPath%>/review/del.rv", --%>
//   					data : {idx : idx},
//   					dataType : "text",
//   					success : function(data){
//   						if(data==1){
//   							alert("삭제 성공!");
//   							//강제로 클릭 이벤트 발생시키는 부분
<%--   							location.href="<%=contextPath%>/review/list.rv"; --%>
//   						}else{//"삭제실패"
//   							alert("삭제에 실패했습니다.")
//   							location.reload();
//   						}
//   					},
//   					error : function(){
//   						alert("비동기 통신 장애");
//   					}
//   				});
//   			}else{//취소 버튼을 눌렀을때
//   				return false;
//   			}
//   		}
      }
      
      
    
      function YesScroll () {
        const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
        const screenHeight = screen.height; // 화면 크기
        let oneTime = false; // 일회용 글로벌 변수
        document.addEventListener('scroll',OnScroll,{passive:true}) // 스크롤 이벤트함수정의
         
        function OnScroll () { //스크롤 이벤트 함수
           const fullHeight = fullContent.clientHeight; // infinite 클래스의 높이   
           const scrollPosition = pageYOffset; // 스크롤 위치
           if (fullHeight-screenHeight/2 <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
             oneTime = true; // oneTime 변수를 true로 변경해주고,
             madeBox(); // 컨텐츠를 추가하는 함수를 불러온다.
           }
         }
         }
      YesScroll()

    
    
    </script>



      
  </body>
</html>
