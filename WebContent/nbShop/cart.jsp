<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="VO.eduOrderVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
	String contextPath = request.getContextPath();
	
	//Session내장객체 메모리 영역에 session값 얻기
	String id_ = (String)session.getAttribute("id");
	
	// list를 컨틀롤러에서 받아와서 변수에 저장
	List<String> list = (List<String>)request.getAttribute("list");

	
%>
<!DOCTYPE html>
<html>
<head>
<style>
/* 전체 CSS 설정 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#cartWrapper {

	border: 1px solid #e8d0d01f;
	
	width: 1200px;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#cartBox {

	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	border-radius: 30px;
	background : #f2dede29;
    box-shadow: 0px 0px 15px 1px #e91e6357;
	
}

/* 수강 신청, 타이틀 CSS 설정 */
#titleBox {

/* 	border: 1px solid floralwhite; */
	
	width: 100%;
	height: 100px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#title {

/* 	border: 1px solid floralwhite; */
	
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
	font-size: 30px;
    background: pink;
    border-radius: 10px;
    color: #e91e63b0;
    font-weight: bold;
}

#filter {

	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
}

#filter>div {
	border: 1px solid #e8d0d01f;
	width: calc(100%/ 5);
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	float: left;
	line-height: 40px;
	font-size: 25px;
    background: #f443361c;
    border-radius: 10px;
    color : #f4433685;
}

#filterEdu {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterPet {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterTr {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterPrice {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

/* 수강 신청 CSS 설정 */
#eduResultBox {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#eduResultBox>div {
	float: left;
}

#edu_res_box {

	border: 1px solid #e8d0d01f;
	
    width: 100%;
    height: 220px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    overflow: overlay;

}



#dataBox {

    position: relative;
    width: 100%;
    height: 40px;
    margin: 0 auto;
    left: -6px;
    top: 0;
    
}

#eduBox {

	border: 1px solid #e8d0d01f;
	
	width: 20%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#eduBox>div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#eduBox>div>a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#eduNumBox {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 79px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -13px;
    left: -28px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
    
}

#eduNumBox > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#eduNumBox > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#eduNameBox {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -13px;
    left: -31px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    
}

#eduNameBox > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#eduNameBox > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
    font-weight : bold;
}

#eduHpBox {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -14px;
    left: -35px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    
}

#eduHpBox > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#eduHpBox > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 10px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#petBox {

border: 1px solid #e8d0d01f;
    width: 20%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
}

#petBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0px;
	right: 0;
	float: left;
	width : 118px;
}

#petBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#pet_img_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 117px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: -39px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;

}

#pet_img_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;

}

#pet_img_box > div > input {

	border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 40%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 10px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color: black;

}

#pet_name_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 119px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -11px;
    left: -42px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;

}

#pet_name_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;

}

#pet_name_box > div > input {

	border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color: #2a9037;
    font-weight : bold;

}


#trBox {

	border: 1px solid #e8d0d01f;

    width: 20%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    
}

#trBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#trBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}


#tr_img_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 79px;
    height: 40px;
    position: relative;
    margin: 0 auto;
	left: -45px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    top: 0px;
    
}

#tr_img_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#tr_img_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 60%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    text-align: center;
    color : black;
}

#tr_name_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -12px;
    left: -49px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    
}

#tr_name_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#tr_name_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 13px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color: #ff8119;
    font-weight: bold;
}

#tr_hp_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -14px;
    left: -53px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    
}

#tr_hp_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#tr_hp_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 10px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#priceBox {

    border: 1px solid #e8d0d01f;
    
    width: 20%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    
}

#priceBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 78px;
}

#priceBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#edu_date_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 79px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -12px;
    left: -56px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#edu_date_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#edu_date_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : blueviolet;
}

#edu_cnt_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -12px;
    left: -60px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#edu_cnt_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#edu_cnt_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#edu_totalprice_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 80px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -12px;
    left: -64px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
    
}

#edu_totalprice_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#edu_totalprice_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 77px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 13px;
	text-decoration: underline;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    text-align: center;
    color : black;
}



#InfoBox {

    border: 1px solid #e8d0d01f;
    
    width : 18%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
	left : 0;
    right: 0;
}

#InfoBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 70px;
}

#InfoBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#edu_info_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 70px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -12px;
    left: -65px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#edu_info_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#edu_info_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
   	transition : 0.4s;
}

#edu_info_box > div > input:hover {

	background : #f5bfce;
	color : floralwhite;
	transition : 0.4s;

}

#cart_del_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -13px;
    left: 8px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#cart_del_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#cart_del_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
}

#cart_del_box > div > input:hover {

	background : red;
	color : floralwhite;
	transition : 0.4s;

}

#cart_mod_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 70px;
    height: 40px;
    position: relative;
    margin: 0 auto;
	top: -51px;
    left: 472px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#cart_mod_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#cart_mod_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
}

#cart_mod_box > div > input:hover{

	background : #f5bfce;
	color : floralwhite;
	transition : 0.4s;

}


/* 늘 봄샵 전체, 타이틀 CSS 설정 */
#nbshopResultBox {

/* 	border: 1px solid floralwhite; */

	width: 100%;
	height: 300px;
	position: relative;
	margin: 0 auto;
	top: 15px;
	left: 0;
	right: 0;
}

#nbshopResultBox>div {
	float: left;
}

#nbtitleBox {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#nbtitle {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
	font-size : 30px;
    background: pink;
    border-radius: 10px;
    color: #e91e63b0;
    font-weight: bold;
}

#nbfilter {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 50px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	line-height: 40px;
}

#nbfilter>div {
	border: 1px solid #e8d0d01f;
	width: calc(100%/ 4);
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	float: left;
	line-height: 40px;
	font-size: 25px;
    background: #f443361c;
    border-radius: 10px;
    color : #f4433685;
}

#filterMem {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterOrder {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#filterCost {
	border: 1px solid #e8d0d01f;
	width: 100%;
	height: 100%;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

/* 늘봄샵 내부 CSS 설정	 */

#orderBox {

	border: 1px solid #e8d0d01f;
	
	width: 30%;
	height: 40px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
}

#orderBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 118px;
}

#orderBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#shop_res_box{

	border: 1px solid #e8d0d01f;
	
    width: 100%;
    height: 160px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    overflow: overlay;

}


#memBox {

	border: 1px solid #e8d0d01f;
	
	width: 25%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
}

#memBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0px;
	right: 0;
	float: left;
	width : 99px;
}

#memBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#order_num_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
	width: 119px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -0;
    left: -32px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#order_num_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#order_num_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#order_img_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 119px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -0;
    left: -36px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#order_img_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#order_img_box > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#order_product_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
	width: 119px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -3px;
    left: -40px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#order_product_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#order_product_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 10px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}


#mem_name_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 100px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -1px;
    left: -44px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#mem_name_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#mem_name_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#mem_hp_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -3px;
    left: -47px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#mem_hp_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#mem_hp_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 11px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#mem_email_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 100px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -3px;
    left: -51px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#mem_email_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#mem_email_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 10px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}


#costBox {

	border: 1px solid #e8d0d01f;
	
    width: 296px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
	right: 0;
}

#costBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
    top: 0;
    left: 0;
	right: 0;
	float: left;
	width: 98px;
	
}

#costBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#order_date_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 99px;
   	height: 35px;
    position: relative;
    margin: 0 auto;
    top: -4px;
    left: -56px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#order_date_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#order_date_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : blueviolet;
    font-weight : bold;
}

#order_cpt_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 97px;
    height: 35px;
    position: relative;
    margin: 0 auto;
	top: -2px;
    left: -60px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#order_cpt_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#order_cpt_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
}

#order_price_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 97px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: -2px;
    left: -64px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    
}

#order_price_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#order_price_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
	width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
	text-decoration: underline;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    text-align: center;
    color : black;
    font-weight : bold;
}



#nbInfoBox {

    border: 1px solid #e8d0d01f;
    
    width: 19%;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 2px;
    right: 0;
}

#nbInfoBox > div {

	border: 1px solid #e8d0d01f;
	
	height: 38px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 1px;
	right: 0;
	float: left;
	width : 73px;
}

#nbInfoBox > div > a {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 100%;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
    font-weight: bold;
}

#order_info_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 70px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -4px;
    left: -61px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#order_info_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#order_info_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
}

