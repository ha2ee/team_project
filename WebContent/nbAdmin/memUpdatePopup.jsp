<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${contextPath}/css/adminPage.css">
</head>
<style>
.memDetail_Board {
border-collapse: collapse;
width : 600px;
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
/* border : none; */
/* outline : none; */
text-align : center;
font-size: 16px;
/* readonly:none; */

}

</style>
<body>
<form action="${contextPath}/memUpdate.pro?${memberVO.mem_id}">
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
			<td><input type="text" value="${memberVO.mem_name}" class="updateMem"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" value="${memberVO.mem_nick}" class="updateMem"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" value="${memberVO.mem_pw}" class="updateMem"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" value="${memberVO.mem_email}" class="updateMem"></td>
		</tr>
		<tr>
			<th>휴대전화 번호</th>
			<td><input type="text" value="${memberVO.mem_hp}" class="updateMem"></td>
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
			<td><input type="text" value="${memberVO.mem_pet}" class="updateMem"></td>
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
	</form>
</body>
</html>