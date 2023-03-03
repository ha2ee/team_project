package CONTROLLER;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDAO;
import VO.eduOrderVo;

@WebServlet("/nbOrder/*")
public class nbOrderController extends HttpServlet{
	
	//MemberDAO객체를 저장할 참조변수 선언
	OrderDAO orderdao;
	
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
		System.out.println("요청한  주소 : "+action);
		
		
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// nbOrderController INFO ////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// #1) 		/eduOrder.od			 		<- 수강신청		 					최종 결제 요청
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		//조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
		String nextPage = null;
		//요청한 중앙화면 뷰 주소를 저장할 변수
		String center = null;
		
		switch (action) {
		 	
			// #1) 수강신청 최종 결제 요청
			case "/eduOrder.od":
			
			System.out.println("nbOrderController -> eduOrder.od 호출 !");
				
				// members/join.jsp 중앙화면뷰 주소 얻기
				center = request.getParameter("center");
				// members/join.jsp 중앙화면뷰 주소 바인딩
				request.setAttribute("center", center);
				nextPage = "/nbMain.jsp";
				break;

			default:
				break;
				

		}
		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
	
}
