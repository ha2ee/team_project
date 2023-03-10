package CONTROLLER;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDAO;
import DAO.OrderDAO;
import DAO.TrainerDAO;
import VO.MemberVo;
import VO.TrainerVo;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {

	// 오더 메소드를 만들 오더dao 호출
	OrderDAO orderdao;

	// 일반회원 가입 메소드를 만들 MemberDao 호출
	MemberDAO memberdao;

	// 일반회원 정보를 조회할 MemberVo를 호출
	MemberVo memberVo;
	
	// 일반회원 가입 메소드를 만들 MemberDao 호출
	TrainerDAO trainerdao;
	
	// 트레이너 정보를 조회할 trMemberVo를 호출
	TrainerVo trmembervo;
	

	@Override
	public void init() throws ServletException {
		orderdao = new OrderDAO();
		memberdao = new MemberDAO();

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);

	}

	protected void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 1) nController Option
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 한글 처리
		request.setCharacterEncoding("utf-8");
		// 웹브라우저로 응답할 데이터 종류 설정
		response.setContentType("text/html;charset=utf-8");
		// 웹브라우저와 연결된 출력 스트림 통로 만들기
		PrintWriter out = response.getWriter();
		// 서블릿으로 요청한 주소를 request에서 얻기
		String action = request.getPathInfo();
		// 2단계 요청주소 출력하기
		System.out.println("2단계 요청 주소: " + action);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 2) nController INFO
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// 1) /login.me <- "로그인" 요청
		// 1-1) /loginPro.me <- "로그인" 아이디 & 비밀번호 작성 후 로그인 버튼 요청
		// 1-2 /logout.me <- "로그아웃" 요청
		// 2) /joinCategory.me <- "회원 가입 유형" 선택 요청
		// 2-1) /memJoin.me <- "회원 가입 유형 " -> "일반 회원 가입" 선택시 요청
		// 2-2) /memJoinPro.me <- "회원 가입 " -> "일반 회원 가입" -> "회원 가입"요청
		// 3) /trJoin.me <- "회원 가입 유형 " -> "훈련사 회원 가입" 선택시 요청
		// 4) /change.me <- "회원 정보" 요청
		// 4-1) /delete.me <- "회원 정보 삭제" 요청
		// 4-2) /updateinfo.me <- "회원 정보 수정" 요청
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		// nextPage 변수 생성 및 초기화
		String nextPage = null;

		// # 1) "로그인" 버튼을 눌러 요청 했을 때,
		if (action.equals("/login.me")) {

			System.out.println("MemberController -> login.me 호출!");

			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/login.jsp");

			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";

			// # 1-1) "로그인" -> 아이디&비밀번호 입력 후 로그인 버튼을 요청 했을 때,
		} else if (action.equals("/loginPro.me")) {

			System.out.println("nbMemberController -> /loginPro.me 요청!");

			String login_id = request.getParameter("memLoginId");
			String login_pass = request.getParameter("memLoginPw");

			System.out.println(login_id);
			System.out.println(login_pass);
			// 요청한 값을 이용해 클라이언트의 웹브라우저로 응답할 값을 마련
			// 요약 : DB작업 등의 비즈니스로직처리
			// check변수에 저장되는 값이 1이면 아이디, 비밀번호 맞음
			// 0이면 아이디맞음, 비밀번호 틀림
			// -1이면 아이디 틀림
			int memCheck = memberdao.memCheck(login_id, login_pass);
			int Trcheck = memberdao.TrCheck(login_id, login_pass);

			
			
			if (memCheck == 0  && Trcheck == 0 ) {// 아이디 맞고 비밀번호 틀림
				out.println("<script>");
				out.println("window.alert('아이디 또는 비밀번호가 틀립니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				return;

			}else if(memCheck == 1  || Trcheck == 1 ) {
				
				
			}
			

			// check = 1 아이디 맞음, 비밀번호 맞음
			// 로그인 처리를 위해 session메모리 영역에 세션값 저장 후 포워딩

			// session메모리 생성
			HttpSession session = request.getSession();
			// session메모리에 입력한 아이디 바인딩 (저장)
			session.setAttribute("id", login_id);

			// 메인화면 view 주소
			nextPage = "/nbMain.jsp";

			// # 1-2) "로그아웃"을 요청 했을 때,
		} else if (action.equals("/logout.me")) {

			System.out.println("nbMemberController -> /logout.me 요청!");

			// 기존에 생성했던 session메모리 얻기
			HttpSession session_ = request.getSession();
			session_.invalidate(); // 세션에 저장된 아이디 제거

			// 메인화면 view 주소
			nextPage = "/nbMain.jsp";

			// # 2) "회원가입" 버튼을 눌러 요청 했을 때,
		} else if (action.equals("/joinCategory.me")) {

			System.out.println("MemberController -> joinCategory.me 호출!");

			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/joinCategory.jsp");

			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";

			// # 2-1) "회원가입" -> "일반회원가입" 버튼을 눌러 요청 했을 때,
		} else if (action.equals("/memJoin.me")) {

			System.out.println("MemberController -> memJoin.me 호출!");

			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/mem_join.jsp");

			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";

			// # 2-2) "회원가입" -> "일반회원가입" -> "회원 가입" 버튼을 눌러 요청 했을 때,
		} else if (action.equals("/memJoinPro.me")) {

			System.out.println("MemberController -> memJoinPro.me 호출!");

			String mem_id = request.getParameter("id");
			String mem_name = request.getParameter("name");
			String mem_nick = request.getParameter("nickname");
			String mem_pw = request.getParameter("pass");
			String mem_email = request.getParameter("email");
			String mem_hp = request.getParameter("hp");
			String mem_gender = request.getParameter("gender");
			String mem_birth = request.getParameter("birth");
			String mem_address1 = request.getParameter("address1");
			String mem_address2 = request.getParameter("address2");
			String mem_address3 = request.getParameter("address3");
			String mem_address4 = request.getParameter("address4");
			String mem_address5 = request.getParameter("address5");
			String mem_pet = request.getParameter("pet");

					 MemberVo mem_vo = new MemberVo();
					 mem_vo.setMem_id(mem_id);
					 mem_vo.setMem_name(mem_name);
					 mem_vo.setMem_nick(mem_nick);
					 mem_vo.setMem_pw(mem_pw);
					 mem_vo.setMem_email(mem_email);
					 mem_vo.setMem_hp(mem_hp);
					 mem_vo.setMem_gender(mem_gender);
					 mem_vo.setMem_birth(mem_birth);
					 mem_vo.setMem_address1(mem_address1);
					 mem_vo.setMem_address2(mem_address2);
					 mem_vo.setMem_address3(mem_address3);
					 mem_vo.setMem_address4(mem_address4);
					 mem_vo.setMem_address5(mem_address5);
					 mem_vo.setMem_pet(mem_pet);
					 
					 
			memberdao.insertMember(mem_vo);
//			memberdao.insertMemAddress(mem_vo);

			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";

			// # 3) "회원가입" -> "훈련사회원가입" 버튼을 눌러 요청 했을 때,
		} else if (action.equals("/trJoin.me")) {

			System.out.println("MemberController -> trJoin.me 호출!");

			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/tr_join.jsp");

			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";

			// # 3-1) "회원가입" -> "훈련사회원가입" -> "회원 가입" 버튼을 눌러 요청 했을 때,
		} else if (action.equals("/trJoinPro.me")) {

			System.out.println("MemberController -> trJoinPro.me 호출!");

			String tr_id = request.getParameter("id");
			String tr_name = request.getParameter("name");
			String tr_img = request.getParameter("imageFileName");
			String tr_pw = request.getParameter("pass");
			String tr_email = request.getParameter("email");
			String tr_hp = request.getParameter("hp");
			String tr_gender = request.getParameter("gender");
			String tr_birth = request.getParameter("birth");
			String tr_address1 = request.getParameter("address1");
			String tr_address2 = request.getParameter("address2");
			String tr_address3 = request.getParameter("address3");
			String tr_address4 = request.getParameter("address4");
			String tr_address5 = request.getParameter("address5");
					 TrainerVo tr_vo = new TrainerVo();
					  tr_vo.setTr_id(tr_id);
					  tr_vo.setTr_name(tr_name);
					  tr_vo.setTr_img(tr_img);
					  tr_vo.setTr_pw(tr_pw);
					  tr_vo.setTr_email(tr_email);
					  tr_vo.setTr_hp(tr_hp);
					  tr_vo.setTr_gender(tr_gender);
					  tr_vo.setTr_birth(tr_birth);
					  tr_vo.setTr_address1(tr_address1);
					  tr_vo.setTr_address2(tr_address2);
					  tr_vo.setTr_address3(tr_address3);
					  tr_vo.setTr_address4(tr_address4);
					  tr_vo.setTr_address5(tr_address5);
					  
			memberdao.insertTrMember(tr_vo);
//			memberdao.insertTrMemAddress(tr_vo);
					
			nextPage = "/nbMain.jsp";

			
			
			
			// # 4) "회원 정보"수정 요청 화면ㄴ 했을 때,
		} else if (action.equals("/change.me")) {
			
			HttpSession session = request.getSession();
			String memberid	= (String)session.getAttribute("id");
			
			System.out.println("MemberController -> change.me 호출!");
			MemberVo mem_vo = memberdao.memRead(memberid);
			
			TrainerVo tr_vo = memberdao.trRead(memberid);
			
			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/change.jsp");
			request.setAttribute("mem_vo", mem_vo);
			request.setAttribute("tr_vo", tr_vo);
			
			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";
			
			// # 4) "회원 정보" 요청 했을 때,
		} else if (action.equals("/info.me")) {
			
			HttpSession session = request.getSession();
			String memberid	= (String)session.getAttribute("id");
			
			System.out.println("MemberController -> info.me 호출!");
			MemberVo mem_vo = memberdao.memRead(memberid);
			
			TrainerVo tr_vo = memberdao.trRead(memberid);
			
			// 중앙화면 주소 바인딩
			request.setAttribute("center", "nbMember/info.jsp");
			request.setAttribute("mem_vo", mem_vo);
			request.setAttribute("tr_vo", tr_vo);
			
			// 전체 메인화면 주소 저장
			nextPage = "/nbMain.jsp";
			
			
			
			
			// # 4-1) "회원 정보 삭제" 요청 했을 때,
		} else if (action.equals("/delete.me")) {

			System.out.println("nbMemberController -> /delete.me 요청!");

			// 삭제할 아이디 값을 얻어와 변수에 저장
			HttpSession session = request.getSession();
			String deleteId	= (String)session.getAttribute("id");
			
			boolean mem_result = memberdao.memDelete(deleteId);
			boolean tr_result = memberdao.trDelete(deleteId);
			
			System.out.println("맴버 결과 : "+ mem_result);
			System.out.println("회원 결과 : "+ tr_result);
			if (mem_result == false || tr_result == false) {
				
				HttpSession session_ = request.getSession();
				session_.invalidate(); // 세션에 저장된 아이디 제거
				
				out.println("<script>");
				out.println("window.alert('회원탈퇴 되었습니다.');");
				out.println("location.href='/TeamProject/nbMain.jsp'");
				out.println("</script>");
		
				return;

			} else if (mem_result == true && tr_result == true) {
				
				return;

			}

			// # 4-2) "회원 정보 수정" 요청 했을 때,
		} else if (action.equals("/updateInfo.me")) {

			System.out.println("nbMemberController -> /updateInfo.me 요청!");
			
			String up_id = request.getParameter("id");
			String up_pw = request.getParameter("pass");
			String up_nick = request.getParameter("nickname");
			String up_hp = request.getParameter("hp");
			String up_email = request.getParameter("email");
			String up_img = request.getParameter("img");
			String up_address1 = request.getParameter("address1");
			String up_address2 = request.getParameter("address2");
			String up_address3 = request.getParameter("address3");
			String up_address4 = request.getParameter("address4");
			String up_address5 = request.getParameter("address5");

			int up_MemResult = memberdao.memUpdate(up_id, up_pw, up_nick, up_hp, up_email, up_img, up_address1, up_address2, up_address3, up_address4, up_address5);
		
			int up_TrResult = memberdao.trUpdate(up_id ,up_pw, up_hp, up_email, up_img, up_address1, up_address2, up_address3, up_address4, up_address5);

			if (up_MemResult == 0 && up_TrResult ==0 ) {
				out.println("<script>");
				out.println("window.alert('수정실패 하였습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				
				return;

			} else if (up_MemResult == 1 || up_TrResult == 1) {
				out.println("<script>");
				out.println("window.alert('정보를 수정하였습니다.');");
				out.println("location.href='/TeamProject/member/change.me'");
				out.println("</script>");				
				
				return;
			}	
				// 전체 메인화면 주소 저장
				nextPage = "/nbMain.jsp";

				
		} else if (action.equals("/joinIdCheck.me")) {
				//입력한 아이디 얻기
				String id = request.getParameter("id");
//				System.out.println(id);
				//입력한 아이디가 DB에 저장되어 있는지 중복 체크 작업
				//true -> 중복 , false -> 중복아님 둘중 하나를 반환 받음
				boolean memResult = memberdao.memCheck(id);
				boolean trResult = memberdao.trCheck(id);
				//아이디 중복결과를 다시 한번 확인 하여 조건값을
				//join.jsp파일과 연결된 join.js파일에 작성해 놓은
				//success:function의 data매개변수로 웹브라우저를 거쳐 보냅니다!
				if (memResult == true || trResult == true) {
					out.write("사용 불가");
					return;
				} else if (memResult == false && trResult == false) {
					out.write("사용 가능");
					return;
				}
			
		//펫 정보 등록 화면 요청
		} else if (action.equals("/petJoin.me")) {

			System.out.println("nbMemberController -> /petJoin.me 요청!");

			request.setAttribute("center", "nbMember/petJoin.jsp");

			// 메인화면 view 주소
			nextPage = "/nbMain.jsp";
		
		
			//펫 정보 요청화면
		} else if (action.equals("/petInfo.me")) {
			
			System.out.println("nbMemberController -> /petInfo.me 요청!");
			
			request.setAttribute("center", "nbMember/petInfo.jsp");
			
			// 메인화면 view 주소
			nextPage = "/nbMain.jsp";
		}

		// 포워딩 (디스패처 방식)
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);


	}
}