#order_info_box > div > input:hover{

	background : #f5bfce;
	color : floralwhite;
	transition : 0.4s;

}

#nbcart_del_box {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -44px;
    left: 539px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#nbcart_del_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
}

#nbcart_del_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 65px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
}

#nbcart_del_box > div > input:hover {

	background : red;
	color : floralwhite;
	transition : 0.4s;

}

#nbcart_mod_box {

    border: 1px solid #e8d0d01f;
    
    display: inline-block;
    width: 70px;
    height: 40px;
    position: relative;
    margin: 0 auto;
    top: -4px;
    left: -61px;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: black;
    font-weight: bold;
    
}

#nbcart_mod_box > div {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 15px;
    text-decoration: none;
    border-radius: 5px;
    background: aliceblue;
    line-height: 35px;
    color: cadetblue;
}

#nbcart_mod_box > div > input {

	border: 1px solid #e8d0d01f;

    display: inline-block;
    width: 70px;
    height: 35px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 12px;
    text-decoration: none;
    border-radius: 5px;
    background: #18e28c78;
    font-weight : bold;
    text-align: center;
    color : black;
}

#nbcart_mod_box > div > input:hover {

	background : #f5bfce;
	color : floralwhite;
	transition : 0.4s;

}

/* 결제관련 CSS 설정 */

#total_price_box{

	border: 1px solid #f2dede29;
	
	width: 1200px;
	height: 170px;
	position: relative;
	margin: 0 auto;
    top: 30px;
	left: 0;
	right: 0;
	border-radius: 13px;
	background : #f2dede29;
    box-shadow: 0px 0px 15px 1px #ccc;

}

#total_price_box > div{

	border : 1px solid #f2dede20;

	position: relative;
	margin: 0 auto;
    top: 0px;
    left: 0;
    right: 0;
    float: left;
    border-radius: 10px;

}

#total_box{

	border : 1px solid #f2dede20;
	
	width : 100%;
	height : 70px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
   	border-radius : 5px;

}

#total_box > div{

	border : 1px solid #f2dede20;
	
    width : calc(100%/3);
    height: 70px;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    float: left;
    border-radius : 5px;

}

#total_box > div > a{

    border: 1px solid #f2dede20;

	width: 100%;
    height: 35px;
    display: inline-block;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    font-size: 25px;
    font-weight: bold;
    line-height: 30px;
    float : left;
    text-decoration : none;
    border-radius : 5px;
    background: pink;
    color: #e91e63b0;
}

#edu_shop_price > input{

    border: 1px solid #f2dede20;

	width: 50%;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    float: left;
    text-align: center;
    height: 35px;
    background : #f8dcdc69;
    border-radius : 5px;
    color: blueviolet;
    font-size: 20px;

}

#edu_shop_total_price > input{

    border: 1px solid #f2dede20;

	width: 100%;
    position: relative;
    margin: 0 auto;
    top: 0;
    left: 0;
    right: 0;
    text-align: center;
    height: 35px;
    background : #f8dcdc69;
    border-radius : 5px;
    font-size: 25px;
    color : orangered;

}

#confirm_box{

	border : 1px solid #f2dede20;

	width : 100%;
	height : 70px;
	position: relative;
	margin: 0 auto;
	top: 0;
	left: 0;
	right: 0;
	
}

#confirm_box > a{

    border: 1px dotted pink; 

	width: 150px;
    position: relative;
    margin: 0 20px;
    top: 20px;
    left: 0;
    right: 0;
    height: 50px;
    font-weight: bold;
    line-height: 35px;
    font-size: 20px;
    border-radius: 15px;
    transition : 0.4s;
    color : lightpink;
}

#confirm_box > a:hover {
	
	border-radius : 20px;
	transition : 0.4s;
	color : hotpink;
	
}

#preview {

	width : 300px;
	height : 300px;
	position : fixed;
	margin : 0 auto;
	left : 390px;
	right : 0;
	top : 430px;
	border-radius: 20px;

}

#preview > img {
	
	width : 300px;
	height : 300px;
	position : relative;
	margin : 0 auto;
	left : 0;
	right : 0;
	top : 0;
	border-radius: 80px;
	box-shadow: 0px 0px 15px 5px pink;

}

