package CONTROLLER;

import java.io.IOException;




import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import VO.MemberVo;

@WebServlet("/nbMember/*")
public class nbMemberController extends HttpServlet{
	
	//MemberDAO객체를 저장할 참조변수 선언
	MemberDAO memberdao;
	
	@Override
	public void init() throws ServletException {
		memberdao = new MemberDAO();
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
		// nbMemberController INFO /////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// #1) 		/mem_join.me 		<- 일반회원가입 				 화면 요청
		// #1-1)   /joinIdCheck.me	<- 아이디 중복				 체크 요청
		// #1-2)	/mem_joinPro.me	<- 일반회원가입				 요청 주소를 받았을 때
		// #2) 		/tr_join.me 		<- 트레이너 회원가입			 화면 요청
		// #2-1)   /tr_joinPro.me		<- 트레이너 회원가입			 요청 주소를 받았을 때
		// #3) 	    /joinCategory.me 	<- 회원가입 유형 선택		 화면 요청
		// #4      /change.me			<- 회원정보					 요청 화면
		// #4-1)   /delete.me			<- 회원정보					 삭제 요청
		// #4-2)   /updateInfor.me	<- 회원정보					 수정 요청
		// #5)     /login.me			<- 로그인						 요청 화면
		// #5-1)   /loingPro.me		<- ID & PW 입력 후			 로그인 요청 화면
		// #6)     /logout.me			<- 로그아웃					 요청 화면
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		
		//조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
		String nextPage = null;
		//요청한 중앙화면 뷰 주소를 저장할 변수
		String center = null;
		
		switch (action) {
		
		 	// #1) 일반회원가입 화면 요청
			case "/mem_join.me":
				
				System.out.println("nbMemberController -> /mem_join.me 요청!");

				
				// nbMember/mem_join.jsp 중앙화면뷰 주소 바인딩
				request.setAttribute("center", "nbMember/mem_join.jsp");
				
				nextPage = "/nbMain.jsp";
				
				break;
				
				
				
				// #1-1) 아이디 중복 체크 요청!
				case "/joinIdCheck.me":
				
				System.out.println("nbMemberController -> /joinIdCheck.me 요청!");
					
					// 1) 입력한 아이디 얻기
					String id = request.getParameter("id");
					
					// 2) 입력한 아이디 값 출력 해보기
					System.out.println(id);
					//입력한 아이디가 DB에 저장되어 있는지 중복 체크 작업
					//true -> 중복 , false -> 중복아님 둘중 하나를 반환 받음
					boolean memResult = memberdao.memCheck(id);
					boolean trResult = memberdao.trCheck(id);
					//아이디 중복결과를 다시 한번 확인 하여 조건값을
					//join.jsp파일과 연결된 join.js파일에 작성해 놓은
					//success:function의 data매개변수로 웹브라우저를 거쳐 보냅니다!
					if (memResult == true || trResult == true) {
						out.write("사용 가능");
						return;
					}else if(memResult == false && trResult == false) {
						out.write("사용 불가");
						return;
					}
					break;
					
				// #1-2) 일반회원가입 요청 주소를 받았을때!!
				case "/mem_joinPro.me":
					
					System.out.println("nbMemberController -> /mem_joinPro.me 요청!");
					
					String mem_id = request.getParameter("id");
					String mem_name = request.getParameter("name");
					String mem_nick= request.getParameter("nickname");
					String mem_pw = request.getParameter("pass");
					String mem_email = request.getParameter("email");
					String mem_hp = request.getParameter("hp");
					String mem_gender = request.getParameter("gender");
					String mem_birth = request.getParameter("birth");
					String mem_address1 = request.getParameter("address1");
					String mem_address2 = request.getParameter("address2");
					String mem_address3 = request.getParameter("address3");
					String mem_address4 = request.getParameter("address4");
					String mem_pet = request.getParameter("pet");
					
					MemberVo mem_vo = new MemberVo(mem_id, mem_name, mem_nick, mem_pw, mem_email, mem_hp, mem_birth, mem_gender, mem_pet, mem_address1, mem_address2, mem_address3, mem_address4);
						   
						memberdao.insertMember(mem_vo);
						memberdao.insertMemAddress(mem_vo);
					
						
					nextPage="/nbMain.jsp";
					break;	
				
				
			
			// #2) 트레이너 회원가입 화면 요청
			case "/tr_join.me":
				
				System.out.println("nbMemberController -> /tr_join.me 요청!");
				
				request.setAttribute("center", "nbMember/tr_join.jsp");
				
				nextPage = "/nbMain.jsp";
				
				break;
				
				// #2-1) 트레이너 회원가입 요청 주소를 받았을때!!
				case "/tr_joinPro.me":
					
					String tr_id = request.getParameter("id");
					String tr_name = request.getParameter("name");
					String tr_nick= request.getParameter("nickname");
					String tr_pw = request.getParameter("pass");
					String tr_email = request.getParameter("email");
					String tr_hp = request.getParameter("hp");
					String tr_gender = request.getParameter("gender");
					String tr_birth = request.getParameter("birth");
					String tr_address1 = request.getParameter("address1");
					String tr_address2 = request.getParameter("address2");
					String tr_address3 = request.getParameter("address3");
					String tr_address4 = request.getParameter("address4");
					String tr_pet = request.getParameter("pet");
					
					MemberVo tr_vo = new MemberVo(tr_id, tr_name, tr_nick, tr_pw, tr_email, tr_hp, tr_birth, tr_gender, tr_address1, tr_address2, tr_address3, tr_address4);
							
					memberdao.insertTrMember(tr_vo);
					memberdao.insertTrMemAddress(tr_vo);
					
					
					nextPage="/nbMain.jsp";
					
					break;	
		
			
			// #3) 회원가입 유형선택 화면 요청
			case "/joinCategory.me":
				
				System.out.println("nbMemberController -> /joinCategory.me 요청!");
				
				
				//중앙화면 주소 바인딩
				request.setAttribute("center", "nbMember/joinCategory.jsp");
				
				
				//전체 메인화면 주소 저장
				nextPage = "/nbMain.jsp";
				
				break;		
				
				
			// #4) 회원정보 요청 화면
			case "/change.me":
				
				System.out.println("nbMemberController -> /change.me 요청!");
				
				
				//중앙화면 주소 바인딩
				request.setAttribute("center", "nbMember/change.jsp");

				//전체 메인화면 주소 저장
				nextPage="/nbMain.jsp";

				break;	
				
				
				
				// #4-1) 회원정보 삭제 요청 
				case "/delete.me":
					
					System.out.println("nbMemberController -> /delete.me 요청!");
					
					//삭제할 아이디 값을 얻어와 변수에 저장
					String deleteId = request.getParameter("id");
					
					boolean mem_result = memberdao.memDelete(deleteId);
					boolean tr_result = memberdao.trDelete(deleteId);
					
					if (mem_result == true || tr_result == true) {
						out.write("삭제 성공");
						return;
					}else if(mem_result == false && tr_result == false) {
						out.write("삭제 실패");
						return;
					}
					break;
				

				
					
				// #4-2) 회원정보 수정 요청 
				case "/updateInfor.me":
					
					System.out.println("nbMemberController -> /updateInfor.me 요청!");
					
					String up_id = request.getParameter("id");
					String up_pw = request.getParameter("pw");
					String up_nick = request.getParameter("nick");
					String up_name = request.getParameter("name");
					String up_hp = request.getParameter("hp");
					String up_birth = request.getParameter("birth");
					String up_email = request.getParameter("email");
					String up_gender = request.getParameter("gender");
					String up_address1 = request.getParameter("address1");
					String up_address2 = request.getParameter("address2");
					String up_address3 = request.getParameter("address3");
					String up_address4 = request.getParameter("address4");
					String up_address5 = request.getParameter("address5");
					
					int up_MemResult = memberdao.memUpdate(up_id, up_pw, up_nick, up_name, up_hp, up_birth, up_email, up_gender);
					int up_TrResult = memberdao.trUpdate(up_id, up_pw, up_nick, up_name, up_hp, up_birth, up_email, up_gender);
					int up_MemAddResult = memberdao.memAddUpdate(up_id, up_address1,up_address2,up_address3,up_address4,up_address5);
					int up_TrAddResult = memberdao.trAddUpdate(up_id, up_address1,up_address2,up_address3,up_address4,up_address5);
	
					
					if ((up_MemResult == 1 && up_MemAddResult == 1 ) || (up_TrResult == 1 && up_TrAddResult == 1 )) {
						out.write("수정 성공");
						return;
					}else if((up_MemResult == 0  ||  up_MemAddResult == 0 ) && (up_TrResult == 0 || up_TrAddResult == 0 )) {
						out.write("수정 실패");
						return;
					}
					
					
					//전체 메인화면 주소 저장
					nextPage="/nbMain.jsp";
					
					break;
					
					
			// #5) 로그인 요청 화면
			case "/login.me":
				
				System.out.println("nbMemberController -> /login.me 요청!");
				
				//중앙화면 주소 바인딩
				request.setAttribute("center", "nbMember/login.jsp");
				
				//전체 메인화면 주소 저장
				nextPage="/nbMain.jsp";
				break;
			
			
		
			
			// #5-1) 아이디와 비밀번호를 작성하고 로그인버튼 눌렀을때 !
			case "/loginPro.me":
				
				System.out.println("nbMemberController -> /loginPro.me 요청!");
				
				String login_id = request.getParameter("id");
				String login_pass = request.getParameter("pass");
				
				//요청한 값을 이용해 클라이언트의 웹브라우저로 응답할 값을 마련
				//요약 : DB작업 등의 비즈니스로직처리
				//check변수에 저장되는 값이 1이면 아이디, 비밀번호 맞음
				//                   0이면 아이디맞음, 비밀번호 틀림
				//					 -1이면 아이디 틀림 
				int check = memberdao.userCheck(login_id,login_pass);
				
				if(check == 0) {//아이디 맞고 비밀번호 틀림
					out.println("<script>");
					out.println("window.alert('비밀번호 틀림');");
					out.println("history.go(-1);");
					out.println("</script>");
					return;
				}else if(check == -1){//아이디 틀림
					out.println("<script>");
					out.println("window.alert('아이디 틀림');");
					out.println("history.go(-1);");
					out.println("</script>");
					return;
				}
				
				//check = 1 아이디 맞음, 비밀번호 맞음
				//로그인 처리를 위해 session메모리 영역에 세션값 저장 후 포워딩
				
				//session메모리 생성
				HttpSession session = request.getSession();
				//session메모리에 입력한 아이디 바인딩 (저장)
				session.setAttribute("id", login_id);
				
				//메인화면 view 주소
				nextPage = "/CarMain.jsp";
				break;
				
				
				
			
			// #6) 로그아웃 요청을 받았을때...
			case "/logout.me":
				
				System.out.println("nbMemberController -> /logout.me 요청!");
				
				//기존에 생성했던 session메모리 얻기
				HttpSession session_ = request.getSession();
				session_.invalidate(); //세션에 저장된 아이디 제거
				
				//메인화면 view 주소
				nextPage = "/CarMain.jsp";
				
				break;
				

				
			default:
				break;
				

		}
		
		
		//포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
	
	
}
