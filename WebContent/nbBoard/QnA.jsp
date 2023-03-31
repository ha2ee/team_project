<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<style>
	
	    #mega_wrapper > ul {
    border: 1px solid white;
    text-align: center;
    color: black;
    font-size: 16px;
    float: left;
	}
	
	.list_lnb_01 {
    margin-left: 60px;
    width: 220px;
	}
	
	.list_lnb_02 {
    margin-left: 40px;
    width: 170px;
	}
    
    .list_lnb_04 {
    margin-left: 55px;
    width: 170px;
	}

		/*  로그인,회원가입,마이페이지,장바구니 버튼 백그라운드 컬러변경 시 사용 */
	
	
	#login_box > li > a:hover {
	
	  background: #fff5f3;
	  text-decoration: none;
	  border-radius: 20px;
	  transition : 0.3s;
	}

	
	#login_box > li > a {
	
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 15px;
    text-transform: uppercase;
    font-weight: 700;
    margin: 0 auto;
    letter-spacing: .75px;
    border: transparent;
    position: relative;
    display: inline-block;
    background: #fff;
    color: black;
    transition: 0.3s;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    line-height: 40px;
    
	}
	
	#login_box > li {
	
/*     border: 1px solid blue; */
    
    float: left;
    position: relative;
    text-align: center;
    margin: 0 auto;
    height: 50px;
    width: 105px;
    left: 0;
    padding: 0;
    
	}
	
	#login_box {
/*     border: 1px solid rebeccapurple; */
    margin: 0 auto 0 auto;
    position: relative;
    width: 250px;
    height: 100px;
    top: -1px;
    left: 475px;
    right: 0;
    text-align: center;
}
	
#link {

	text-decoration: none;
	color : navy;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Layout.jsp</title>

</head>

<body>
<div style="margin: 0 auto; width:1200px;">
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td width="70%" valign="top">
			<jsp:include page="left.jsp">
				<jsp:param value="left" name="left"/>
			</jsp:include>
			</td>
					
			<td width="30%" valign="top">
				<!--  내용부분 :시작 -->

				<center>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				
				<div>
					<h1>
					<img src="<%=request.getContextPath()%>/images/qna1.png">
					상담신청
					</h1>
					<div>아직 어떤 프로그램을 들어야 할지 모르시나요?</div>
					<div>
					<br>
						<a style="border-radius: 20px; font-size: 20px;height: 33px; border:0; background:#FFB2D9;" href="javascript:addChannel()" class="btn btn-primary btn-sm">1:1 상담하기<br></a>
						<br><br><br>
					</div>
				</div>
				<div>
				<div>
				<h1><img src="<%=request.getContextPath()%>/images/qna2.png">고객센터</h1>
				</div>
				1800-6358<br>
				<h3>늘봄교육 고객센터</h3><br>
				업무시간 : 10:00 - 18:00<br>
				점심시간 : 13:00 - 14:00<br>
				토요일, 일요일, 공휴일 휴무입니다.<br>
				<h3>늘봄숍 고객센터</h3><br>
				업무시간 : 10:00 - 18:00<br>
				점심시간 : 13:00 - 14:00<br>
				토요일, 일요일, 공휴일 휴무입니다.
					</div>
					
				</center> <!--  내용부분 :끝 -->
			</td>
		</tr>
	</table>
	<script type="text/javascript">
	function addChannel() {
		  Kakao.Channel.addChannel({
		    channelPublicId: '_Xpekxj',
		  });
		}
	
	</script>
	</div>
</body>
</html>