</style>
<!--     CSS car.css 추가 -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/cart.css"> --%>
<meta charset="UTF-8">
<title>intro.jsp</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

	
	<br><br><br><br><br>
	<form action=""></form>
	
	<div id="cartWrapper">
		<div id="cartBox">
			<div id="titleBox">
				<div id="title">수강 예약 정보</div>
				<div id="filter">
					<div id="filterEdu">예약 정보</div>
					<div id="filterPet">반려견 정보</div>
					<div id="filterTr">훈련사 정보</div>
					<div id="filterPrice">수강 예약금액</div>
					<div id="filtermod">비고</div>
				</div>
			</div>
			<div id="eduResultBox">
				<div id="eduBox">
					<div id="edu_num" >
						<a id="eduNum">예약번호</a>
					</div>
					<div id="edu_name" >
						<a id="eduName">이름</a>
					</div>	
					<div id="edu_hp" >
						<a id="eduHp" >전화번호</a>
					</div>
				</div>	
				<div id="petBox">
					<div id="pet_img" >
						<a id="petImg">사진</a>
					</div>
					<div id="pet_name">
						<a id="petName">이름</a>
					</div>
				</div>	
				
				<div id="trBox">
					<div id="tr_img">
						<a id="trImg">사진</a>
					</div>
					<div id="tr_name" >
						<a  id="trName">훈련사</a>
					</div>
					<div id="tr_hp" >
						<a  id="trHp">전화번호</a>
					</div>
				</div>
				<div id="priceBox">
					<div id="edu_date">
						<a id="eduDate">예약신청일</a>
					</div>
					<div id="edu_cnt">
						<a id="eduCnt">수강횟수</a>
					</div>
					<div id="edu_totalprice">
						<a id="eduTotalPrice">금액</a>
					</div>
				</div>
				<div id="InfoBox">
					<div id="edu_info">
						<a id="eduInfo">상세보기</a>
					</div>
					<div id="Cart_mod">
						<a id="cartMod">수정</a>
					</div>
					<div id="Cart_del">
						<a id="cartDel">비우기</a>
					</div>
				</div>
			</div>
				
	
