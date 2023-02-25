<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	ArrayList list = (ArrayList)request.getAttribute("list");
/* 	
	int count = Integer.getInteger( request.getParameter("count") );
	System.out.print(count);
 */%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--테일윈드-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.17/tailwind.min.css">
<!--폰트어썸-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../css/Team_FreeBoard.css">
</head>
<body>
<!--
function fnSearch(){
		var word = document.getElementById("word").value;
		if(word == null || word == ""){
			alert("검색어를 입력하세요.");
			document.getElementById("word").focus();
			return false;
		}
		else{
			document.frmSearch.submit();
		}
	}
	
	//글제목 하나를 클릭했을때 글 번호를 매개변수로 받아서 <form>로
	//글번호에 해당되는 글의 정보를 DB로부터 조회 요청을 BoardController로 합니다.
	function fnRead(val){
		document.frmRead.action = "<%=contextPath%>/FileBoard/read.bo";
		document.frmRead.b_idx.value = val;
		document.frmRead.submit();
	}



  -->

<%-- 	<%
	//페이징처리
		int totalRecord = 0;
		int numPerPage = 5;	//한페이지에 보여줄 글 개수
		int pagePerBlock =5; //한 블럭당 묶여질 페이지 번호 개수
		int beginPerPage = 0; 		//각 페이지 처음 
		
		int totalPage = 0;	//총 페이지 수
		int totalBlock = 0;	//총 블락 수
		int nowPage = 1;	//현재 페이지
		int nowBlock = 0;	//현재 블럭
		
		
		
		totalRecord = count;
		beginPerPage = nowPage * numPerPage;
		totalPage = (int) Math.ceil( (double) totalRecord / numPerPage);
		totalBlock = (int) Math.ceil(  ((double) totalPage / pagePerBlock));
		
		
		
		
	%>

 --%>


    <!--요소 시작-->
    <div class="Contents-Box">
      <!--제목-->
      <form class="Form-Box Title-And-Del" action="#">
        <div class="Title">
          <span>공지사항</span>
        </div>
        <div class="Sel-And-Del-Btn" style="height: 30px">
        	<input type="text" >
          <input class="Del-Btn" type="submit" value="검색">
        </div>
      </form>
      <!--목록-->
      <div class="List-Box">
        <ul>
          <li>
            <span>목록</span>
          </li>
          <li>
            <span>닉네임</span>
          </li>
          <li>
          	<span>제목</span>
          </li>
          <li>
            <span>작성일</span>
          </li>
          <li>
            <span>조회수</span>
          </li>
          <li>
            <span>좋아요</span>
          </li>
        </ul>
        <!--1-->
        <!--{{#each contents}}-->
        
        <%
        	for(int i = 0 ; i <list.size();i++){
        		FreeBoardVo vo =(FreeBoardVo) list.get(i);
        		
        %>
        		
                <a href="#" class="List-1 flex">
                <div style="width: 5%">
                  <span><%=vo.getB_idx()%></span>	
                </div>
                <div style="width: 15%">
                  <span><%=vo.getB_nickname() %></span>
                </div>
                <div style="width: 50%">
                  <span><%=vo.getB_title() %></span>
                </div>
                <div style="width: 15%">
                  <span><%=vo.getB_date() %></span>
                </div>
                <div style="width: 7.5%">
                  <span><%=vo.getB_cnt() %></span>
                </div>
                <div style="width: 7.5%">
                  <span><%=vo.getB_like() %></span>
                </div>
              </a>
        <%       
        	}
        %>

      </div>
      
      
      <!--글쓰기 버튼-->
      <form class="Form-Box List-Move-Number" method="post" action="<%=contextPath%>/freeboard/write.fb">
        <div class="Number">
          <!--1-->
          <div class="mave-btn-1">
            <div class="page-text 1-page-text">
              <span id="li{{this}}">
                <!--{{this}}-->
<!--                 1 -->
              </span>
            </div>
          </div>
          <!--2-->
          <div class="mave-btn-2" >
            <div class="page-text 1-page-text">
              <span id="li{{this}}">
                <!--{{this}}-->
<!--                 2 -->
              </span>
            </div>
          </div>
          <!--3-->
          <div class="mave-btn-3" >
            <div class="page-text 1-page-text">
              <span id="li{{this}}">
                <!--{{this}}-->
<!--                 3 -->
              </span>
            </div>
          </div>
        </div>
        <!--작성하기 버튼-->
        <div class="Up-Btn">
        
   		  	<input type="hidden" name="gildong" value="hong">
          <input type="submit" value="글쓰기">
        </div>
      </form>
    </div>
   	
 
 
 

</body>
</html>