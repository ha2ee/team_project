<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트레이너 정보 조회화면</title>
<style type="text/css">
.memDetail_Board {
border-collapse: collapse;
width : 1200px;
}

.memDetail_Board th, .memDetail_Board td {
		  padding: 10px 20px; 
 		  text-align: center; 
		  border: 1px solid #ddd; 
		}
		
.memDetail_Board td {
	width : 80%;
}

.updateMem {
border : none;
outline : none;
text-align : center;
font-size: 16px;
readonly:none;

}

/* input[type="text"] {
border : none;
outline : none;
text-align : center;
font-size: 16px;
readonly:readonly;

} */

/* 모달 창 스타일 */
.modal {
  display: none; /* 모달 창을 초기에 숨김 */
  position: fixed; /* 모달 창이 화면에 고정됨 */
  z-index: 1; /* 다른 요소들보다 위에 표시됨 */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* 모달 내용이 화면 크기를 초과하면 스크롤바를 표시함 */
  background-color: rgba(0,0,0,0.4); /* 배경색을 검정색 반투명으로 지정 */
}

/* 모달 내용 스타일 */
.modal-content {
  background-color: white;
  margin: 10% auto; /* 모달 창이 화면 중앙에 위치하도록 함 */
  padding: 20px;
  border: 1px solid #888;
  width: 800px;
}

.modal-content table {
	width : 100%;
	margin : 0 auto;
	border: 1px solid #888;
}

.modal-content th {
	text-align: center;
	width : 30%;
}

.modal-content td {
	width : 70%;
}
input[type="text"] {
	width: 250px;
}

p {
font-size: 10px;
display: inline;
}

/* 모달 닫기 버튼 스타일 */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
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
<a href="${contextPath}/adm/delMem.adm?delID=${trainerVo.tr_id}">트레이너삭제하기</a>
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