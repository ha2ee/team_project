<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

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
						<a href="javascript:addChannel()">상담신청하기</a>
						<br>
					</div>
				</div>
				<div>
				<div>
				<h1><img src="<%=request.getContextPath()%>/images/qna2.png">고객센터</h1>
				</div>
				1800-6358<br>
				<h3>보듬교육 고객센터</h3><br>
				업무시간 : 10:00 - 18:00<br>
				점심시간 : 13:00 - 14:00<br>
				토요일, 일요일, 공휴일 휴무입니다.<br>
				<h3>보듬숍 고객센터</h3><br>
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