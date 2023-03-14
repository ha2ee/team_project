<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.center_Container {
	position:relative;
	width:1200px;
	min-width : 1200px;
	height : 800px;
	min-height : 800px;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	margin: 0 auto;
}

.link {
text-decoration: none;
color : #000;
display : inline-block;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
width: 150px;
}

.link:hover {
text-decoration: underline;
}


.center_Container>div {
	width:600px;
	height: 50%;
	box-sizing: border-box;
	border: 1px solid #888;
	text-align: center;
}

.center_Container>div:nth-child(1) {
	background: #fcc;
}

.center_Container>div:nth-child(2) {
	background: #cfc;
}

.center_Container>div:nth-child(3) {
	background: #fcf;
	width: 400px;
	height : 50%;
}

.center_Container>div:nth-child(4) {
	background-color: #cff;
	width: 400px;
	height : 50%;
}
.center_Container>div:nth-child(5) {
	background: #888;
	width: 400px;
	height : 50%;
}

.seeMore {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  position:relative;
  top : -45px;
  right : 15px;
  text-decoration: none;
}

.seeMore:hover,
.seeMore:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.center_memTable,.center_trTable, .center_trBoardTable {
	border-collapse: collapse;
	margin : 0 auto;
}

.center_memTable th, .center_memTable td, .center_trTable th, .center_trTable td {
	text-align: center;
	border-bottom: 1px solid #888;
	width : 20%;
	height:30px;
}
.center_memTable th, .center_trTable th{
	background-color: #EAEAEA;
}

</style>
</head>
<body>
	center 페이지
	<div class="center_Container">
		<div class="centerBox_1"><h3>회원목록</h3><a class="seeMore" href="${contextPath}/adm/memManage.adm">&#43;</a><hr>
		<table class="center_memTable" >
			<tr>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 닉네임</th>
				<th>회원 전화번호</th>
				<th>회원 가입일</th>
			</tr>
			<c:forEach var="mem" items="${requestScope.membersList}">
				<tr>
					<td><a class="link" href="${contextPath}/adm/memDetail.adm?memberID=${mem.mem_id}"><b>${mem.mem_id}</b></a></td>
					<td>${mem.mem_name}</td>
					<td>${mem.mem_nick}</td>
					<td>${mem.mem_hp}</td>
					<td>${mem.mem_joindate}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
		<div class="centerBox_2"><h3>트레이너 목록</h3><a class="seeMore" href="${contextPath}/adm/trManage.adm">&#43;</a><hr>
			<table class="center_trTable" >
				<tr>
					<th>트레이너 아이디</th>
					<th>트레이너 이름</th>
					<th>트레이너 전화번호</th>
					<th>트레이너 가입일</th>
				</tr>
				<c:forEach var="trMem" items="${requestScope.trMembersList}">
					<tr>
						<td><a class="link" href="${contextPath}/adm/trMemDetail.adm?trMemberID=${trMem.tr_id}"><b>${trMem.tr_id}</b></a></td>
						<td>${trMem.tr_name}</td>
						<td>${trMem.tr_hp}</td>
						<td>${trMem.tr_joindate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="centerBox_3"><h3>자유게시판</h3><a class="seeMore" href="${contextPath}/adm/memManage.adm">&#43;</a><hr></div>
		<div class="centerBox_4"><h3>훈련사 상담</h3><a class="seeMore" href="${contextPath}/adm/trBoardList.adm">&#43;</a><hr>
		<table class="center_memTable" >
            <tr>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
		<c:forEach var="trBoard" items="${requestScope.trBoardList}">
            <tr class="trBoard2">
                <td>
	               	<c:if test="${trBoard.tb_level > 0}">
	                	:RE
	                	<a class="link" href="trBoardRead.adm?tb_idx=${trBoard.tb_idx}&pageNum=1" style="width:60px; display:inline-block; vertical-align: text-bottom;" >
	                	<b>${trBoard.tb_title}</b>
                    	</a>
	                </c:if>
	                <c:if test="${trBoard.tb_level eq 0}">
                    <a class="link" href="trBoardRead.adm?tb_idx=${trBoard.tb_idx}&pageNum=1" >
                    	<b>${trBoard.tb_title}</b>
                    </a>
                    </c:if>
                </td>
                <td>
                    ${trBoard.tb_name}
                </td>
                <td>${trBoard.tb_date}</td>
            </tr>
        </c:forEach>
        </table>
		
		</div>
		<div class="centerBox_5"><h3>수강 후기</h3><a class="seeMore" href="${contextPath}/adm/memManage.adm">&#43;</a><hr></div>
	</div>
	
	
	
	
</body>
</html>