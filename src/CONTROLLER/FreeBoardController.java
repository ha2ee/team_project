package CONTROLLER;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.CommentDAO;
import DAO.FreeBoardDAO;
import DAO.MemberDAO;
import VO.CommentVO;
import VO.FreeBoardVo;
import VO.LikeVo;
import VO.MemberVo;


// 게시판 관련 기능 요청이 들어오면 호출되는 사장님(컨트롤러)
@WebServlet("/freeboard/*")
public class FreeBoardController extends HttpServlet {

  // FreeBoardDAO객체를 저장할 참조변수 선언
  FreeBoardDAO boarddao;

  // MemberDAO객체를 저장할 참조변수 선언
  // MemberDAO memberdao;

  // MemberVo객체를 저장할 참조변수 선언
  // MemberVo membervo;

  @Override
  public void init() throws ServletException {
    boarddao = new FreeBoardDAO();
    // memberdao = new MemberDAO();
    // membervo = new MemberVo();
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
//=======================doHandle 시작===========================================
  private void doHandle(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 한글처리
    request.setCharacterEncoding("utf-8");
    // 웹브라우저로 응답할 데이터 종류 설정
    response.setContentType("text/html;charset=utf-8");
    // 웹브라우저와 연결된 출력 스트림 통로 만들기
    // PrintWriter out = response.getWriter();
    // 서블릿으로 요청한 주소를 request에서 얻기
    String action = request.getPathInfo();// 2단계 요청 주소
    System.out.println("요청한  주소 : " + action);

    // 조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
    String nextPage = null;
    // 요청한 중앙화면 뷰 주소를 저장할 변수
    String center = null;
    // BoardVo객체를 저장할 참조변수 선언
    FreeBoardVo vo = null;
    ArrayList list = null;
    // int count = 0;
    // String key = null;
    // String word = null;
    // String memberid = null;
    int count = 0;

    PrintWriter out = response.getWriter();

    switch (action) {
      // 새글 입력하는 화면 요청!
//========================글 목록을 가져올 /list.fb ================================
      case "/list.fb":
        // session = request.getSession();
        // String loginid = (String)session.getAttribute("id");

        String nowPage = request.getParameter("nowPage");
        String nowBlock = request.getParameter("nowBlock");

        request.setAttribute("nowPage", nowPage);
        request.setAttribute("nowBlock", nowBlock);

        list = boarddao.boardListAll();
        count = boarddao.getTotalRecord();
        request.setAttribute("count", count);
        request.setAttribute("list", list);
        request.setAttribute("center", "nbBoard/list.jsp");

        nextPage = "/nbMain.jsp";
        break;
//========================글 목록을 가져올 /list.fb ================================
//========================글을 작성하는 페이지/write.fb ===============================
      case "/write.fb":

        // String unknown = request.getParameter("gildong");
        // //새글을 입력하는 화면에 로그인한 회원의 이름, 아이디, 이메일을 보여주기 위해
        // //member테이블에서 SELECT하여 가져와야 합니다.
        // HttpSession session = request.getSession();
        // memberid = (String)session.getAttribute("id");
        //
        request.setAttribute("center", "nbBoard/write.jsp");
        nextPage = "/nbMain.jsp";
        break;
//========================글을 작성하는 페이지/write.fb ===============================
//========================글을  작성하는 작업/writePro.fb =============================
      case "/writePro.fb":
//      //요청한 값 얻기
      
//      //세션값으로 아이디 + 닉네임을 구할 것입니다.
      String id = "inseop";
      String nickname = "seeeop2";
      
//      //업로드 작업 중...
      String directory = request.getServletContext().getRealPath("upload");
      
      File dir = new File(directory);
      if (!dir.exists()) dir.mkdirs();
      
      System.out.println(directory);
      int maxSize = 1024 * 1024 * 100;
      String encoding = "utf-8";
//      
      MultipartRequest multipartRequest = new MultipartRequest(request, directory,maxSize,encoding,new DefaultFileRenamePolicy());
      String title = multipartRequest.getParameter("title");
      String content = multipartRequest.getParameter("editor1");
      String fileName = multipartRequest.getOriginalFileName("fileName");
      String fileRealName = multipartRequest.getFilesystemName("file");
//      //여기까지
      

      vo= new FreeBoardVo();
      vo.setB_id(id);
      vo.setB_nickname(nickname);
      vo.setB_title(title);
      vo.setB_content(content);
      vo.setB_file(fileName);
      vo.setB_realfile(fileRealName);
      int result = boarddao.insertBoard(vo);
      
      if(result ==1) {
        out.println("<script>");
        out.println("alert('작성 성공!')");
        out.println("</script>");
      } else {
        out.println("<script>");
        out.println("alert('작성 실패!')");
        out.println("</script>");
      }
       nextPage = "/freeboard/list.fb";
       
       break;
//========================글을  작성하는 작업/writePro.fb =============================
//====================게시글 한 줄 클릭시 글을 읽는 /read.fb =========================
      case "/read.fb":
        // //요청한 값 얻기
        int b_idx = Integer.parseInt(request.getParameter("b_idx"));
        // //글 번호 (b_idx)를 이용해 수정 또는 삭제를 위해 DB로 부터 조회하기
        vo = boarddao.boardRead(b_idx);
        list = boarddao.boardListAll();
        count = boarddao.getTotalRecord();
        
        // 댓글 목록 가져오기
        CommentDAO commnetdao = new CommentDAO();
        ArrayList<CommentVO> clist = commnetdao.listComment(b_idx);
        
        request.setAttribute("clist", clist);
        request.setAttribute("count", count);
        request.setAttribute("list", list);
        request.setAttribute("vo", vo);
        request.setAttribute("center", "nbBoard/read.jsp");

        nextPage = "/nbMain.jsp";
        break;
//====================게시글 한 줄 클릭시 글을 읽는 /read.fb =========================
//====================검색 결과를 가져올 /searchlist.fb =========================
      case "/searchlist.fb":

        // //요청한 값 얻기 (검색을 위해 선택한 option의 값 하나, 입력한 검색어)
        String key = request.getParameter("key");
        String word = request.getParameter("word");
        System.out.println("key : " + key);
        System.out.println("word : " + word);

        // //요청한 값을 이용해 응답할 값 마련(글 조회)
        list = boarddao.boardList(key, word);
        count = boarddao.getTotalRecord(key, word);
        System.out.println("list : " + list);
        System.out.println("count : " + count);
        
        request.setAttribute("center", "nbBoard/list.jsp");
        request.setAttribute("list", list);
        request.setAttribute("count", count);
        
        nextPage = "/nbMain.jsp";
        break;
//====================검색 결과를 가져올 /searchlist.fb =========================
//=======================좋아요 버튼 클릭시 /like.fb ============================
      case "/like.fb":

        int b_idx2 = Integer.parseInt(request.getParameter("b_idx"));
        String id3 = request.getParameter("id2");

        int result1 = boarddao.checkLike(id3, b_idx2);
        // int result2 = boarddao.getOnlyLikeCount(b_idx2); //FREE_BOARD에서 좋아요 다시 조회 //안먹히네
        // int result2 = boarddao.getOnlyLikeCount(b_idx2);
        
        if (result1 == 1) {// 1이면 이미 테이블에 있다 == 이미 좋아요를 눌렀다.
          System.out.println("이미 있네요...삭제할게요~ ㅋㅋ");
          boarddao.deleteLike(id3, b_idx2);
          int result3 = boarddao.getOnlyLikeCount(b_idx2);
          out.print(result3);
        
        } else { // 테이블에 없다면?
          boolean result2 = boarddao.insertLikeBoard(b_idx2, id3);
          if (result2 == true) {
            int result4 = boarddao.getOnlyLikeCount(b_idx2);
            out.print(result4);
            System.out.println("like투입성공");
          } else {
            System.out.println("like투입실패");
          }
        }

        return;
//=======================좋아요 버튼 클릭시 /like.fb ============================
//=====================게시글 수정 버튼 클릭시 /modify.fb ==========================
      case "/modify.fb":
        int b_idx1 = Integer.parseInt( request.getParameter("b_idx") );
        FreeBoardVo vo1 = boarddao.modifyOne(b_idx1);
        
        request.setAttribute("vo", vo1);
        request.setAttribute("center", "nbBoard/writeModify.jsp");
        
        nextPage = "/nbMain.jsp";
        break;
//=====================게시글 수정 버튼 클릭시 /modify.fb ==========================
//=====================게시글 수정 버튼 클릭시 /modify.fb ==========================
      case "/modifyPro.fb":
        String id1 = "inseop";
        String nickname1 = "seeeop2";
        
//        //업로드 작업 중ㅇ...
        String directory2 = request.getServletContext().getRealPath("upload");
        
        dir = new File(directory2);
        if (!dir.exists()) dir.mkdirs();
                int maxSize1 = 1024 * 1024 * 100;
        String encoding1 = "utf-8";
//        
        MultipartRequest multipartRequest1 = new MultipartRequest(request, directory2,maxSize1,encoding1,new DefaultFileRenamePolicy());
        String title1 = multipartRequest1.getParameter("title");
        String content1 = multipartRequest1.getParameter("editor1");
        String fileName1 = multipartRequest1.getOriginalFileName("fileName");
        String fileRealName1 = multipartRequest1.getFilesystemName("file");
        int idx =  Integer.parseInt( multipartRequest1.getParameter("b_idx") );
//        //여기까지
        

        vo= new FreeBoardVo();
        vo.setB_idx(idx);
        vo.setB_id(id1);
        vo.setB_nickname(nickname1);
        vo.setB_title(title1);
        vo.setB_content(content1);
        vo.setB_file(fileName1);
        vo.setB_realfile(fileRealName1);
        
        int result2 = boarddao.modifyOnePro(vo);
        
        if(result2 ==1) {
          out.println("<script>");
          out.println("alert('수정 성공!')");
          out.println("</script>");
        } else {
          out.println("<script>");
          out.println("alert('수정 실패!')");
          out.println("</script>");
        }
         nextPage = "/freeboard/list.fb";
         break;
//=====================게시글 수정 버튼 클릭시 /modify.fb ==========================

//=====================게시글 삭제 버튼 클릭시 /del.fb ==========================
      case "/del.fb":
        int idx1 = Integer.parseInt( request.getParameter("b_idx")  );
        int result3 = boarddao.deleteOne(idx1);
        
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
//=====================게시글 삭제 버튼 클릭시 /del.fb ==========================

        
//=====================댓글 작성 버튼 클릭시 /addcomment.do ==========================       
      case "/addcomment.do":
    	// 1. 데이터 가져오기(content, pseq)
  		String pseq = request.getParameter("pseq"); // 보고있던 글번호(= 작성중인 댓글의 부모 글번호)
  		String c_content = request.getParameter("content");
  		
  		// 2. DB 작업 > DAO 위임 > insert
  		CommentDAO dao = new CommentDAO();
  		CommentVO commentvo = new CommentVO();
  		
 		HttpSession session = request.getSession();
		
 		commentvo.setId(session.getAttribute("id").toString()); // 댓글 작성자 아이디(= 로그인한 사람 세션)
  	//	String testUser = "admin";
  	//	commentvo.setId(testUser);
  		commentvo.setPseq(pseq);
  		commentvo.setContent(c_content);
  		
  		int c_result = dao.addComment(commentvo); // 1, 0		
  		
  		// 3. 돌아가기 > read.fb?b_idx=
  		if (c_result == 1) {
  	        
  	        nextPage = "/freeboard/read.fb?b_idx="+pseq;
  			
  		} else {
  			
  			response.setCharacterEncoding("UTF-8");
  			
  			PrintWriter writer = response.getWriter();			
  			
  			writer.print("<html>");
  			writer.print("<body>");
  			writer.print("<script>");
  			writer.print("alert('댓글 쓰기 실패');");
  			writer.print("history.back();");
  			writer.print("</script>");
  			writer.print("</body>");
  			writer.print("</html>");
  			
  			writer.close();
  		}
    	  
    	  break;
        
//=====================댓글 작성 버튼 클릭시 /addcomment.do ==========================               
        
//=====================댓글 삭제 버튼 클릭시 /delcomment.do ==========================    	  
      case "/delcomment.do":  
    	// 1. 데이터 가져오기 (seq, pseq)
  		String del_idx = request.getParameter("pseq"); // 보고있던 글번호(= 작성중인 댓글의 부모 글번호)
  		String seq = request.getParameter("seq"); // 삭제할 글번호
  		
  		// 2. DB 작업 > DAO 위임 > delete
  		CommentDAO commentdao = new CommentDAO();
  		
  		int d_result = commentdao.delComment(seq); // 1, 0		
  		
  		// 3. 결과 후 처리
  		if (d_result == 1) {
  			response.sendRedirect("/TeamProject/freeboard/read.fb?b_idx=" + del_idx); //보고 있던 글번호를 가지고 돌아가기
 			return;
  		} else {
  			
  			response.setCharacterEncoding("UTF-8");
  			
  			PrintWriter writer = response.getWriter();			
  			
  			writer.print("<html>");
  			writer.print("<body>");
  			writer.print("<script>");
  			writer.print("alert('댓글 삭제 실패');");
  			writer.print("history.back();");
  			writer.print("</script>");
  			writer.print("</body>");
  			writer.print("</html>");
  			
  			writer.close();
  			return;
  		}
    	  
//=====================댓글 삭제 버튼 클릭시 /delcomment.do ==========================     	  
    	  
      default:
        break;
    }

    // 포워딩 (디스패처 방식)
    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
    dispatch.forward(request, response);
  }

}