<!-- 수강신청정보 -->
	<c:set var="j" value="1"/>
	<div id="edu_res_box">
	<c:forEach var="vo"  items="${vector}" >
	<c:if test="${vector.isEmpty()}">
		<h1>예약된 정보가 없습니다!!</h1>	
	</c:if>
		<div id="dataBox">
				<!--예약번호 -->
				<div id="eduNumBox">
					<div id="edu_num${j}">
						<input type="text" id="eduNum${j}" value="${vo.edu_num}" readonly="readonly" />
					</div>
				</div>
				
				<!--이름 -->
				<div id="eduNameBox">
					<div id="edu_name${j}">
						<input type="text" id="eduName${j}" value="${vo.edu_name}" readonly="readonly" />
					</div>
				</div>
				
				<!--전화번호 -->
				<div id="eduHpBox">
					<div id="edu_hp${j}">
						<input type="text" id="eduHp${j}" value="${vo.edu_hp}" readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 사진 -->
				<div id="pet_img_box">	
					<div id="pet_img${j}">
						<input type="image" class="gallery"  id="petImg${j}" src="<%=request.getContextPath()%>/nbShop/img/${vo.pet_img}"  readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 이름 -->
				<div id="pet_name_box">
					<div id="pet_name${j}">
						<input type="text" id="petName${j}" value="${vo.pet_name}" readonly="readonly"  />
					</div>
				</div>
				
				<!--훈련사 사진 -->
				<div id="tr_img_box">
					<div id="tr_img${j}">
						<input type="image" class="gallery" id="trImg${j}" src="<%=request.getContextPath()%>/nbShop/img/${vo.tr_img}" readonly="readonly" />
					</div>
				</div>
				
				<!--훈련사 이름 -->
				<div id="tr_name_box">
					<div id="tr_name${j}">
						<input type="text" id="trName${j}" value="${vo.tr_name }" readonly="readonly" />
					</div>
				</div>
				
				<!--반려견 이름 -->
				<div id="tr_hp_box">
					<div id="tr_hp${j}">
						<input type="text" id="trHp${j}" value="${vo.tr_hp}" readonly="readonly"  />
					</div>
				</div>
				
				<!--예약 일정 -->
				<div id="edu_date_box">
					<div id="edu_date${j}">
						<input type="text" id="eduDate${j}" value="${vo.tr_reg_date}" readonly="readonly"  />
					</div>
				</div>
				
				<!--예약 횟수 -->
				<div id="edu_cnt_box">
					<div id="edu_cnt${j}">
						<input type="text" id="eduCnt${j}" value="${vo.edu_cnt}" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 예약 금액 -->
				<div id="edu_totalprice_box">	
					<div id="edu_totalprice${j}">
						<input type="text" id="eduTotalprice${j}" value="${vo.edu_totalprice}" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 상세 보기 -->
				<div id="edu_info_box">
					<div id="edu_info${j}">
						<input class="btn" type="button" id="eduInfo${j}" value="상세보기"  />
					</div>
				</div>
				
				<!-- 비우기 -->
				<div id="cart_del_box">	
					<div id="cart_del${j}">
						<input class="btn" type="button" id="cartDel${j}" value="비우기" />
					</div>
				</div>
				<!-- 수정 -->
				<div id="cart_mod_box">	
					<div id="cart_mod${j}">
						<input class="btn" type="button" id="cartMod${j}" value="수정" />
					</div>
				</div>
			</div>	
		<c:set var="j" value="${j+1}" /> 
	</c:forEach>
	</div>
		
				
				

			<div id="nbshopResultBox">
				<div id="nbtitleBox">
					<div id="nbtitle">늘봄 샵 정보</div>
					<div id="nbfilter">
						<div id="filterOrder" style="width : 30%;">물품 정보</div>
						<div id="filterMem">주문자 정보</div>
						<div id="filterCost">금액 정보</div>
						<div id="filterInfo" style="width : 20%;">비고</div>
					</div>
				</div>

				<div id="orderBox" >
					<div id="order_num" >
						<a id="orderNum">주문번호</a>
					</div>
					<div id="order_img" >
						<a id="orderImg">물품사진</a>
					</div>
					<div id="order_product" >
						<a id="orderProduct">물품명</a>
					</div>
				</div>
				
				<div id="memBox" >
					<div id="mem_name" >
						<a id="memName">이름</a>
					</div>
					<div id="mem_hp" >
						<a id="memHp">전화번호</a>
					</div>
					<div id="mem_email" >
						<a id="memEmail">이메일</a>
					</div>
				</div>
				
				<div id="costBox" >
					<div id="order_date">
						<a id="orderDate">주문일</a>
					</div>
					<div id="order_cpt">
						<a id="orderCpt">수량</a>
					</div>
					<div id="order_price">
						<a id="orderPrice">금액</a>
					</div>
				</div>
				
				<div id="nbInfoBox">
					<div id="order_Info">
						<a id="orderInfo">상세보기</a>
					</div>
					
					<div id="nbCart_mod">
						<a id="nbcartMod">수정</a>
					</div>
					
					<div id="nbCart_del">
						<a id="nbcartDel">비우기</a>
					</div>
				</div>
				
<!-- 	늘봄 샵 관련 vector 구문 -->
<%-- 	<c:set var="h" value="1"/> --%>
		<div id="shop_res_box">
