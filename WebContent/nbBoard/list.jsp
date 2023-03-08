<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
//	ArrayList list = (ArrayList)request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<% 
	
	
	//페이징 처리 변수
	
	int totalRecord = 0; //board테이블에 저장된 글의 총 개수
	int numPerPage = 10; //한 페이지당 조회해서 보여줄 글 개수
	int pagePerBlock = 5; //한 블럭당 묶여질 페이지 번호 개수 
						 // 1 2 3 < - 한블럭으로 묶음
	int totalPage = 0; //총 페이지수
	int totalBlock = 0; //총 블럭수
	int nowPage = 0; //현재 사용자에게 보여지고 있는 페이지가 위치한 번호 저장
	int nowBlock = 0; //클릭한 페이지 번호가 속한 블럭 위치 번호 저장
	int beginPerPage = 0; //각 페이지마다 보여지는 시작 글번호(맨위의 글번호) 저장
	
	//BoardController에서 재요청해서 전달한 request에 담긴 ArrayList배열 꺼내오기
	//조회된 글들
	ArrayList list = (ArrayList)request.getAttribute("list");
	
 	//조회된 총 글 갯수
	totalRecord = (Integer)request.getAttribute("count");
	
	//현재 페이지 번호를 클릭했다면?
	if( request.getAttribute("nowPage") != null ){
		nowPage = Integer.parseInt( request.getAttribute("nowPage").toString());
	}
	
	//각 페이지 번호에 보여지는 글 목록의 가장위의 글에 대한 글번호 구하기
	beginPerPage = nowPage * numPerPage;
	System.out.print(beginPerPage);
	/*
		beginPerPage변수 설명
		예를 들어 한페이지당 보여질 글의 개수가 6개라고 가정할때...
		1번페이지 일 경우.. 1번페이지에 보여질 시작 글번호는 6이다.
		nowPage * numPerPage;
		1페이지 번호 * 한페이지당 보여지는 글의 개수6; = 시작글번호 6
		
		2페이지 일 경우.. 2번페이지에 보여질 시작 글번호는 12이다.
		nowPage * numPerPage;
		1페이지 번호 * 한페이지당 보여지는 글의 개수6; = 시작글번호 12
	*/
	
	//글이 몇개인지에 따른 총 페이지 번호 개수
	//총 페이지 번호 개수 = 총 글의 갯수 / 한페이지당 보여질 글 개수
	//참고! 하나의 글이 더 오버할 경우 마지막페이지에 하나의 글을 보여줘야 하기 때문에 올림 처리
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		
	//클릭한 페이지 번호가 속한 블럭 위치 번호 구하기
	if(request.getAttribute("nowBlock") != null){
		//BoardController로 부터 전달 받는다.
		nowBlock = Integer.parseInt(request.getAttribute("nowBlock").toString());
		
	}
	
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	
	String id = (String)session.getAttribute("id");
	
%>	





    <!--요소 시작-->
    <div class="Contents-Box">
      <!--제목-->
<!--       <form class="Form-Box Title-And-Del" action="#"> -->
        <div class="Title">
          <span>자 유 게 시 판</span>
        </div>
        <form action="<%=contextPath%>/freeboard/searchlist.fb" 
							method="post" 
							name="frmSearch" onsubmit="javascript:fnSearch();" >
							
	            	<td colspan="2">
	            		<div align="right"> 
		            		<select name="key">
		              			<option value="titleContent">제목 + 내용</option>
		              			<option value="nickname">작성자</option>
		              		</select>
		              	</div>
	              	</td>
		            <td width="26%">
		            	<div align="center"> &nbsp;
		            		<input type="text" name="word" id="word"/>
		            		<input type="submit" id="go" value="검색하기">
		            	</div>
		            </td>
	            </form>
<!--       </form> -->
      <!--목록-->
       <div class="List-Box">
        <ul>
          <li style="width: 10%">
            <span>글번호</span>
          </li>
          <li style="width: 15%">
            <span>닉네임</span>
          </li>
          <li style="width: 40%">
             <span>제목</span>
          </li>
          <li style="width: 15%">
            <span>작성일</span>
          </li>
          <li style="width: 10%">
            <span>조회수</span>
          </li>
          <li style="width: 10%">
            <span>추천</span>
          </li>
        </ul>
        <!--1-->
        <!--{{#each contents}}-->
        
        <%
		for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++){
			//만약 각페이지마다 보여지는 시작글번호가  게시판의 총글의 개수와 같으면 
			if(i == totalRecord){
				break;
			}
        		FreeBoardVo vo =(FreeBoardVo) list.get(i);
        %>
        		
         <a href="javascript:fnRead('<%=vo.getB_idx()%>')" class="List-1 flex">
                <div style="width: 10%">
                  <span><%=vo.getB_idx()%></span>	
                </div>
                <div style="width: 15%">
                  <span><%=vo.getB_nickname() %></span>
                </div>
                <div style="width: 40%">
                <!--  글 제목 옆에  댓글 수 표시되게 수정 --> 
                  <span><%=vo.getB_title() %>
	                <c:if test="${ dto.ccnt > 0 }">
						<span class="badge">${ dto.ccnt }</span>
					</c:if>
				</span>
				<!--  글 제목 옆에  댓글 수 표시되게 수정 --> 
                </div>
                <div style="width: 15%">
                  <span><%=vo.getB_date() %></span>
                </div>
                <div style="width: 10%"">
                  <span><%=vo.getB_cnt() %></span>
                </div>
                <div style="width: 10%"">
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
 
 
 <table>
 	<tr align="center"> 
		<td  colspan="3" align="center">
		Go To Page
		<%   
			if(totalRecord != 0){//DB에 글이 있다면?
					
				if(nowBlock > 0){//현재 클릭한 페이지번호가 속한 블럭위치가 0 보다 크다면?
		%>			
					<a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1) * pagePerBlock)%>">
						◀ 이전<%=pagePerBlock%>개
					</a>
		<%		}//안쪽 if %>
			
				
		<%
				for(int i=0; i<pagePerBlock; i++){
		%>			
					&nbsp;&nbsp;
					<a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock * pagePerBlock)+i%>">
						<%=(nowBlock * pagePerBlock)+i+1 %>	
						<%if((nowBlock * pagePerBlock)+i+1 == totalPage) break; %>
					</a>
					&nbsp;&nbsp;
		<%			
				}
		%>		
			   
			 
		<%
				if(totalBlock > nowBlock + 1){
		%>			
					
					<a href="<%=contextPath%>/freeboard/list.fb?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1) * pagePerBlock)%>">
						  ▶ 다음 <%=pagePerBlock%>개
					</a>
				
		<%			
				}
		%>	   
			   	
				
				
		<% }//바깥 if %>
		
		
		</td> 
	</tr>
 </table>
 
    <form name="frmRead">
       <input type="hidden" name="b_idx">
    </form>
 
 
 <script type="text/javascript">
 
    function fnRead(val){
       document.frmRead.action = "<%=contextPath%>/freeboard/read.fb";
       document.frmRead.b_idx.value = val;
       document.frmRead.submit();
    }
    
    function fnSearch(){
        var word = document.getElementById("word").value;
        if(word == null || word == ""){
           alert("검색어를 입력하세요.");
           document.getElementById("word").focus();
           return false;
        }
        else{
//         	var wordValue = document.getElementById("word").value;
<%--         	document.getElementById("go").setAttribute("href","<%=contextPath%>/freeboard/list.fb?word="); --%>
//         	alert(wordValue);	
           document.frmSearch.submit();
        }
     }
    
    
 
 </script>
 
 

</body>
</html>