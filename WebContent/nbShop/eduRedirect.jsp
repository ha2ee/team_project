
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Session내장객체 메모리 영역에 session값 얻기
	String id_ = (String)session.getAttribute("id");
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
</style>
<meta charset="UTF-8">
<title>eduRedirect.jsp</title>
</head>
<style>

#loading {
    position: relative;
    top: 0;
    left: 0;
    height: 500px;
    width: 100%;
    max-width : 1200px;
    margin: 0 auto;
    border-radius: 20px;
    box-shadow: 0 0 10px 10px pink;
}

#loading-image {
    margin: 0 auto;
    height: 500px;
    width: 500px;
    position: relative;
    z-index: 100;
    top: 0;
    left: 0;
}


#text {
    position: relative;
    top: 50px;
    left: 0;
    font-size: 50px;
    text-align: center;
    margin: 0 auto;
    width: 100%;
    max-width : 1200px;
    display: inline-block;
    border: 5px solid deeppink;
    border-radius: 20px;
    color: orangered;
    background: lightpink;
    box-shadow: 0 0 10px 3px palevioletred;
}

</style>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
%>

    <div id="loading">
        <img id="loading-image" src="http://localhost:8090/TeamProject/nbShop/img/Pacman.gif" alt="Loading..." />
    </div>
    <div>
    	<a id="text">장바구니로 이동중입니다!!</a>
    </div>
<script>
window.onbeforeunload = function () { 
	
	
	$('#loading').show(); 
	
	
	} 
	
//현재 페이지에서 다른 페이지로 넘어갈 때 표시해주는 기능
$(window).load(function () {          //페이지가 로드 되면 로딩 화면을 없애주는 것

	// 5초 뒤에 실행 될 메소드
	setTimeout(function() {
	
	
	    $('#loading').hide();
	// eduRedirect.jsp를 호출했을때 포워딩해서 갈 주소
	location.href = "<%=request.getContextPath()%>/nb/cart.do?id=<%=id_%>&center=nbShop/cart.jsp";
	}, 2000);

});
</script>
</body>
</html>