<%-- 	<c:forEach var="vo"  items="${vector}" >			 --%>
				
				<!-- 주문 번호 -->
				<div id="order_num_box">
					<div id="order_num1">
						<input type="text" id="orderNum1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 물품 사진 -->
				<div id="order_img_box">
					<div id="order_img1">
						<input type="image" class="gallery" id="orderImg1"  src="" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 물품 품명 -->
				<div id ="order_product_box">
					<div id="order_product1">
						<input type="text" id="orderProduct1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 명 -->
				<div id="mem_name_box">	
					<div id="mem_name1">
						<input type="text" id="memName1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 번호 -->
				<div id="mem_hp_box">
					<div id="mem_hp1">
						<input type="text" id="memHp1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매자 이메일-->
				<div id="mem_email_box">
					<div id="mem_email1">
						<input type="text" id="memEmail1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매 날짜 -->
				<div id="order_date_box">
					<div id="order_date1">
						<input type="text" id="orderDate1" value="test" readonly="readonly"  />
					</div>
				</div>
				
				<!-- 구매 갯수 -->
				<div id="order_cpt_box">
					<div id="order_cpt1">
						<input type="text" id="orderCpt1" value="test" readonly="readonly" />
					</div>
				</div>
				
				<!-- 구매 금액 -->
				<div id="order_price_box">
					<div id="order_price1">
						<input type="text" id="orderPrice1" value="test" readonly="readonly" />
					</div>
				</div>
		
				<!-- 상세 보기 -->
				<div id="order_info_box">
					<div id="order_info1">
						<input class="btn" type="button" id="orderInfo1" value="상세보기" />
					</div>
				</div>
				
				<!-- 수정 -->
				<div id="nbcart_mod_box">
					<div id="nbcart_mod1">
						<input class="btn" type="button" id="nbcartMod1" value="수정" />
					</div>
				</div>
				
				<!-- 비우기 -->
				<div id="nbcart_del_box">
					<div id="nbcart_del1">
						<input class="btn" type="button" id="nbcartDel1" value="비우기" />
					</div>
				</div>
<%-- 		<c:set var="h" value="${h+1}" />  --%>
		</div>
<%-- 	</c:forEach> --%>
				
			</div>
		</div>
	</div>
	
	<div id="total_price_box">
	
		<div id="total_box">
			<div>
				<a id="total_price" style="height:100%; font-size: 30px; line-height: 65px;">결제 할 금액</a>
			</div>
			<div id ="edu_shop_price">
				<a style="width: 50% " >수강 금액</a>
				<a style="width: 50% ">샵 금액</a>
				<input id="eduPrice" type="text" value="수강 금액" readonly="readonly" />
				<input type="text" value="샵 금액" readonly="readonly"  />
			</div>
			<div id="edu_shop_total_price">
				<a>총 금액</a>
				<input type="text" value="총금액" readonly="readonly"  />
			</div>
		</div>

		<div id="confirm_box">
			<a type="button" class="btn" >모두 비우기</a>
			<a type="button"  class="btn" >결제 하기</a>
		</div>

	</div>

	<br><br><br><br><br>


	<!-- 	장바구니  들어갈 항목 -->
	장바 구니 화면. jsp
	<br> 설명 : 상단에는 신청한 수강정보를 확인 할 수있도록 하고
	<br>
	<br> 하단부에는 샵에서 장바구니에 담은 목록을 확인 시킨다
	<br> 그 밑에는 최종 합산 금액 및 결제하기, ,장바구니비우기(?), 결제취소하기(고민중일 경우) 버튼을 만든다.
	<br>
	<br>
	</form>
<script>

$(document).ready(function(){
	
	var i= 0;
	var x = 0;
	
	// 수강 가격 계산 하기 (작성중)
	for(i=1; i <= ${vector.size()}; i++){
		
		var price = document.getElementById("eduTotalprice"+i).value;

		var replaceprice = parseInt(price.replace("," , ""));

		x += replaceprice++;
		
	}
	// 정규표현식으로 3자리숫자당 콤마로 구분한다.
	var edu_price = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	// 수강 신청 가격을 해당 구문에 넣기
	$("#eduPrice").attr("value", edu_price);
	
	// 샵 금액 (작성중)
	
	var shop_price = 0;
	
	// 수강금액 + 샵금액 = 총금액 계산 하기
	$("#edu_shop_total_price > input").attr("value", (edu_price+shop_price));
	
	
	
})

// 이미지 미리보기 
//마우스 오버시 preview 생성
$(document).on("mouseover",".gallery",function(e){
    var input_data = $(this).data("input");
    var add_caption = (input_data != undefined) ? "<br/>" + input_data : "" ;
    $("#middle").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' />"+ add_caption +"</p>");
    $("#preview")
    .css("z-index", "5")
    .fadeIn("fast");
});

//마우스 이동시 preview 이동
$(document).on("mousemove",".gallery",function(e){
    $("#preview")

});

// 마우스 아웃시 preview 제거
$(document).on("mouseout",".gallery",function(){
    $("#preview").remove();
});
</script>
</body>
</html>