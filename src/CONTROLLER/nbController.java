package CONTROLLER;
import java.io.IOException;




import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import VO.nbOrderVo;
import VO.nbPetMemVo;
import VO.nbTrOrderVo;
import VO.trMemberVo;



@WebServlet("/nb/*")
public class nbController extends HttpServlet{
	
	
	// 오더 메소드를 만들 오더dao 호출
	OrderDAO orderdao;
	
	// 트레이너 정보를 조회할 trMemberVo를 호출
	trMemberVo trmembervo;
	
	// 회원+펫 정보를 조회할 nbPetMemVo를 호출
	nbPetMemVo nbpetmemvo;
	
	
	// 조회 또는 저장 시킬 오더vo, tr오더vo 호출
	nbOrderVo nbordervo;
	nbTrOrderVo nbtrordervo; 
	
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
		// 7-1) /edureservation.do		<- "수강신청"   		->  	" 수강 신청가기" 		->		"일정 확인하기" 버튼 	->		 "예약 신청"을 눌렀을때
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 8) 	/pet.shop       			<-  " 늘 봄샵 "   	-> 		" 샵 으로 이동  " 																	  요청
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
			
			//request에 calendar.jsp로 저장
			request.setAttribute("center", center);
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			System.out.println("예약 일정확인 페이지로 이동!");
			
			nextPage = "/nbMain.jsp";
			
			
		// 7-1) /edureservation.do			<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼" -> "회원 예약 "버튼"을 눌렀을때
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
			
			// 3)트레이너 이름을 매개변수로 해서 오더다오를 통해 값을 조회 한다.
			trmembervo = orderdao.checkTrainer(tr_name);
			
			// 4)가입한 회원 아이디를 매개변수로 해서 오더다오를 통해 값을 조회 한다.
			nbpetmemvo = orderdao.petuserCheck(login_id);
			
			// 5) 각각 setAttribute에 담기
			request.setAttribute("trmembervo", trmembervo);	
			request.setAttribute("nbpetmemvo", nbpetmemvo);
			
			//request에 "center" 값을 edu_reservation.jsp로 저장
			request.setAttribute("center", "nbShop/edu_reservation.jsp");
			
			//edu_reservation.jsp로 이동!
			System.out.println("edu_reservation.jsp로 폼액션 넘기기");
			System.out.println("예약 신청 페이지로 이동!");
			
			
			nextPage = "/nbMain.jsp";
			
			
		// 8)	 /pet.shop 	<- "늘 봄샵"   ->  "샵으로 이동 버튼" 을 눌렀을때
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
			
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
	}
}
