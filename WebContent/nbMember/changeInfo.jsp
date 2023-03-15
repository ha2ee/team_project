<%@page import="VO.PetVo"%>
<%@page import="VO.TrainerVo"%>
<%@page import="VO.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contextPath = request.getContextPath();
%>
<%
MemberVo mem_vo = (MemberVo)request.getAttribute("mem_vo");

String mem_nick = mem_vo.getMem_nick();
String mem_name = mem_vo.getMem_name();
String mem_hp = mem_vo.getMem_hp();
String mem_birth = mem_vo.getMem_birth();
String mem_email = mem_vo.getMem_email();
String mem_address2 = mem_vo.getMem_address2();
String mem_address4 = mem_vo.getMem_address4();
String mem_address5 = mem_vo.getMem_address5();
String mem_img = mem_vo.getMem_img();
String mem_address = mem_address2 + " " +mem_address4 + " " + mem_address5;

TrainerVo tr_vo = (TrainerVo)request.getAttribute("tr_vo");

String tr_name = tr_vo.getTr_name();
String tr_hp = tr_vo.getTr_hp();
String tr_birth = tr_vo.getTr_birth();
String tr_email = tr_vo.getTr_email();
String tr_address2 = tr_vo.getTr_address2();
String tr_address4 = tr_vo.getTr_address4();
String tr_address5 = tr_vo.getTr_address5();
String tr_img = tr_vo.getTr_img();
String tr_address = tr_address2 + tr_address4 + tr_address5;
String id = (String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.pet_total{
	    max-width: 1240px;
	    margin: 0 auto;
	    text-align: center;
	    padding: 0px 20px 0px;
	    box-sizing: border-box;
	    position: relative;
	}
	
		.leftBlock {
	    width: 220px;
	    margin-right: 30px;
 	    position: absolute; 
	    box-sizing: border-box;
	    border: 1px solid #d7d7d7;
	    border-top: 3px solid #fff5f3;
	    margin-top: 35px;
	}	
		
		.userInfo{
	    padding: 30px;
			
	}
	
	.userImg{
		border-radius: 70%
	}
	
	.userName,.userId{
		font-size: 15px;
   		color: #555;
   		margin-bottom: 6px;
	}
	
	.user{
		display: inline-block;
   		width: 100%;
 			padding: 0 20px 30px;
	}
	
	.myInfo,.petInfo{
		font-size: 13px;
	    color: #555;
	    float: left;
	    width: 48%;
	    margin-right: 2%;
	    height: 30px;
	    line-height: 28px;
	    background: #eaeaea;
	    border-radius: 50px;
	}
		
	.rightBlock{
	    padding: 3px 15px 80px 250px;
	    padding-left: 300px;
	    width: 100%;
	    box-sizing: border-box;
	    text-align: left;
	    min-height: 850px;
		
	} 

	.table{
		width: 100%;
	    border-top: 1px solid #d5d5d5;
	    border-bottom: 1px solid #e9e9e9;
	
	}
	
	.pet1{
		font-size: 25px;
	}

	.img_dt{
		padding-top: 93px;
		position: relative;
	    float: left;
	    width: 204px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    color: #555;
	    font-family: 'NGB';
	    font-size: 14px;
	    line-height: 100%;
		border-top: 1px solid #e9e9e9;
	}

	.img_dd{
		position: relative;
	    float: left;
	    width: 513px;
	    padding: 25px 0 25px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	.p_img{
		margin-left: 4px;
  		margin-top: 4px;
		}
	
	.upload{
	    display: inline-block;
	    width: 100%;
		}	
	.imgBtn{
		height: 25px;
		margin-left: 170px;	
		margin-top: -24px;		
	 	color: #fff !important;
	}
	.email_dt,.nick_dt,.hp_dt,
	.address_dt,.pass_dt
	{
		padding-top: 31px;
		border-top: 1px solid #e9e9e9;
	    display: table-cell;
	    position: relative;
	    float: left;
	    width: 204px;
	    text-align: center;
	    vertical-align: middle;
	    font-weight: bold;
	    color: #555;
	    font-family: 'NGB';
	    font-size: 14px;
	    line-height: 100%;
		
	}	
	
	.email_dd,.nick_dd,.hp_dd,
	.address_dd,.pass_dd
	{
	    position: relative;
	    float: left;
	    width: 513px;
	    padding: 20px 0 20px 28px;
	    border-top: 1px solid #e9e9e9;
	}
	
	
	.address1{
		
	
	}
	.address2,.address3{
	
	
	}
	
	.email,.nickName,.hp,
	.address
	{
	    width: 49%;
    	height: 6%;
    	font-size: 16px;
    	padding: 11px;
	}
	
	
	.roundBtn {
		border-radius: 50px;
   		display: inline-block;
	    text-align: center;
	    transition: all 0.3s ease 0s;
	    height: 43px;
	    line-height: 41px;
	    cursor: pointer;
		width: 172px;
	}

	.whiteBtn {
		background: transparent;
   		border: 1px solid #231815;
		box-sizing: border-box;
		color: black;
		
	}
	
	.blueBtn {
		background: #061f5c;
   		box-sizing: border-box;
		color: #fff;
		border: 1px solid #231815;
		
	}
	
	.saveBtn{
		margin-left: 14%;	
		}
	
	.petBtn{
		margin-bottom: 25px;
		margin-left: 28px
	
	}
	
	.Info{
   		border: 0px solid #231815;
		color: #555;
		border-radius: 8px;
   		display: inline-block;
	    text-align: center;
	    transition: all 0.3s ease 0s;
	    height: 43px;
	    line-height: 43px;
	    cursor: pointer;
		width: 190px;
		margin-right: 25px;
		background-color: white;
	}
	
	a:hover {
 	 	text-decoration: none;
	}
	
	.title{
	    margin-bottom: 15px;
    	font-weight: bold;
		font-size: 21px;
	}
	
	.address1{
    	width: 17%;
   		padding-left: 6px;
	}
	
	.address2, .address3 {
    width: 49%;
    padding-left: 6px;
	
	}
	
	.passChange{
		width: 21%;
    	height: 6%;
	}
	
	
	
</style>
  
</head>
<body>
	<form action="<%=contextPath%>/member/petChangePro.me">	
		<div class="pet_total">
			<hr>
			
			<div class="leftBlock">
				<div class= "userInfo">
					<div class="profile">
						<img src="<%=contextPath%>/images/profile.png" class="userImg">
					</div>
				</div>
				<div class="user" >
					<div class="userName"><%=mem_name%>님</div>
					<div class="userId">(<%=id%>)</div>
					<div class="infoBtn">
						<a href="<%=contextPath%>/member/info.me" class="myInfo">내 정보</a>
						<a href="<%=contextPath%>/member/petInfo.me" class="petInfo">반려견 정보</a>
					</div>
				</div>
			
			</div>
			<div class="rightBlock">
				<div class="title">
					<p>정보 수정</p>
				</div>
				<dl class="teble">
	


				<%
				if(mem_nick != ""){
				%>
					<dt class="nick_dt">
						<span>닉네임</span>
					</dt>
					<dd class="nick_dd">
						<div class="nick_div">
							<input type="text" name="nickName" class="nickName" value="<%=mem_nick%>">
						</div>
					</dd>				
					
				<%
				} else{
				%>
				
				<%
				}
				%>
					<dt class="email_dt">
						<span>이메일</span>
					</dt>
					<dd class="email_dd">
						<div class="nick_div">
							<input type="text" name="email" class="email" value="<%=mem_email + tr_email%>">
						</div>
					</dd>
					
					
					<dt class="hp_dt">
						<span>전화번호</span>
					</dt>
					<dd class="hp_dd">
						<div class="hp_div">
							<input type="text" name="hp" class="hp" value="<%=mem_hp + tr_hp%>">
						</div>
					</dd>
					
					
					<dt class="address_dt">
						<span>주소</span>
					</dt>
					<dd class="address_dd">
						<div class="hp_div">
							<input type="text" id="sample4_postcode" name="address1" class="address1"  placeholder="우편번호" >	
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="background-color:#BDBDBD" id="sample4_find"><br><br>				<!-- class="form-control" --> 
							<input type="text" id="sample4_roadAddress" name="address2" placeholder="도로명주소" class="address2" readonly>	<br><br>	
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" name="address3"  readonly>
							<input type="text" placeholder="상세주소" name="address3" class="address3">
							<input type="hidden" id="sample4_extraAddress" placeholder="참고항목"  name="address5"readonly>
						</div>
						
					</dd>
				
			
					<dt class="pass_dt">
						<span>비밀번호</span>
					</dt>
					<dd class="pass_dd" style="margin-bottom: 4%;">
						<div class="pass_div">
							<input onclick="passPop();"  type="button" name="passChange" class="passChange" value="변경하기"/>
						</div>
					</dd>
					
					
					
					
					<dt class="btn_dt">
					</dt>
					<dd class="btn_dd">
						<div class="saveBtn">
							<a id="backBtn" href="javascript:history.go(-1);" class="roundBtn whiteBtn">취소하기</a>				
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a id="changeBtn" 
							   href="#" 
							   class="roundBtn blueBtn"
							   onclick="petInfoChange(); return false;"
							   >저장</a>
						</div>
					</dd>				
				</dl>
			</div>
		</div>
	</form>	
	
		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		
		$(function() {
			
			if($("#hidden_gen").val() == "남아" ){

				$("#p_gender").val("남아").prop("selected", true);
					
			}else if ($("#hidden_gen").val() == "여아"){
				
				$("#p_gender").val("여아").prop("selected", true);
				
			}

			if($("#hidden_op").val() == "했음" ){
	
				$("#p_op").val("했음").prop("selected", true);
					
			}else if($("#hidden_op").val() == "안했음"){
				
				$("#p_op").val("안했음").prop("selected", true);
			
				
			}
		});
	
	
		  $("#backBtn").mouseover(function(){

		    $("#backBtn").css("background-color", "#061f5c");
		    $("#backBtn").css("color", "white");
			
		  });

		  $("#backBtn").mouseout(function(){

		    $("#backBtn").css("background-color", "transparent");
		    $("#backBtn").css("color", "#23527c");

		  });
		
		  
		  $("#changeBtn").mouseover(function(){

		    $("#changeBtn").css("background-color", "white");
		    $("#changeBtn").css("color", "#33333");
		  });

		  $("#changeBtn").mouseout(function(){

		    $("#changeBtn").css("background-color", "#061f5c");
		    $("#changeBtn").css("color", "#white");

		  });
	
		  
		    function sample4_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample4_postcode').value = data.zonecode;
		                document.getElementById("sample4_roadAddress").value = roadAddr;
		                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("sample4_extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }

		  
	        function passPop(){
	            var url = "http://localhost:8090/TeamProject/nbMember/passPop.jsp";
	            var name = "비밀번호 변경";
	            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
	            window.open(url, name, option);
	        }
	
	</script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/petJoin.js"></script>
</body>
</html>