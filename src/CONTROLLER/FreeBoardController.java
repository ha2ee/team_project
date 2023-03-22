package CONTROLLER;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
  CommentVO commentvo;

//   MemberDAO객체를 저장할 참조변수 선언
   MemberDAO memberdao;

  // MemberVo객체를 저장할 참조변수 선언
//   MemberVo membervo;

  @Override
  public void init() throws ServletException {
    boarddao = new FreeBoardDAO();
     memberdao = new MemberDAO();
    // membervo = new MemberVo();
    commentvo = new CommentVO();
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
    // BoardVo객체를 저장할 참조변수 선언
    FreeBoardVo vo = null;
    ArrayList list = null;
    // int count = 0;
    // String key = null;
    // String word = null;
    // String memberid = null;
    int count = 0;
    HttpSession session = request.getSession();

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

        request.setAttribute("center", "nbBoard/write.jsp");
        nextPage = "/nbMain.jsp";
        break;
//========================글을 작성하는 페이지/write.fb ===============================
//========================글을  작성하는 작업/writePro.fb =============================
      case "/writePro.fb":
//      //요청한 값 얻기
        String memberid   = (String)session.getAttribute("id");
        String nickname = memberdao.getMemNickName(memberid);
        
      
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
      String fileRealName = multipartRequest.getFilesystemName("fileName");
//      //여기까지
      

      vo= new FreeBoardVo();
      vo.setB_id(memberid);
      vo.setB_nickname(nickname);
      vo.setB_title(title);
      vo.setB_content(content);
      vo.setB_file(fileName);
      vo.setB_realfile(fileRealName);
      int result = boarddao.insertBoard(vo);
      
      PrintWriter out = response.getWriter();
      out.print("<script>");
      out.print(" alert( '" +result+" 글 추가 성공!' );");
      out.print(" location.href='"+ contextPath +"/freeboard/list.fb?nowPage=0&nowBlock=0'");
      out.print("</script>");
      
      return;
//========================글을  작성하는 작업/writePro.fb =============================
//====================게시글 한 줄 클릭시 글을 읽는 /read.fb =========================
      case "/read.fb":
        nowBlock = request.getParameter("nowBlock");
        nowPage = request.getParameter("nowPage");
        // //요청한 값 얻기
        int b_idx = Integer.parseInt(request.getParameter("b_idx"));
        // //글 번호 (b_idx)를 이용해 수정 또는 삭제를 위해 DB로 부터 조회하기
        vo = boarddao.boardRead(b_idx);
        list = boarddao.boardListAll();
        count = boarddao.getTotalRecord();
//        HttpSession session = request.getSession();
        
        // 댓글 목록 가져오기
        CommentDAO commnetdao = new CommentDAO();
        ArrayList<CommentVO> clist = commnetdao.listComment(b_idx);
        
        memberid   = (String)session.getAttribute("id");
        System.out.println(memberid);
        
        String likeCheck = boarddao.checkLikeBeforeRead(memberid,b_idx);
        System.out.println(likeCheck);
        
        request.setAttribute("clist", clist);
        request.setAttribute("count", count);
        request.setAttribute("list", list);
        request.setAttribute("vo", vo);
        request.setAttribute("likeCheck", likeCheck);
        request.setAttribute("center", "nbBoard/read.jsp");
        request.setAttribute("nowBlock", nowBlock);
        request.setAttribute("nowPage", nowPage);

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
        String id3 = request.getParameter("id");

        int result1 = boarddao.checkLike(id3, b_idx2);
        // int result2 = boarddao.getOnlyLikeCount(b_idx2); //FREE_BOARD에서 좋아요 다시 조회 //안먹히네
        // int result2 = boarddao.getOnlyLikeCount(b_idx2);

        PrintWriter out2 = response.getWriter();
        if (result1 == 1) {// 1이면 이미 테이블에 있다 == 이미 좋아요를 눌렀다.
          System.out.println("이미 있네요...삭제할게요~ ㅋㅋ");
          boarddao.deleteLike(id3, b_idx2);
          int result3 = boarddao.getOnlyLikeCount(b_idx2);
          out2.print(result3);
        
        } else { // 테이블에 없다면?
          boolean result2 = boarddao.insertLikeBoard(b_idx2, id3);
          if (result2 == true) {
            int result4 = boarddao.getOnlyLikeCount(b_idx2);
            out2.print(result4);
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
        vo.setB_title(title1);
        vo.setB_content(content1);
        vo.setB_file(fileName1);
        vo.setB_realfile(fileRealName1);
        
        int result2 = boarddao.modifyOnePro(vo);
        PrintWriter out3 = response.getWriter();

        if(result2 ==1) {
          out3.println("<script>");
          out3.println("alert('수정 성공!')");
          out3.println("</script>");
        } else {
          out3.println("<script>");
          out3.println("alert('수정 실패!')");
          out3.println("</script>");
        }
         nextPage = "/freeboard/list.fb";
         break;
//=====================게시글 수정 버튼 클릭시 /modify.fb ==========================
//=====================게시글 삭제 버튼 클릭시 /del.fb ==========================
      case "/del.fb":
        int idx1 = Integer.parseInt( request.getParameter("b_idx")  );
        int result3 = boarddao.deleteOne(idx1);
        PrintWriter out4 = response.getWriter();
        if(result3 == 1) {
          out4.println(1);
        } else {
          out4.println(0);
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
  		
  		session = request.getSession();
  		
  		commentvo.setId(session.getAttribute("id").toString()); // 댓글 작성자 아이디(= 로그인한 사람 세션)
//  		String testUser = "admin";
//  		commentvo.setId(testUser);
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
//=====================댓글 수정 버튼 클릭시 /upcomment.do ==========================       
      case "/upcomment.do":
    	// 1. 데이터 가져오기 (seq, pseq)
    		String up_idx = request.getParameter("b_idx"); // 보고있던 글번호(= 작성중인 댓글의 부모 글번호)
    		String seq = request.getParameter("seq2"); // 수정할 댓글번호
    		String comment = request.getParameter("commupdate");
    		
    		// 2. DB 작업 > DAO 위임 > update
    		CommentDAO commentdao1 = new CommentDAO();
    		 
    		commentvo.setSeq(seq);
    		commentvo.setPseq(up_idx);
    		commentvo.setContent(comment);
    		int u_result = commentdao1.upComment(commentvo); // 1, 0	
    		
    		
    		
    		// 3. 결과 후 처리
    		if (u_result == 1) {
    			response.sendRedirect("/TeamProject/freeboard/read.fb?b_idx=" + up_idx); //보고 있던 글번호를 가지고 돌아가기
   			return;
    		} else {
    			
    			response.setCharacterEncoding("UTF-8");
    			
    			PrintWriter writer = response.getWriter();			
    			
    			writer.print("<html>");
    			writer.print("<body>");
    			writer.print("<script>");
    			writer.print("alert('댓글 수정 실패');");
    			writer.print("history.back();");
    			writer.print("</script>");
    			writer.print("</body>");
    			writer.print("</html>");
    			
    			writer.close();
    			
    			return ;
    		}
        
//끝=====================댓글 수정 버튼 클릭시 /upcomment.do ========================== 
    	  
        
//=====================댓글 삭제 버튼 클릭시 /delcomment.do ==========================    	  
      case "/delcomment.do":  
    	// 1. 데이터 가져오기 (seq, pseq)
  		String del_idx = request.getParameter("pseq"); // 보고있던 글번호(= 작성중인 댓글의 부모 글번호)
  		String d_seq = request.getParameter("seq"); // 삭제할 글번호
  		
  		// 2. DB 작업 > DAO 위임 > delete
  		CommentDAO commentdao2 = new CommentDAO();
  		
  		int d_result = commentdao2.delComment(d_seq); // 1, 0		
  		
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
    	  
      case "/download.fb":
        
        int idx2 = Integer.parseInt(request.getParameter("idx"));
        vo = boarddao.modifyOne(idx2);
        String fileName11 = vo.getB_realfile();
        System.out.println(fileName11);
        
        String directory1 = this.getServletContext().getRealPath("/upload/");
        File file = new File(directory1 + "/" + fileName11);
        
        String mimeType = getServletContext().getMimeType(file.toString());
        
        if(mimeType ==null) {
          response.setContentType("application/octet-stream");
        }
        
        String downloadName = null;
        if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
          downloadName = new String(fileName11.getBytes("utf-8"),"8859_1");
        } else {
          downloadName = new String(fileName11.getBytes("EUC-KR"),"8859_1");
        }
        response.setHeader("content-Disposition", "attachment;fileName=\""+downloadName + "\";");
        
        FileInputStream fileInputStream = new FileInputStream(file);
        ServletOutputStream servletOutputStream = response.getOutputStream();
        
        
        byte b[] = new byte[1024];
        int data= 0;
        
        while( (data= (fileInputStream.read(b,0,b.length))) != -1   ) {
          servletOutputStream.write(b,0,data);
        }
        
        servletOutputStream.flush();
        servletOutputStream.close();
        fileInputStream.close();
        return;
  		
      default:
        break;
    }

    // 포워딩 (디스패처 방식)
    RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
    dispatch.forward(request, response);
  }

}