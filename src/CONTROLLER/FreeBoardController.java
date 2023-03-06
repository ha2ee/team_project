package CONTROLLER;

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
import DAO.FreeBoardDAO;
import DAO.MemberDAO;
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
      
//      //업로드 작업 중ㅇ...
      String directory ="C:\\Users\\hutos\\OneDrive\\Desktop\\upload";
      System.out.println(directory);
      int maxSize = 1024 * 1024 * 100;
      String encoding = "utf-8";
//      
      MultipartRequest multipartRequest = new MultipartRequest(request, directory,maxSize,encoding,new DefaultFileRenamePolicy());
      System.out.println("오니?");
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

      default:
        break;
    }

    // 포워딩 (디스패처 방식)
    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
    dispatch.forward(request, response);
  }

}