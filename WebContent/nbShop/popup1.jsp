<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>펫 정보 입력하기</title>
    
<!--     CSS popup1.css 추가 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/popup1.css">
</head>
<body class="dimmed">
<form action ="#" >
    <div class="pop1">
        <div class="pop1title">펫 정보 입력창</div>
        <div class="pop1content">
			<div id = "pet_box">
				<div id = "mem_title">
					<h3 id="h3title">- 반려견 예약 정보 -</h3>
				</div>
				<div id = "pet_check">
					<a id ="petcheck1" class = btn href="">반려견 정보 추가하기</a>
					<a id ="petcheck2" class = btn href="">반려견 정보 가져오기</a>
				</div>
				<div id = "pet_name_box">
					<a id="pet_img_name" type= "text">반려견 사진</a>
				</div>
				<div id= "pet_img_box" >
						<img id="pet_img"  src="<%=request.getContextPath()%>/images/example.png" />
				</div>
				<div id = "pet_info_box">
					<a type= "text">반려견 이름<input id = "pet_name" name = "pet_name" type="text" value="" placeholder="반려견이름"  />
					</a>
					<a type= "text">반려견 견종<input id = "pet_type" name = "pet_type" type="text" value="" placeholder="반려견종"  />
					</a>
					<a type= "text">반려견 나이<input id = "pet_age" name = "pet_age" type="text"  value="" placeholder="반려견나이"  />
					</a>
					<a type= "text">반려견 몸무게<input id = "pet_weight" name = "pet_weight" type="text" value="" placeholder="반려견몸무게"  />
					</a>
					<a type= "text">반려견 성별</a>
					<div id="radio">					
						<input id="pet_gender1" type="radio" name="pet_gender" value="남" />남
					</div>
					<div id="radio" >
						<input id="pet_gender2" type="radio" name="pet_gender" value="여" />여
					</div>
				</div>
				<div id ="pet_op_box">
					<a type= "text">중성화 여부</a>
					<div id="radio2">					
						<input id="pet_op1" type="radio" name="pet_op" value="예" />예
					</div>
					<div id="radio2" >
						<input id="pet_op2" type="radio" name="pet_op" value="아니오" />아니오
					</div>
					<div id="radio2" >	
						<input id="pet_op3" type="radio" name="pet_op" value="모름"/>모름
					</div>
				</div>
			</div>
        </div>
        <div class="pop1cmd">
            <input type="submit" name="btnclose" class="popbtn" value="제출하기">
        </div>
    </div>
</form>
</body>
</html>