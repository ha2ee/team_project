package CONTROLLER;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

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
import VO.trMemberVo;


//게시판 관련 기능 요청이 들어오면 호출되는 사장님(컨트롤러)
@WebServlet("/tb/*")
public class TrainerBoardController extends HttpServlet{
	
	//TrainerBoardDAO객체를 저장할 참조변수 선언
	TrainerBoardDAO trainerboarddao;
	
	//TrainerDAO객체를 저장할 참조변수 선언
	TrainerDAO trainerdao;
	
	//TrainerVo객체를 저장할 참조변수 선언
	trMemberVo trmembervo;
	
	@Override
	public void init() throws ServletException {
		trainerboarddao = new TrainerBoardDAO();
		trainerdao = new TrainerDAO();
		trmembervo = new trMemberVo();
		
		
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
		
		//조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
		String nextPage = null;
		//요청한 중앙화면 뷰 주소를 저장할 변수
		String center = null;
		//BoardVo객체를 저장할 참조변수 선언
		TrainerBoardVo vo = null;
		ArrayList list = null;
		int count = 0;
		String key = null;
		String word = null;
		String memberid = null;
		
	      if (action.equals("/write.bo")) {
	    	  
	    	  //새글 입력시 작성자에 닉네임 넣어주려고 가져오는 메소드
	    	  trMemberVo trainervo = trainerdao.trainerOne("admin");
				
				//새글을 입력하는 중앙 View화면 주소 요청!
				center = "/nbBoard/trainerboardWrite.jsp";
			
				request.setAttribute("center", center);
				request.setAttribute("trainervo", trainervo);
				
				
				nextPage = "/nbMain.jsp";
	         
	      } else if (action.equals("/writePro.bo")) {

				//첨부파일이 포함된 글쓰기 (DB에 글 추가) 요청! 
				int num;
				
				try {
					num = trainerboarddao.InsertBoard(request,response);
					
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
	    	  
//				//-------------------------------------------------------
//				
//				//로그인시 기능 주석처리중
////				HttpSession session_ = request.getSession();
////				String loginid = (String)session_.getAttribute("id");
////				
////				request.setAttribute("id", loginid);
//				
				//----------------------------------------------------------------------
				
				 // 현재 페이지 번호 만들기
		        int spage = 1;
		        String page = request.getParameter("page");
		        
		        if(page != null)
		            spage = Integer.parseInt(page);
		        
		        // 검색조건과 검색내용을 가져온다.
		        String opt = request.getParameter("opt");
		        String condition = request.getParameter("condition");
		        
		        // 검색조건과 내용을 Map에 담는다.
		        HashMap<String, Object> listOpt = new HashMap<String, Object>();
		        listOpt.put("opt", opt);
		        listOpt.put("condition", condition);
		        listOpt.put("start", spage*10-9);
		        
		        int listCount = trainerboarddao.getBoardListCount(listOpt);
		        ArrayList<TrainerBoardVo> list2 =  trainerboarddao.getBoardList(listOpt);
		        System.out.println(list2.size());
		        list =  trainerboarddao.getBoardList(listOpt);
		        
		        // 한 화면에 10개의 게시글을 보여지게함
		        // 페이지 번호는 총 5개, 이후로는 [다음]으로 표시
		        
		        // 전체 페이지 수
		        int maxPage = (int)(listCount/10.0 + 0.9);
		        System.out.println("maxPage"+maxPage);
		        //시작 페이지 번호
		        int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		        System.out.println("startPage"+startPage);
		        //마지막 페이지 번호
		        int endPage = startPage + 4;
		        System.out.println("endPage"+endPage);
		        if(endPage > maxPage)    endPage = maxPage;
		        
		        // 4개 페이지번호 저장
		        request.setAttribute("spage", spage);
		        request.setAttribute("maxPage", maxPage);
		        request.setAttribute("startPage", startPage);
		        request.setAttribute("endPage", endPage);
		        
		        // 글의 총 수와 글목록 저장
		        request.setAttribute("listCount", listCount);
		        request.setAttribute("list", list2);
		        center = "nbBoard/trainerboardList.jsp";
		        request.setAttribute("center", center);
		        
		        nextPage = "/nbMain.jsp";
		        
	    	  
	      } else if (action.equals("/read.bo")) {
	    	  vo = trainerboarddao.boardRead(request);
				
				//글제목을 눌러 글을 조회한 후 보여주는 중앙 화면  View 주소를 얻어옴
				center = "nbBoard/trainerboardRead.jsp";
		
				request.setAttribute("center", center);
				request.setAttribute("vo", vo);
				
				request.setAttribute("pageNum", request.getParameter("pageNum")); 
				request.setAttribute("cb_idx", request.getParameter("cb_idx"));
				
				nextPage = "/nbMain.jsp";
	    	  
	      } else if (action.equals("/download.bo")) {
	    	  
	    	  String fileName = request.getParameter("fileName");
	    	  String cbidx = request.getParameter("cbidx");
	    	  String folder = "C:\\Users\\kdhvc\\git\\neulbom\\WebContent\\uploadFile\\TrainerBoardFile\\cb_idx"+cbidx;
	    	  String filePath = folder + "/" + fileName;
	    	  
	    	  trainerboarddao.downLoad(response,filePath,fileName);
	    	  
				return;
	      }
			
		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
	
}
