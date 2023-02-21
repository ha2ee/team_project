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

import DAO.ProjectDAO;



@WebServlet("/nb/*")
public class nbController extends HttpServlet{
	
	
	@Override
	public void init() throws ServletException {

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
		
		// 1) 	 /Main 				<- "메인화면" 요청
		// 2) 	 /intro.do         		<- "늘 봄이란?"  -> "  회 사 소 개  " 요청 
		// 3) 	 /ci.do					<- "늘 봄이란?"  -> "  C           I " 요청
		// 4)	 /navi.do				<- "늘 봄이란?" ->  "  오 시 는 길  " 요청
		// 5)	 /edu.do           	<- "수강신청"   ->  " 수강 신청가기"  회원 요청
		// 6)    /calendar.do     	<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼"을 눌렀을때
		// 7-1) /member.do			<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼" -> "회원 예약 "버튼"을 눌렀을때
		/////////////////////////////////////////////////////////////////////////////////////////////////
		// 8) /pet.shop        <-  " 늘 봄샵 "   -> "   샵 으로 이동   " 요청
		
		
		
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
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
			nextPage = "/nbMain.jsp";
			
			
		// 7-1) /member.do			<- "수강신청"   ->  " 수강 신청가기" -> "예약 일정 확인 버튼" -> "회원 예약 "버튼"을 눌렀을때
		}else if(action.equals("/member.do")) {
			
			System.out.println("member.do 메소드 호출!");
			
			// 중앙 화면 요청한 주소 얻기
			String center = request.getParameter("center");
			
			// 중앙 화면 바인딩 하기
			System.out.println("요청한 center : "+ center);
			
			//request에 "center" 값으로 저장
			request.setAttribute("center", center);
			
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
			
		}
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
	}
}
