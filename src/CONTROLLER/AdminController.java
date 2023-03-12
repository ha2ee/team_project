package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDAO;
import DAO.MemberDAO;
import DAO.TrainerBoardDAO;
import DAO.TrainerDAO;
import VO.MemberVo;
import VO.TrainerVo;

@WebServlet("/adm/*")
public class AdminController extends HttpServlet {

		TrainerBoardDAO trainerboarddao;
		TrainerDAO trainerdao;
		TrainerVo trainerVo;
		
		MemberDAO memberDAO;
		MemberVo memberVO;
		
		AdminDAO adminDAO;
		
		@Override
		public void init() throws ServletException {
			adminDAO = new AdminDAO();
			memberDAO = new MemberDAO();
			memberVO = new MemberVo();
		
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
				nextPage = "/nbAdmin/adminMain.jsp";
				
			} else if(action.equals("/memManage.adm")) {
				System.out.println("/memManage 호출");
				List<MemberVo> list = adminDAO.selectAllMember();
				
				center = "/nbAdmin/adminMem.jsp";
				
				request.setAttribute("center", center);
				request.setAttribute("membersList", list);
				
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
				
				out.print("<script>location.href='/TeamProject/adm/adminMain'</script>");
				return;
			}
			
		
		
		
		
			//포워딩 (디스패처 방식)
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		
		}
		
		
		
		
		
	
}
