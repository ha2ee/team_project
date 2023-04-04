<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회화면</title>
</head>
<body>

	<h3>회원 상세 정보 페이지</h3>

	<table class="memDetail_Board">
		<tr>
			<th>등록된 이미지</th>
			<td>${memberVO.mem_img}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${memberVO.mem_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memberVO.mem_name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${memberVO.mem_nick}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${memberVO.mem_pw}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${memberVO.mem_email}</td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td>${memberVO.mem_hp}</td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${memberVO.mem_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${memberVO.mem_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${memberVO.mem_joindate}</td>
		</tr>
		<tr>
			<th>펫 유무</th>
			<td>${memberVO.mem_pet}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>${memberVO.mem_address1}</td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td>${memberVO.mem_address2}</td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td>${memberVO.mem_address3}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${memberVO.mem_address4}</td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td>${memberVO.mem_address5}</td>
		</tr>						
	</table>
	
<button onclick="openModal()">정보수정하기</button>
<button id="delMem" onclick="location.href='${contextPath}/adm/delMem.adm?delID=${memberVO.mem_id}'">회원삭제하기</button>


<div id="memModal" class="modal">
  <div class="modal-content">
    <span class="close" onclick="closeModal()">&times;</span>
   	<form action="${contextPath}/adm/updatePro.adm" method="post" id="updateForm">
   	<input type="hidden" value="${memberVO.mem_id}" name="id">
   	<h2>회원정보 수정</h2>
    	<table>
		<tr>
			<th>등록된 이미지</th>
			<td>${memberVO.mem_img}<button type="button" onclick="resetImg('${memberVO.mem_id}');">이미지 초기화</button></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${memberVO.mem_id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${memberVO.mem_name}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" value="${memberVO.mem_nick}" name="nickname" id="nickname"><button id="checkBtn" type="button">닉네임중복체크</button><p id="nickInput"></p> </td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" value="${memberVO.mem_pw}" name="pass" id="pass"><p id="passInput"></p></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="text" value="${memberVO.mem_pw}" name="checkpass" id="checkpass"><p id="checkpassInput"></p></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="${memberVO.mem_email}" name="email" id="email"><p id="emailInput"></p></td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td><input type="text" value="${memberVO.mem_hp}" name="hp" id="hp"><p id="hpInput"></p></td>
		</tr>
		<tr>
			<th>생일</th>
			<td>${memberVO.mem_birth}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${memberVO.mem_gender}</td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td>${memberVO.mem_joindate}</td>
		</tr>
		<tr>
			<th>펫 유무</th>
			<td>
				<select class="pet" name="pet" id="pet">
					<option value="네">네</option>
					<option value="아니요">아니요</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="text" value="${memberVO.mem_address1}" id="sample4_postcode" name="address1" readonly="readonly"> <p id="addressInput"></p> </td>
		</tr>
		<tr>
			<th>도로명주소</th>
			<td><input type="text" value="${memberVO.mem_address2}" id="sample4_roadAddress" name="address2" readonly="readonly"></td>
		</tr>
		<tr>
			<th>지번주소</th>
			<td><input type="text" value="${memberVO.mem_address3}" id="sample4_jibunAddress" name="address3" readonly="readonly"><span id="guide" style="color:#999; display:none;"></span></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" value="${memberVO.mem_address4}" id="sample4_detailAddress" name="address4"></td>
		</tr>
		<tr>
			<th>참고항목</th>
			<td><input type="text" value="${memberVO.mem_address5}" id="sample4_extraAddress" name="address5" readonly="readonly"></td>
		</tr>						
	</table>
	<a href="#" id="adClick" onclick="sample4_execDaumPostcode(); return false;" style="text-decoration: none; color:black;">우편번호찾기</a>
<a href="#" onclick="check(); return false;" type="button" id="update" style="text-decoration: none; color:black;">정보수정</a>
</form>
  </div>
</div>
	
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/adminPageList.js"> </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
document.getElementById("pet").value="${memberVO.mem_pet}";
</script>
</body>
</html>