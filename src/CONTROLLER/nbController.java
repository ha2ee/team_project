package CONTROLLER;
import java.io.IOException;


import java.io.PrintWriter;
import java.util.ArrayList;
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


@WebServlet("/nb/*")
public class nbController extends HttpServlet{
	
	// 훈련사의 예약일을 조회할 eduordervo를 호출
	eduOrderVo eduordervo;
	
	
	// 오더 메소드를 만들 오더dao 호출
	OrderDAO orderdao;
	
	// 트레이너 정보를 조회할 TrainerVo를 호출
	TrainerVo trainervo;
	
	// 회원,펫 정보를 조회할 각 vo를 호출
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
	protected void doHandle(HttpServletRequest request, 
							HttpServletResponse response) 
							throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("2단계 요청 주소: "+action);
		
		
		
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// nController INFO /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 1) 	 /Main 						<- 								"메인화면" 								  											  요청
		// 2) 	 /intro.do         			<- "늘 봄이란?"  		-> 		"회사소개" 							      											  요청
		// 3) 	 /ci.do						<- "늘 봄이란?"  		-> 		"  C  I   " 																			  요청
		// 4)	 /navi.do					<- "늘 봄이란?"		->  	"오시는길" 								  											  요청
		// 5)	 /edu.do          	 		<- "수강신청"   		->  	"수강 신청가기"   						  											  요청
		// 6)    /calendar.do    	 		<- "수강신청"   		-> 		" 수강 신청가기" 		-> 		"일정 확인하기" 버튼을 							 눌렀을때
		// 7)	 /edureservation.do		<- "수강신청"   		->  	" 수강 신청가기" 		->		"일정 확인하기" 버튼 	->		 "예약 신청"을 눌렀을때
		// 8) 	 /popup1.do				<- "예약정보"         ->    									"반려견 정보 추가하기" 		 			 버튼을 눌렀을때
		// 9)    /cart.do					<- "수강신청"         ->     " 예약하기 "																		 눌렀을때
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 10) 	/pet.shop       			<-  " 늘 봄샵 "   	-> 		" 샵 으로 이동  " 																	  요청
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// nextPage 변수 생성 및 초기화
		String nextPage = null;
		
		// (1) 서버주소를 /Project/Main으로 입력했을때 ,
		if(action.equals("/Main")) {

			nextPage = "/nbMain.jsp";
			
			
		// (2) index -> 늘 봄이란? -> 회사 소개를 클릭했을 때,
		}else if(action.equals("/Intro.do")) {
			
			System.out.println("Intro.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		// (3) index -> 늘 봄이란? -> CI 를 클릭했을 때,	
		}else if(action.equals("/ci.do")) {
			
			System.out.println("ci.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		// (4) index -> 늘 봄이란? -> 오시는 길을 클릭했을 때,		
		}else if(action.equals("/navi.do")) {
			
			System.out.println("navi.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		// 5)	 /edu.do           	<- "수강신청"   ->  " 수강 신청가기"  회원 요청
		}else if(action.equals("/edu.do")) {
			
			System.out.println("edu.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		// 6)    /calendar.do     	<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼"을 눌렀을때
		}else if(action.equals("/calendar.do")) {
			
			System.out.println("calendar.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 1) 조회할 훈련사의 이름 값을 가져온다.
			String tr_name = request.getParameter("tr_name");
			
			// 2) 조회할 이름을 저장 시킨다.
			request.setAttribute("tr_name", tr_name);
			
			// 3) 훈련사 이름을 매개변수로 해서 오더다오를 통해 선택된 훈련사의
			//    예약 된 일자를 조회해서 캘린더에서 선택하지 못하도록 한다.
			List list = orderdao.checkDate(tr_name);
			//  	  추가로 장바구니에 등록되어 있는 일자도 조회해서 선택하지 못하도록 한다.
			List list2 = orderdao.checkCart(tr_name);
				
			//request에 calendar.jsp로 저장
			request.setAttribute("center", center);
			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			System.out.println("예약 일정확인 페이지로 이동!");
			
			nextPage = "/nbMain.jsp";
			
			
		// 7) /edureservation.do			<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼" -> "회원 예약 "버튼"을 눌렀을때
		}else if(action.equals("/edureservation.do")) {
			
			
			System.out.println("edureservation.do 메소드 호출!");
			
			// 1)조회를 할 이름 값을 가져온다.
			String tr_name = request.getParameter("tr_name");
			System.out.println(tr_name);
			
			HttpSession session = request.getSession();
			String login_id = (String)session.getAttribute("id");
			System.out.println(login_id);
			
			// 2)조회할 이름을 저장 시킨다.
			request.setAttribute("tr_name", tr_name);
			
			// 2-1)조회할 ID를 저장 시킨다.
			request.setAttribute("id", login_id);
			
			// 3-1)트레이너 이름을 매개변수로 해서 오더다오를 통해 선택된 트레이너 값을 조회 한다.
			trainervo = orderdao.checkTrainer(tr_name);
			
			// 3-2)가입한 회원 아이디를 매개변수로 해서 오더다오를 통해 개인정보 값을 조회 한다.
			membervo = orderdao.checkMember(login_id);
			
			// 5) 각각 setAttribute에 담기
			request.setAttribute("trainervo", trainervo);	
			request.setAttribute("membervo", membervo);
			
			//request에 "center" 값을 edu_reservation.jsp로 저장
			request.setAttribute("center", "nbShop/edu_reservation.jsp");
			
			//edu_reservation.jsp로 이동!
			System.out.println("edu_reservation.jsp로 폼액션 넘기기");
			System.out.println("예약 신청 페이지로 이동!");
			
			
			nextPage = "/nbMain.jsp";
			
		// 8) 	 /popup1.do	<- "예약정보"  ->  "반려견 정보 추가하기"	 버튼을 눌렀을때
		}else if(action.equals("/popup1.do")){
			
			System.out.println("popup1.do 메소드 호출!");
			
			
			String center = request.getParameter("center");
			
			request.setAttribute("center", center);
			
			System.out.println("popup1.jsp로 팝업창 띄우기");
			
			nextPage = "/nbMain.jsp";
			
			
		// 9)    /cart.do 메인페이지에서 장바구니를 눌렀을때
		}else if(action.equals("/cart.do")) {
			
			System.out.println("cart.do 메소드 호출!");
			
			String id = request.getParameter("id");
			
			System.out.println(id);
			
			Vector<eduOrderVo> vector = orderdao.checkCartedu(id);
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			request.setAttribute("vector", vector);
			
			
			nextPage = "/nbMain.jsp";	
			
			
			
		// 10)	 /pet.shop 	<- "늘 봄샵"   ->  "샵으로 이동 버튼" 을 눌렀을때
		}else if(action.equals("/pet.shop")) {
			
			System.out.println("pet.shop 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";

		}else if(action.equals("/mypage.me")) {
			
			System.out.println("mypage.me 호출!");
			
			String center = request.getParameter("center");
			
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
		} else if (action.equals("/trainer.bo")) {
			
			System.out.println("trainer.bo 훈련사 상담 게시판 호출!");
			
			String center = request.getParameter("center");
			
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		}else if(action.equals("/mypage.me")) {
			System.out.println("mypage.do 호출!");
			
			String center = request.getParameter("center");
			
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
		} else if (action.equals("/trainer.bo")) {
			System.out.println("trainer.bo 훈련사 상담 게시판 호출!");
			String center = request.getParameter("center");
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		}else if(action.equals("/search.map")) {

			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");

			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);

			//request에 "center" 값으로 저장
			request.setAttribute("center", center);

			nextPage = "/nbMain.jsp";
		}
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
	}
}
