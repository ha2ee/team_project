<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 정보 조회화면</title>
</head>
<body>

	<h3>회원 상세 정보 페이지</h3>

	<table class="memDetail_Board">
		<tr>
			<th>등록된 이미지</th>
			<td>${trainerVo.tr_img}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${trainerVo.tr_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${trainerVo.tr_name}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${trainerVo.tr_pw}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${trainerVo.tr_email}</td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td>${trainerVo.tr_hp}</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${trainerVo.tr_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${trainerVo.tr_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${trainerVo.tr_joindate}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${trainerVo.tr_address1}</td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td>${trainerVo.tr_address2}</td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td>${trainerVo.tr_address3}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${trainerVo.tr_address4}</td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td>${trainerVo.tr_address5}</td>
		</tr>						
	</table>
	
<button onclick="openModal()">정보수정하기</button>
<button id="delMem" onclick="location.href='${contextPath}/adm/delMem.adm?delID=${trainerVo.tr_id}'">트레이너삭제하기</button>
<div id="memModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
   	<form action="${contextPath}/adm/trUpdatePro.adm" method="post" id="updateForm">
   	<input type="hidden" value="${trainerVo.tr_id}" name="id">
   	<h2>회원정보 수정</h2>
    	<table>
		<tr>
			<th>등록된 이미지</th>
			<td>${trainerVo.tr_img}<button type="button" onclick="resetImg('${trainerVo.tr_id}');">이미지 초기화</button></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${trainerVo.tr_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${trainerVo.tr_name}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" value="${trainerVo.tr_pw}" name="pass" id="pass"><p id="passInput"></p></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="text" value="${trainerVo.tr_pw}" name="checkpass" id="checkpass"><p id="checkpassInput"></p></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="${trainerVo.tr_email}" name="email" id="email"><p id="emailInput"></p></td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td><input type="text" value="${trainerVo.tr_hp}" name="hp" id="hp"><p id="hpInput"></p></td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${trainerVo.tr_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${trainerVo.tr_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${trainerVo.tr_joindate}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" value="${trainerVo.tr_address1}" id="sample4_postcode" name="address1" readonly="readonly"> <p id="addressInput"></p> </td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type="text" value="${trainerVo.tr_address2}" id="sample4_roadAddress" name="address2" readonly="readonly"></td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td><input type="text" value="${trainerVo.tr_address3}" id="sample4_jibunAddress" name="address3" readonly="readonly"><span id="guide" style="color:#999; display:none;"></span></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" value="${trainerVo.tr_address4}" id="sample4_detailAddress" name="address4"></td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td><input type="text" value="${trainerVo.tr_address5}" id="sample4_extraAddress" name="address5" readonly="readonly"></td>
		</tr>						
	</table>
	<a href="#" id="adClick" onclick="sample4_execDaumPostcode(); return false;" style="text-decoration: none; color:black;">우편번호찾기</a>
<!-- 	<input type="submit" value="정보수정" style="float:right; position:relative; bottom:30px;"> -->
<a href="#" onclick="check(); return false;" type="button" id="update" style="text-decoration: none; color:black;">정보수정</a>
</form>
  </div>
</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${contextPath}/js/adminPageList.js"> </script>

</body>
</html>