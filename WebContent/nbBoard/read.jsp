<%@page import="VO.CommentVO"%>
<%@page import="DAO.FreeBoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VO.FreeBoardVo"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
  request.setCharacterEncoding("UTF-8");
  String contextPath = request.getContextPath();
  //조회한 글정보 얻기
  FreeBoardVo vo = (FreeBoardVo) request.getAttribute("vo");
  String writerId = vo.getB_id();
  String name = vo.getB_nickname();
  String nickname = vo.getB_nickname();
  String title = vo.getB_title();
  String content = vo.getB_content();
  String file = vo.getB_file();
  Date date = vo.getB_date();
  int cnt = vo.getB_cnt();
  int b_idx = vo.getB_idx();
  int like = vo.getB_like();

  String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시글 상세</title>
  <link href="../css/Team_FreeBoard.css" rel="stylesheet" type="text/css" />
</head>

<body>
  <div class="post-Container">
    <div class="post">
      <div class="post-header">
        <h2 class="post-title"><%=title%></h2>
        <div class="post-info">
          작성자: <%=name%> | 작성일자: <%=date%> | 조회수: <%=cnt%> | 추천수: <span id="topLike"><%=like%></span>
        </div>
      </div>
      <div class="post-body">
        <p><%out.print(content);%></p>
      </div>
    </div>
    <div class="post-buttons">
      <c:if test="${not empty vo.b_realfile}">
        <a href="<%=contextPath%>/freeboard/download.fb?idx=<%=b_idx%>"><%=file%></a>
      </c:if>
        <input type="button" value="목록으로"
               onclick="location.href='list.fb?nowPage=0&nowBlock=0'" id="list" />
      <!-- 수정,삭제는 세션아이디와 조회한 글의 작성자아이디가 동일할때만 노출시키기 필요 -->

      <c:if test="${sessionScope.id eq vo.b_id}">
        <input type="button" value="수정하기" onclick="location.href='modify.fb?b_idx=<%=b_idx%>'"/>
        <input type="button" value="삭제하기" onclick="javascript:del('<%=b_idx%>');" id="delete"/>
      </c:if>
    </div>
    <div style="display: flex; flex-direction: column;">
      <div>
        <%
          if ((String) request.getAttribute("likeCheck") == "0") { //좋아요를 안 눌렀다면?
        %>
        <a id="likeimgg" onclick="javascript:clickLike('<%=id%>','<%=b_idx%>')">
          <i class="fa-regular fa-heart fa-4x" id="likeimggg"></i>
        </a>
        <%
          } else { //좋아요를 눌렀다면?
        %>
        <a id="likeimgg" onclick="javascript:clickLike('<%=id%>','<%=b_idx%>')">
          <i class="fa-solid fa-heart fa-4x" id="likeimggg"></i>
        </a>
        <%
          }
        %>
      </div>
      <div>
        <p id="countLike" style="font-size: 30px"><%=like%></p>
      </div>
    </div>
    <input type="hidden" id="like_check" value="${like.like_check}">
  </div>
  <div style="margin-bottom: 2%">
    <!-- 댓글시작-------------------------------------->
    <div style="margin: 0 77;">
      <table id="tblListComment" class="table table-bordered"
        style="border: none;">
        <c:if test="${ clist.size() == 0 }">
          <tr>
            <td colspan="2">댓글이 없습니다.</td>
          </tr>
        </c:if>
        <c:set var="i" value="0" />
        <c:forEach items="${ clist }" var="cdto">
          <tr>
            <td>
              <!-- 댓글 표시&수정창 -->
              <form id="commentUpdate${i}"
                action="<%=contextPath%>/freeboard/upcomment.do"
                method="post">
                <textarea
                  style="width: 100%; background-color: white; resize: none; border: none;"
                  id="updateActive${i}" rows="3" name="commupdate"
                  cols="60" disabled="disabled">${cdto.content}</textarea>
                <input type="hidden" value="${cdto.seq}" name="seq2" />
                <input type="hidden" value="<%=b_idx%>" name="b_idx" />
              </form> <span>${ cdto.name }. ${ cdto.regdate }</span>
            </td>
            <td style="border: none;">
              <!-- 댓글 작성자만 수정/삭제 버튼이 보이게 처리 c:if --> <c:if
                test="${ id eq cdto.id}">
                <input id="update${i}" type="button" value="수정하기"
                       onclick="updateActive('${i}')" class="btn btn-default">
                <input id="updatePro${i}" type="button" value="수정완료"
                       class="btn btn-default" style="display: none;"
                       onclick="comment('${i}');" />
                <input type="button" value="삭제하기"
                  class="btn btn-default"
                  onclick="location.href='<%=contextPath%>/freeboard/delcomment.do?seq=${ cdto.seq }&pseq=<%=b_idx%>';" />
              </c:if>
            </td>
          </tr>
          <c:set var="i" value="${i+1}" />
        </c:forEach>
      </table>
      <!-- 로그인 세션값이 있어야 댓글작성 form이 노출되도록 수정 -->
      <c:if test="${not empty sessionScope.id}">
        <form method="POST"
          action="<%=contextPath%>/freeboard/addcomment.do">
          <table style="border: none;" id="tblAddComment"
            class="table table-bordered">
            <tr style="border: none;">
              <td style="border: none;"><input type="text"
                name="content" id="content" class="form-control"
                required placeholder="댓글을 작성하세요. " /></td>
              <td style="border: none;"><input type="submit"
                value="댓글쓰기" class="btn btn-primary" /></td>
            </tr>
          </table>
          <input type="hidden" name="pseq" value="<%=b_idx%>" />
        </form>
      </c:if>
    </div>
    <!-- 댓글끝------------------------------------ -->
    <div style="margin-bottom: 2%">
      <jsp:include page="list.jsp">
        <jsp:param value="0" name="nowBlock" />
        <jsp:param value="0" name="nowPage" />
        <jsp:param value="${list}" name="list" />
        <jsp:param value="${count}" name="count" />
      </jsp:include>
    </div>
  </div>

    <script src="../js/Team_freeboard.js"></script>
</body>
</html>