package CONTROLLER;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import VO.MemberVo;
import VO.PetVo;
import VO.TrainerVo;
import VO.eduOrderVo;

@WebServlet("/nbOrder/*")
public class nbOrderController extends HttpServlet{


//OrderDAO객체를 저장할 참조변수 선언
OrderDAO orderdao;

//트레이너 정보를 조회할 TrainerVo를 호출
TrainerVo trainervo;

// 회원 , 펫 정보를 조회할 각 vo를 호출
MemberVo membervo;
PetVo petvo;

@Override
public void init() throws ServletException {
orderdao = new OrderDAO();

}

@Override
protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
doHandle(request,response);

}

@Override
protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {
doHandle(request,response);

}

private void doHandle(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

//한글처리
request.setCharacterEncoding("utf-8");
//웹브라우저로 응답할 데이터 종류 설정
response.setContentType("text/html;charset=utf-8");
//웹브라우저와 연결된 출력 스트림 통로 만들기
PrintWriter out = response.getWriter();
//서블릿으로 요청한 주소를 request에서 얻기
String action = request.getPathInfo();//2단계 요청 주소
System.out.println("요청한 주소 : "+action);


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// nbOrderController INFO //////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// #1) /petUpdate.od <- 수강신청 페이지 반려견 정보 조회
// #2 /goCart.od <- 수강신청 페이지 -> 예약하기 버튼을 눌렀을 때
// #3 /eduDel.od <- 장바구니 -> 예약삭제 버튼을 눌렀을 때
// #3-1 /eduAlldel.od <- 장바구니 -> 모두 비우기 버튼을 눌렀을 때
// #4) /eduOrder.od <- 수강신청 페이지 -> 장바구니 최종 결제 요청
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
String nextPage = null;
//요청한 중앙화면 뷰 주소를 저장할 변수
String center = null;

switch (action) {


// #1) 수강신청 페이지에서 반려견 정보 가져오기 버튼을 눌렀을 때,
case "/petUpdate.od":



System.out.println("nbOrderController -> petUpdate.od 호출 !");

// 1) 조회할 아이디 값을 가져온다.
HttpSession session = request.getSession();
String login_id = (String)session.getAttribute("id");

System.out.println("login_id :" + login_id);

// 2) 조회할 아이디를 저장 시킨다.
request.setAttribute("id", login_id);

// 2-1) petVo를 통해서 DB에 값이 있으면 가져오고 없으면 다른값을 반환시킨다.
Vector<PetVo> vector2 = orderdao.checkPet(login_id);

//리턴받은 petvo를 setAttribute에 담아서 전달한다.
request.setAttribute("vector", vector2);

System.out.println(vector2);

nextPage = "/nbShop/popup1.jsp";


break;


// #2 /goCart.od <- 수강신청 페이지 -> 예약하기 버튼을 눌렀을 때, (작성 중)
case "/goCart.od":


System.out.println("nbOrderController -> goCart.od 호출 !");

// 1) 받아온 값들을 변수에 저장한다.
String edu_id = request.getParameter("edu_id");
String edu_name = request.getParameter("edu_name");
String edu_hp = request.getParameter("edu_hp");
String edu_email = request.getParameter("edu_email");
String edu_address1 = request.getParameter("edu_address1");
String edu_address2 = request.getParameter("edu_address2");
String edu_address3 = request.getParameter("edu_address3");
String edu_address4 = request.getParameter("edu_address4");
String edu_address5 = request.getParameter("edu_address5");

String pet_img = request.getParameter("pet_edu_img");
String pet_name = request.getParameter("pet_name");
String pet_type = request.getParameter("pet_type");
int pet_age = Integer.parseInt(request.getParameter("pet_age"));
int pet_weight = Integer.parseInt(request.getParameter("pet_weight"));
String pet_gender = request.getParameter("pet_gender");
String pet_op = request.getParameter("pet_op");
String tr_img = request.getParameter("tr_img");
String tr_name = request.getParameter("tr_name");
String tr_hp = request.getParameter("tr_hp");

String date1 = request.getParameter("date1");
String date2 = request.getParameter("date2");
String date3 = request.getParameter("date3");
String date4 = request.getParameter("date4");
String date5 = request.getParameter("date5");
String date6 = request.getParameter("date6");
String date7 = request.getParameter("date7");
int edu_cnt = Integer.parseInt(request.getParameter("edu_cnt"));
String edu_totalprice = request.getParameter("edu_totalprice");

// 2) 변수를 eduordervo로 저장시킨다.
eduOrderVo eduordervo = new eduOrderVo();

// 3) 예약정보를 list로 저장시킨다.
List<String> list = new ArrayList();

// *1) 회원 정보
eduordervo.setEdu_id(edu_id);
eduordervo.setEdu_name(edu_name);
eduordervo.setEdu_hp(edu_hp);
eduordervo.setEdu_email(edu_email);
eduordervo.setEdu_address1(edu_address1);
eduordervo.setEdu_address2(edu_address2);
eduordervo.setEdu_address3(edu_address3);
eduordervo.setEdu_address4(edu_address4);
eduordervo.setEdu_address5(edu_address5);
// *2) 펫 정보
eduordervo.setPet_img(pet_img);
eduordervo.setPet_name(pet_name);
eduordervo.setPet_type(pet_type);
eduordervo.setPet_age(pet_age);
eduordervo.setPet_weight(pet_weight);
eduordervo.setPet_gender(pet_gender);
eduordervo.setPet_op(pet_op);
// *3) 훈련사 정보
eduordervo.setTr_img(tr_img);
eduordervo.setTr_name(tr_name);
eduordervo.setTr_hp(tr_hp);

// *4) 예약 정보
list.add(date1);
list.add(date2);
list.add(date3);
list.add(date4);
list.add(date5);
list.add(date6);
list.add(date7);
eduordervo.setEdu_cnt(edu_cnt);
eduordervo.setEdu_totalprice(edu_totalprice);


// 4) orderdao를 통해서 data를 저장시킨다.
orderdao.insertCartedu(eduordervo, list);

// 5) orderdao를 통해서 인서트 시킨 값들을 다시 불러온다.
Vector<eduOrderVo> vector = orderdao.checkCartedu(edu_id);

// 6) cart.jsp 페이지에서 출력할 eduordervo와 list를 내보낸다.
request.setAttribute("vector", vector);
request.setAttribute("list", list);
request.setAttribute("id", edu_id);

//request에 "center" 값을 이용해서 cart.jsp로 이동 시킴
request.setAttribute("center", "nbShop/cart.jsp");

nextPage = "/nbMain.jsp";

break;

// #3 /eduDel.od <- 장바구니 -> 예약삭제 버튼을 눌렀을 때
case "/eduDel.od":

System.out.println("nbOrderController -> eduDel.od 호출 !");

// 로그인 된 아이디와 예약번호를 가져온다
String loginId = request.getParameter("id");
int eduNum = Integer.parseInt(request.getParameter("edu_num"));

// 오더다오를 통해 deleteEdu를 실행한다.
orderdao.deleteEdu(loginId, eduNum);

// orderdao를 통해서 다시 조회한다.
vector = orderdao.checkCartedu(loginId);

// 6) cart.jsp 페이지에서 출력할 eduordervo와 list를 내보낸다.
request.setAttribute("vector", vector);

//request에 "center" 값을 이용해서 cart.jsp로 이동 시킴
request.setAttribute("center", "nbShop/cart.jsp");

nextPage = "/nbMain.jsp";


break;


// #3-1 /eduAlldel.od <- 장바구니 -> 모두 비우기 버튼을 눌렀을 때
case "/eduAlldel.od":

System.out.println("nbOrderController -> eduAlldel.od 호출 !");

// 로그인 된 아이디와 예약번호를 가져온다
loginId = request.getParameter("id");

// 오더다오를 통해 deleteAlledu를 실행한다.
// 늘봄샵 업데이트 되면 항목 추가하기!
orderdao.deleteAlledu(loginId);

// orderdao를 통해서 다시 조회한다.
vector = orderdao.checkCartedu(loginId);

// 6) cart.jsp 페이지에서 출력할 eduordervo와 list를 내보낸다.
request.setAttribute("vector", vector);

//request에 "center" 값을 이용해서 cart.jsp로 이동 시킴
request.setAttribute("center", "nbShop/cart.jsp");

nextPage = "/nbMain.jsp";


break;

// #4) 장바구니에서 최종 결제 요청
case "/eduOrder.od":

System.out.println("nbOrderController -> eduOrder.od 호출 !");


// 1) 받아온 값들을 List 변수에 저장한다.

List<String> order_edu_id = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_id")));
List<String> order_edu_name = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_name")));
List<String> order_edu_hp = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_hp")));
List<String> order_edu_email = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_email")));
List<String> order_edu_address1 = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_address1")));
List<String> order_edu_address2 = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_address2")));
List<String> order_edu_address3 = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_address3")));
List<String> order_edu_address4 = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_address4")));
List<String> order_edu_address5 = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_address5")));

List<String> order_pet_img = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_img")));
List<String> order_pet_name = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_name")));
List<String> order_pet_type = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_type")));
List<String> order_pet_age = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_age")));
List<String> order_pet_weight = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_weight")));
List<String> order_pet_gender = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_gender")));
List<String> order_pet_op = new ArrayList<String>(Arrays.asList(request.getParameterValues("pet_op")));
List<String> order_tr_img = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_img")));
List<String> order_tr_name = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_name")));
List<String> order_tr_hp = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_hp")));

List<String> order_date1 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date1")));
List<String> order_date2 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date2")));
List<String> order_date3 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date3")));
List<String> order_date4 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date4")));
List<String> order_date5 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date5")));
List<String> order_date6 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date6")));
List<String> order_date7 = new ArrayList<String>(Arrays.asList(request.getParameterValues("tr_date7")));
List<String> order_edu_cnt = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_cnt")));
List<String> order_edu_totalprice = new ArrayList<String>(Arrays.asList(request.getParameterValues("edu_totalprice")));


 orderdao.insertEduOrder(order_edu_id, 
		 					order_edu_name, 
		 					order_edu_hp, 
		 					order_edu_email, 
		 					order_edu_address1, 
		 					order_edu_address2, 
		 					order_edu_address3, 
		 					order_edu_address4, 
		 					order_edu_address5,
		 					order_pet_img,
		 					order_pet_name,
		 					order_pet_type,
		 					order_pet_age,
		 					order_pet_weight,
		 					order_pet_gender,
		 					order_pet_op,
		 					order_tr_img,
		 					order_tr_name,
		 					order_tr_hp,
		 					order_date1,
		 					order_date2,
		 					order_date3,
		 					order_date4,
		 					order_date5,
		 					order_date6,
		 					order_date7,
		 					order_edu_cnt,
		 					order_edu_totalprice
		 					);


//request에 "center" 값을 이용해서 nbMain.jsp로 이동 시킴
request.setAttribute("edu_id", order_edu_id);
request.setAttribute("edu_name", order_edu_name);
request.setAttribute("edu_email", order_edu_email);
request.setAttribute("edu_address1", order_edu_address1);
request.setAttribute("edu_address2", order_edu_address2);
request.setAttribute("edu_address3", order_edu_address3);
request.setAttribute("edu_address4", order_edu_address4);
request.setAttribute("edu_address5", order_edu_address5);
request.setAttribute("pet_img", order_pet_img);
request.setAttribute("pet_name", order_pet_name);
request.setAttribute("pet_type", order_pet_type);
request.setAttribute("pet_age", order_pet_age);
request.setAttribute("pet_weight", order_pet_weight);
request.setAttribute("pet_gender", order_pet_gender);
request.setAttribute("pet_op", order_pet_op);
request.setAttribute("tr_img", order_tr_img);
request.setAttribute("tr_name", order_tr_name);
request.setAttribute("tr_hp", order_tr_hp);
request.setAttribute("date1", order_date1);
request.setAttribute("date2", order_date2);
request.setAttribute("date3", order_date3);
request.setAttribute("date4", order_date4);
request.setAttribute("date5", order_date5);
request.setAttribute("date6", order_date6);
request.setAttribute("date7", order_date7);
request.setAttribute("edu_cnt", order_edu_cnt);
request.setAttribute("edu_totalprice", order_edu_totalprice);


//로그인 된 아이디와 예약번호를 가져온다
loginId = request.getParameter("memberid");

System.out.println(loginId);

// Step2) 예약 완료 되었으면 장바구니를 비우기 위해 DELETE 실행
//오더다오를 통해 deleteAlledu를 실행한다.
//늘봄샵 업데이트 되면 항목 추가하기!
orderdao.deleteAlledu(loginId);

//orderdao를 통해서 다시 조회한다.
vector = orderdao.checkCartedu(loginId);

//6) cart.jsp 페이지에서 출력할 eduordervo와 list를 내보낸다.
request.setAttribute("vector", vector);

//메인으로 이동하기
nextPage = "/nbMain.jsp";

break;


// #5) 펫불러오기 창에서 선택된 반려견 이름으로 정보 조회해오기,
case "/petSelect.od":



System.out.println("nbOrderController -> petSelect.od 호출 !");

// 1) 조회할 아이디 값을 가져온다.
HttpSession session1 = request.getSession();
String loging_id = (String)session1.getAttribute("id");

System.out.println(loging_id);

// 2) 조회할 강아지 값을 가져온다.
String petName = request.getParameter("pet_name");

System.out.println("login_id :" + loging_id);
System.out.println("petName :" + petName);

// 2) 조회할 아이디를 저장 시킨다.
request.setAttribute("id", loging_id);

// 2-1) petVo를 통해서 DB에 값이 있으면 가져오고 없으면 다른값을 반환시킨다.
PetVo petvo1 = orderdao.checkingPet(loging_id, petName);

//리턴받은 petvo를 setAttribute에 담아서 전달한다.
request.setAttribute("petvo", petvo1);

break;


default:
break;


}


//포워딩 (디스패처 방식)
RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
dispatch.forward(request, response);
}

}
