<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intro.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>






	<!-- 	주문예약 들어갈 항목 -->
	
	<form action="<%=contextPath%>/nbMember/joinPro.me" class="form">	
	<div style="height: 100px;"></div>
	<div class="container">
		<div class="row justify-content-lefts">
			<h2>이용약관</h2>
		</div>
		<div class="accordion" id="accordionExample">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left" type="button"
							data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne">
							약관동의 내용1
						</button>
					</h2>
				</div>

				<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
					data-parent="#accordionExample">
					<div class="card-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo">
							약관동의 내용2
						</button>
					</h2>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionExample">
					<div class="card-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h2 class="mb-0">
						<button class="btn btn-link btn-block text-left collapsed"
							type="button" data-toggle="collapse" data-target="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree">
							약관동의 내용3
						</button>
					</h2>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordionExample">
					<div class="card-body">Anim pariatur cliche reprehenderit,
						enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
						moon officia aute, non cupidatat skateboard dolor brunch. Food
						truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
						sunt aliqua put a bird on it squid single-origin coffee nulla
						assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
						labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
						excepteur butcher vice lomo. Leggings occaecat craft beer
						farm-to-table, raw denim aesthetic synth nesciunt you probably
						haven't heard of them accusamus labore sustainable VHS.</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center text-center">
			<div class="col-4">
				<input type="checkbox" name="agree" id="agree"> 위의 약관의 내용에 동의합니다.
				<p id="agreeInput"></p>
			</div>

		</div>		
		<div class="row" style="height: 25px;"></div>
		<div class="row justify-content-left">
			<h1>회원가입 </h1>
		</div>

			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<label>아이디</label> 
						<input type="text" 
							   id="id" 
							   name="id"
							   class="form-control"
							   placeholder="가입할 아이디를 적어주세요.">
					    <p id="idInput"></p> 
					</div>
					<div class="col-6">
						<label>비밀번호</label> 
						<input type="password" 
							   id="pass" 
							   name="pass"
							   class="form-control"
							   placeholder="가입할 비밀번호를 적어주세요."> 
						<p id="passInput"></p>
					</div>						
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<label>이름</label> 
						<input type="text" 
							   id="name" 
							   name="name"
							   class="form-control"
							   placeholder="가입할 이름을 적어주세요."> 
						<p id="nameInput"></p>
					</div>
					
					<div class="col-6">
						<label>나이</label> 
						<input type="text" 
							   id="age" 
							   name="age"
							   class="form-control"
							   placeholder="나이를 적어주세요."> 
						<p id="ageInput"></p>
					</div>					
				</div>
			</div>					
			<div class="form-group">
				<div class="row">
					<div class="col-6">
						<%-- name속성값 address1 부터 ~~ address5 까지 입력되어 있는 주소를 모두 합쳐서 DB에 address열에  INSERT 하자. --%>
						<label>주소</label>
						<p id="addressInput"></p> 
						<input type="text" id="sample4_postcode" name="address1" class="form-control" placeholder="우편번호">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>
						
						<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소" class="form-control">
						<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="address3" class="form-control">
						
						<span id="guide" style="color:#999;display:none"></span>
						
						<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address4" class="form-control">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목"  name="address5" class="form-control">
						
					</div>
					
					<div class="col-6">
						<label>성별</label>
						<p id="genderInput"></p> 
						<hr> 
						남성
					    <input type="radio" 
							   class="gender" 
							   name="gender"
							   value="man"
							   > 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	   
					     여성
					   <input type="radio" 
							   class="gender" 
							   name="gender"
							   value="woman"
							   > 
					</div>					
				</div>
			</div>
			<div class="form-group">
				<div class="row">
					<div class="col-4">
						<label>Email</label> 
						<input type="email" 
							   id="email" 
							   name="email"
							   class="form-control"
							   placeholder="이메일을 적어주세요."> 
						<p id="emailInput"></p>
					</div>
					
					<div class="col-4">
						<label>연락처</label> 
						<input type="tel" 
							   id="tel" 
							   name="tel"
							   class="form-control"
							   placeholder="연락처를 '-'없이 적어주세요."> 
					   	<p id="telInput"></p>	
					</div>
					<div class="col-4">
						<label>핸드폰번호</label> 
						<input type="text" 
							   id="hp" 
							   name="hp"
							   class="form-control"
							   placeholder="핸드폰번호를 '-'없이 적어주세요."> 
						<p id="hpInput"></p>
					</div>												
				</div>
			</div>				
								
			<div class="row">
				<div class="col">
					<a href="#" onclick="check(); return false;" 
					   type="button"
						class="btn btn-primary btn-block">회원가입하기</a>
				</div>
			</div>
			<br /> <br /> <br />
		
	</div>
</form>
	
	
	 회원 로그인 시 예약 정보를 띄울 화면. jsp <br>
	 <br>
	 member_order DB에 들어갈 인적사항
	 <br>
	 hidden 태그로 담당 trainer 정보를 가져와서 trainer_order DB에 저장 시킴,
	 <br>
	버튼 (예약 확정, 예약 수정, 늘봄샵 이동)
	
	 <button>에약 확정</button> / <button>예약 수정</button> / <button>늘 봄샵 이동</button>
	 
	 <br>
	 <br>
</body>
</html>