package CONTROLLER;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.TrainerBoardDAO;
import DAO.TrainerDAO;
import VO.BoardVo;
import VO.MemberVo;
import VO.TrainerBoardVo;
import VO.TrainerVo;


//게시판 관련 기능 요청이 들어오면 호출되는 사장님(컨트롤러)
@WebServlet("/tb/*")
public class TrainerBoardController extends HttpServlet{
	
	//TrainerBoardDAO객체를 저장할 참조변수 선언
	TrainerBoardDAO trainerboarddao;
	
	//TrainerDAO객체를 저장할 참조변수 선언
	TrainerDAO trainerdao;
	
	//TrainerVo객체를 저장할 참조변수 선언
	TrainerVo trainervo;
	
	@Override
	public void init() throws ServletException {
		trainerboarddao = new TrainerBoardDAO();
		trainerdao = new TrainerDAO();
		trainervo = new TrainerVo();
		
		
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
		// /write.bo	  		<- 새글 작성 화면 요청!
		// /writePro.bo 		<- 입력한 새글 정보를 DB에 추가 요청!
		// /list.bo 		  		<- DB에 저장된 글 목록을 조회 하여 보여주는 요청 주소
		// /read.bo 	  		<- 게시판에서 제목을 눌러서 글을 수정하려할때 보여주는 요청 주소
		// /password.bo		<- 게시판에서 제목을 누른 뒤 비밀번호를 입력 받으려 할때 요청 하는 주소
		// /boardUpdate.bo  <- 게시판 -> 제목 눌리고 -> 비번 입력후 -> 수정 다하고 -> 수정 버튼 눌렀을때 요청
		// /deleteBoard.bo   <- 게시판 -> 제목 눌리고 -> 비번 입력후 -> 삭제 버튼 눌렀을때 요청 주소
		// /reply.bo           <- 게시판 -> 제목 눌리고 -> 답변 버튼을 클릭했을때 요청 주소
		
		//조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
		String nextPage = null;
		//요청한 중앙화면 뷰 주소를 저장할 변수
		String center = null;
		//BoardVo객체를 저장할 참조변수 선언
		BoardVo vo = null;
		ArrayList list = null;
		int count = 0;
		String key = null;
		String word = null;
		String memberid = null;
		
	      if (action.equals("/write.bo")) {
				//부장----
				//새글을 입력하는 화면 요청시~~
				//새글을 입력하는 화면에 로그인한 회원의 이름, 아이디, 이메일을 보여주기 위해
				//member테이블에서 SELECT하여 가져와야 합니다.
				TrainerVo trainervo = trainerdao.trainerOne("admin");
				
				//부장----
				//새글을 입력하는 중앙 View화면 주소 요청!
				center = "/nbBoard/trainerboardWrite.jsp";
			
				request.setAttribute("center", center);//"board/FileBoardwrite.jsp"
				request.setAttribute("trainervo", trainervo);
				
//				request.setAttribute("nowPage", request.getParameter("nowPage"));
//				request.setAttribute("nowBlock", request.getParameter("nowBlock"));
				
				nextPage = "/nbMain.jsp";
	         
	      } else if (action.equals("/writePro.bo")) {

	    	//부장---
				//첨부파일이 포함된 글쓰기 (DB에 글 추가) 요청! 
				int num;
				
				try {
					num = trainerboarddao.serviceInsertBoard(request,response);
					
					out = response.getWriter();
					out.print("<script>");
					out.print(" alert( '" +num+" 글 추가 성공!' );");
					out.print(" location.href='http://localhost:8090/TeamProject/tb/list.bo'");
					out.print("</script>");
					
					return;
				} catch (Exception e) {
					e.printStackTrace();
				}
	    	    
	    	  
	      } else if (action.equals("/list.bo")) {
	    	  
				//요청한 값을 이용해 응답할 값 마련(글 조회)
				list = trainerboarddao.boardListAll();
				
				//모든글의 갯수 조회
				count = trainerboarddao.getTotalRecord();
				System.out.println("list.bo의 count수 :"+count);
				//--부장
				//모든글을 조회해서 보여줄 VIEW주소 반환 
				center = "nbBoard/trainerboardList.jsp";
				
				request.setAttribute("center", center);//"nbBoard/trainerboard.jsp"
				request.setAttribute("list", list);
				request.setAttribute("count", count);
				
				//-------------------------------------------------------
				
//				HttpSession session_ = request.getSession();
//				String loginid = (String)session_.getAttribute("id");
//				
//				request.setAttribute("id", loginid);
				
				//list.jsp페이지의 페이징 처리 부분에서
				//이전 또는 다음 또는 각 페이지 번호를 클릭했을때.. 요청받는 값 얻기
				request.setAttribute("nowPage", request.getParameter("nowPage"));
				request.setAttribute("nowBlock", request.getParameter("nowBlock"));
				
				nextPage = "/nbMain.jsp";
	    	  
	      }
			
		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
	
}
