package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDAO;
import DAO.CommentDAO;
import DAO.FreeBoardDAO;
import DAO.MemberDAO;
import DAO.TrainerBoardDAO;
import DAO.TrainerDAO;
import VO.CommentVO;
import VO.FreeBoardVo;
import VO.MemberVo;
import VO.TrainerBoardVo;
import VO.TrainerVo;

@WebServlet("/adm/*")
public class AdminController extends HttpServlet {

		TrainerBoardDAO trainerboarddao;
		TrainerBoardVo trainerboardVO;
		TrainerDAO trainerdao;
		TrainerVo trainerVO;
		
		FreeBoardDAO freeboarddao;
		FreeBoardVo freeboardVO;
		
		MemberDAO memberDAO;
		MemberVo memberVO;
		
		AdminDAO adminDAO;
		
		@Override
		public void init() throws ServletException {
			adminDAO = new AdminDAO();
			memberDAO = new MemberDAO();
			memberVO = new MemberVo();
			trainerVO = new TrainerVo();
			trainerdao = new TrainerDAO();
			trainerboarddao = new TrainerBoardDAO();
			trainerboardVO = new TrainerBoardVo();
			freeboarddao = new FreeBoardDAO();
		}
		
		
		
		
		@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request,response);
			
		}
		
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doHandle(request,response);
			
		}
		private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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
			String id = "";
			HttpSession session = request.getSession();
			id = (String) session.getAttribute("id");			
			
			if (action.equals("/adminMain")) {
				//회원 목록 
				List<MemberVo> list = adminDAO.getMemberListMain();
				request.setAttribute("membersList", list);
				//============================================================
				
				//트레이너 목록
				List<TrainerVo> trList = adminDAO.selectTrAllMember();
				request.setAttribute("trMembersList", trList);
				//============================================================
				
				//자유게시판 목록
				ArrayList<FreeBoardVo> fbList = adminDAO.fbListAll();
				request.setAttribute("fbList", fbList);
				//============================================================
				
				
				//훈련사 상담 목록
				ArrayList<TrainerBoardVo> trBoardList = adminDAO.getBoardList();
				request.setAttribute("trBoardList", trBoardList);
				//============================================================
				
				nextPage = "/nbAdmin/adminMain.jsp";
				
			} else if(action.equals("/memManage.adm")) {
				System.out.println("/memManage 호출");
				List<MemberVo> list = adminDAO.selectAllMember();
				
				request.setAttribute("center", center);
				request.setAttribute("membersList", list);
				
//				nextPage = "/nbAdmin/adminMain.jsp";
				
				//========================================================
				//회원목록 페이징 처리
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
		        
		        int listCount = adminDAO.getMemberListCount(listOpt);
		        ArrayList<MemberVo> list2 =  adminDAO.getMemberList(listOpt);
		        
		        // 한 화면에 10개의 게시글을 보여지게함
		        // 페이지 번호는 총 5개, 이후로는 [다음]으로 표시
		        
		        // 전체 페이지 수
		        int maxPage = (int)(listCount/10.0 + 0.9);
		        //시작 페이지 번호
		        int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		        //마지막 페이지 번호
		        int endPage = startPage + 4;
		        if(endPage > maxPage)    endPage = maxPage;
		        
		        // 4개 페이지번호 저장
		        request.setAttribute("spage", spage);
		        request.setAttribute("maxPage", maxPage);
		        request.setAttribute("startPage", startPage);
		        request.setAttribute("endPage", endPage);
		        
		        request.setAttribute("listCount", listCount);
		        request.setAttribute("membersList", list2);
				center = "/nbAdmin/adminMem.jsp";
		        request.setAttribute("center", center);
		        request.setAttribute("trainerboarddao", trainerboarddao);
				
		        nextPage = "/nbAdmin/adminMain.jsp";
				
				
			} else if(action.equals("/memDetail.adm")) {
				
				String memberID = request.getParameter("memberID");
				memberVO = memberDAO.memberOne(memberID);
				
				
				center = "/nbAdmin/adminMemDetail.jsp";
				
				request.setAttribute("center", center);
				request.setAttribute("memberVO", memberVO);
				
				nextPage = "/nbAdmin/adminMain.jsp";
			} else if (action.equals("/checkMemNick.adm")) {
				
				//회원 닉네임 확인
				String nick = request.getParameter("nick");
				boolean checkResult = adminDAO.checkMemNick(nick);
				
				if (checkResult) {
					out.write("사용 불가");
					return;
				} else {
					out.write("사용 가능");
					return;
				}
				
			} else if (action.equals("/updatePro.adm")) {
				//회원정보업데이트
				memberVO.setMem_id(request.getParameter("id"));
				memberVO.setMem_nick(request.getParameter("nickname"));
				memberVO.setMem_pw(request.getParameter("pass"));
				memberVO.setMem_email(request.getParameter("email"));
				memberVO.setMem_hp(request.getParameter("hp"));
				memberVO.setMem_pet(request.getParameter("pet"));
				memberVO.setMem_address1(request.getParameter("address1"));
				memberVO.setMem_address2(request.getParameter("address2"));
				memberVO.setMem_address3(request.getParameter("address3"));
				memberVO.setMem_address4(request.getParameter("address4"));
				memberVO.setMem_address5(request.getParameter("address5"));
				System.out.println(memberVO.getMem_address1());
				System.out.println(memberVO.getMem_id());
				adminDAO.memUpdate(memberVO);
				
				out.print("<script>location.href='/TeamProject/adm/memDetail.adm?memberID="+memberVO.getMem_id()+"'</script>");
				return;
			
			} else if (action.equals("/trManage.adm")) {
				List<TrainerVo> list = adminDAO.selectTrAllMember();
				
				center = "/nbAdmin/adminTrMem.jsp";
				
				request.setAttribute("center", center);
				request.setAttribute("trMembersList", list);
				
				nextPage = "/nbAdmin/adminMain.jsp";
				
			} else if (action.equals("/trMemDetail.adm")) {
				String trMemID = request.getParameter("trMemberID");

				trainerVO = trainerdao.trainerOne(trMemID);
				
				center = "/nbAdmin/adminTrMemDetail.jsp";
				
				request.setAttribute("center", center);
				request.setAttribute("trainerVo", trainerVO);
				
				nextPage = "/nbAdmin/adminMain.jsp";
			
			} else if (action.equals("/trUpdatePro.adm")) {
				//트레이너정보업데이트
				trainerVO.setTr_id(request.getParameter("id"));
				trainerVO.setTr_pw(request.getParameter("pass"));
				trainerVO.setTr_email(request.getParameter("email"));
				trainerVO.setTr_hp(request.getParameter("hp"));
				trainerVO.setTr_address1(request.getParameter("address1"));
				trainerVO.setTr_address2(request.getParameter("address2"));
				trainerVO.setTr_address3(request.getParameter("address3"));
				trainerVO.setTr_address4(request.getParameter("address4"));
				trainerVO.setTr_address5(request.getParameter("address5"));
				adminDAO.trUpdate(trainerVO);
				
				out.print("<script>location.href='/TeamProject/adm/trMemDetail.adm?trMemberID="+trainerVO.getTr_id()+"'</script>");
				return;
				
			} else if (action.equals("/trBoardList.adm")) {
				
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
		        
		        // 한 화면에 10개의 게시글을 보여지게함
		        // 페이지 번호는 총 5개, 이후로는 [다음]으로 표시
		        
		        // 전체 페이지 수
		        int maxPage = (int)(listCount/10.0 + 0.9);
		        //시작 페이지 번호
		        int startPage = (int)(spage/5.0 + 0.8) * 5 - 4;
		        //마지막 페이지 번호
		        int endPage = startPage + 4;
		        if(endPage > maxPage)    endPage = maxPage;
		        
		        // 4개 페이지번호 저장
		        request.setAttribute("spage", spage);
		        request.setAttribute("maxPage", maxPage);
		        request.setAttribute("startPage", startPage);
		        request.setAttribute("endPage", endPage);
		        
		        // 글의 총 수와 글목록 저장
		        request.setAttribute("listCount", listCount);
		        request.setAttribute("list", list2);
		        center = "/nbAdmin/adminTrBoardList.jsp";
		        request.setAttribute("center", center);
		        request.setAttribute("trainerboarddao", trainerboarddao);
				
		        nextPage = "/nbAdmin/adminMain.jsp";
				
			} else if (action.equals("/trBoardRead.adm")) {
				trainerboardVO = trainerboarddao.boardRead(request);
		    	  //content를 읽어들여서 다운로드 링크를 만들 수 있는 메소드
		    	  List<String> imageUrls = trainerboarddao.contentLink(trainerboardVO.getTb_content());
					
					//글제목을 눌러 글을 조회한 후 보여주는 중앙 화면  View 주소를 얻어옴
					center = "/nbAdmin/adminTrBoardRead.jsp";
			
					request.setAttribute("center", center);
					request.setAttribute("vo", trainerboardVO);
					request.setAttribute("trainerboarddao", trainerboarddao);
					
					request.setAttribute("pageNum", request.getParameter("pageNum")); 
					request.setAttribute("tb_idx", request.getParameter("tb_idx"));
					request.setAttribute("imageUrls", imageUrls);
					nextPage = "/nbAdmin/adminMain.jsp";
					
			} else if (action.equals("/trBoardDelete.adm")) {
				
				String delete_result = "";
		    	  String delete_idx = request.getParameter("tb_idx");
		    	  String DBDelete_result = "";
		    	  try {
		    		  delete_result = trainerboarddao.deleteFile(request);
		    		  DBDelete_result = trainerboarddao.tbDBDelete(delete_idx);
						out = response.getWriter();
						if(delete_result.equals("삭제성공")) {
						out.write(delete_result); //Ajax 글삭제에 성공하면 "삭제성공" 반환 , 실패하면 "삭제실패" 반환
						} else {
							out.write(DBDelete_result);
						}
						return;
						
					} catch (Exception e) {
						e.printStackTrace();
					}
			
			} else if (action.equals("/delMem.adm")) {
				String delID = request.getParameter("delID");
				adminDAO.delMem(delID);
				
				out.print("<script>location.href='/TeamProject/adm/adminMain';</script>");
				
				return;
			
			} else if (action.equals("/resetImg.adm")) {
				System.out.println("reset.adm 호출");
				String delImgId = request.getParameter("id");
				adminDAO.delImg(delImgId);
				
				out.print("초기화 완료");
				
				return;
				

			} else if (action.equals("/freeBoardList.adm")) {
				
				String nowPage = request.getParameter("nowPage");
				String nowBlock = request.getParameter("nowBlock");
				
				request.setAttribute("nowPage", nowPage);
				request.setAttribute("nowBlock", nowBlock);
				
				ArrayList<FreeBoardVo> list = freeboarddao.boardListAll();
				int count = freeboarddao.getTotalRecord();
				request.setAttribute("count", count);
				request.setAttribute("list", list);
				request.setAttribute("center", "/nbAdmin/adminFreeBoardList.jsp");
				
				nextPage = "/nbAdmin/adminMain.jsp";
			
			} else if (action.equals("/freeBoardRead.adm")) {
				String nowBlock = request.getParameter("nowBlock");
		        String nowPage = request.getParameter("nowPage");

		        int b_idx = Integer.parseInt(request.getParameter("b_idx"));

		        freeboardVO = freeboarddao.boardRead(b_idx);
		        ArrayList<FreeBoardVo> list = freeboarddao.boardListAll();
		        int count = freeboarddao.getTotalRecord();
//		        HttpSession session = request.getSession();
		        
		        // 댓글 목록 가져오기
		        CommentDAO commnetdao = new CommentDAO();
		        ArrayList<CommentVO> clist = commnetdao.listComment(b_idx);
		        
		        id   = (String)session.getAttribute("id");
		        System.out.println(id);
		        
		        String likeCheck = freeboarddao.checkLikeBeforeRead(id,b_idx);
		        
		        request.setAttribute("clist", clist);
		        request.setAttribute("count", count);
		        request.setAttribute("list", list);
		        request.setAttribute("vo", freeboardVO);
		        request.setAttribute("likeCheck", likeCheck);
		        request.setAttribute("center", "/nbAdmin/adminFreeBoardRead.jsp");
		        request.setAttribute("nowBlock", nowBlock);
		        request.setAttribute("nowPage", nowPage);
		        nextPage = "/nbAdmin/adminMain.jsp";
			
			} else if (action.equals("/fbDelete.adm")) {
				int idx1 = Integer.parseInt( request.getParameter("fb_idx")  );
		        int result3 = freeboarddao.deleteOne(idx1);
		        
		        if(result3 == 1) {
		          out.println(1);
		        } else {
		          out.println(0);
		        }
		        
		    //게시글 삭제 버튼 눌렀을때 게시글 삭제전 댓글 전체 삭제 부터 해야함.    
		    
		        CommentDAO allDel_dao = new CommentDAO();
		 		
		 		//현재 글번호를 이용하여 댓글 테이블에서 부모글번호 댓글 전체 삭제
		 		allDel_dao.delAllComment(idx1); // 부모글번호

		        return;

		        //임시 회원DB 정보 조회
			} else if (action.equals("/temTrManage.adm")) {
				List<TrainerVo> list = adminDAO.selectTemTrAllMember();

				center = "/nbAdmin/adminTemTrMem.jsp";
				
				request.setAttribute("center", center);
				request.setAttribute("trMembersList", list);
				
				nextPage = "/nbAdmin/adminMain.jsp";
	
			}
		
			//포워딩 (디스패처 방식)
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		
		}
		
		
		
		
		
	
}
