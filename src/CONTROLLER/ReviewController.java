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
import DAO.ReviewDAO;
import VO.CommentVO;
import VO.FreeBoardVo;
import VO.LikeVo;
import VO.MemberVo;
import VO.ReviewVo;


// 게시판 관련 기능 요청이 들어오면 호출되는 사장님(컨트롤러)
@WebServlet("/review/*")
public class ReviewController extends HttpServlet {
  ReviewDAO reviewdao;
  MemberDAO memberdao;
  @Override
  public void init() throws ServletException {
    reviewdao = new ReviewDAO();
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
    String contextPath = request.getContextPath();
    // 조건에 따라서 포워딩 또는 보여줄 VIEW주소 경로를 저장할 변수
    String nextPage = null;
    // 요청한 중앙화면 뷰 주소를 저장할 변수
    String center = null;
    ArrayList list = null;
    ReviewVo vo =null;
    
    HttpSession session = request.getSession();
    PrintWriter out = response.getWriter();

    switch (action) {
      // 새글 입력하는 화면 요청!
//========================글 목록을 가져올 /list.fb ================================
      case "/list.rv":
        
        list = reviewdao.reviewListAll();
        
        request.setAttribute("center", "nbBoard/reviewList.jsp");
        request.setAttribute("list", list);

        nextPage = "/nbMain.jsp";
        break;
//========================글 작성하기 ================================
      case "/write.rv":

        request.setAttribute("center", "nbBoard/reviewWrite.jsp");
        nextPage = "/nbMain.jsp";
        break;
//========================글 작성하기 ================================
//========================글을  작성하는 작업/writePro.fb =============================
      case "/reviewWritePro.rv":
//      //요청한 값 얻기
      
//      //세션값으로 아이디 + 닉네임을 구할 것입니다.
//        HttpSession session = request.getSession();
        String memberid   = (String)session.getAttribute("id");
        String nickname = memberdao.getMemNickName(memberid);
        
      
//      //업로드 작업 중...
      String directory = request.getServletContext().getRealPath("reviewUpload");
      
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
      

      vo= new ReviewVo();
      vo.setId(memberid);
      vo.setImg(fileName);
      vo.setImgRealName(fileRealName);
      vo.setTitle(title);
      vo.setContext(content);
      int result = reviewdao.insertReview(vo);
      System.out.println(result);
      
      out = response.getWriter();
      out.print("<script>");
      out.print(" alert( '" +result+" 글 추가 성공!' );");
      out.print(" location.href='"+ contextPath +"/review/list.rv'");
      out.print("</script>");
      
       return;
//========================글을  작성하는 작업/writePro.fb =============================
       
//========================QNA================================
      case "/qna.bo":
    	  String pageChange = request.getParameter("pageChange");
    	  request.setAttribute("pageChange", pageChange);
        request.setAttribute("center", "/nbBoard/QnA.jsp");
        nextPage = "/nbMain.jsp";
        break;
//========================QNA================================
        
      default:
        break;
    }

    // 포워딩 (디스패처 방식)
    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
    dispatch.forward(request, response);
  }

}