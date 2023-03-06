package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.FreeBoardVo;
import VO.LikeVo;


public class FreeBoardDAO {
  Connection con;
  PreparedStatement pstmt;
  ResultSet rs;
  DataSource ds;

  public FreeBoardDAO() {
    try {
      Context ctx = new InitialContext();
      ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/oracle");

    } catch (Exception e) {
      System.out.println("DB연결 실패! - " + e);
    }
  }

  // 자원해제 기능
  private void closeResource() {
    if (con != null)
      try {
        con.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    if (pstmt != null)
      try {
        pstmt.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
    if (rs != null)
      try {
        rs.close();
      } catch (Exception e) {
        e.printStackTrace();
      }
  }
//=========================기본적으로 필요한 부분====================================
//======================글 번호를 기준으로 조회======================================
  public ArrayList boardListAll() {
    ArrayList list = new ArrayList();
    FreeBoardVo vo;
    try {
      con = ds.getConnection();

      String sql = "SELECT * FROM FREE_BOARD order by b_idx desc";

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        vo = new FreeBoardVo(rs.getInt("b_idx"), rs.getString("b_id"), rs.getString("b_nickname"),
            rs.getString("b_title"), rs.getString("b_content"), rs.getDate("b_date"),
            rs.getInt("b_cnt"), rs.getString("b_file"),rs.getString("b_realfile") ,rs.getInt("b_like"));
        list.add(vo);
      }

    } catch (Exception e) {
      System.out.println("boardListAll 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return list;
  }
//======================글 번호를 기준으로 조회======================================
//======================모든 게시글의 수를 조회======================================
  public int getTotalRecord() {
    int count = 0;
    try {
      con = ds.getConnection();

      String sql = "SELECT COUNT(*) FROM FREE_BOARD";

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        count = rs.getInt(1);
      }

    } catch (Exception e) {
      System.out.println("getTotalRecord 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }

    return count;
  }
//======================모든 게시글의 수를 조회======================================
//======================특정 글 번호로 글 정보 조회===================================
  public FreeBoardVo boardRead(int b_idx) {
    FreeBoardVo vo = null;

    try {
      con = ds.getConnection();
      //조회수 부터 +1 한다.
      String sql = "UPDATE FREE_BOARD SET B_CNT = B_CNT + 1 WHERE B_IDX=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx);
      pstmt.executeUpdate();
      
      //업데이트 된 조회수를 포함한 글을 읽어온다
      sql = "SELECT * FROM FREE_BOARD WHERE B_IDX=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx);
      rs = pstmt.executeQuery();

      if (rs.next()) {
        vo = new FreeBoardVo();

        vo.setB_idx(rs.getInt("b_idx"));
        vo.setB_id(rs.getString("b_id"));
        vo.setB_nickname(rs.getString("b_nickname"));
        vo.setB_title(rs.getString("b_title"));
        vo.setB_content(rs.getString("b_content"));
        vo.setB_date(rs.getDate("b_date"));
        vo.setB_cnt(rs.getInt("b_cnt"));
        vo.setB_file(rs.getString("b_file"));
        vo.setB_like(rs.getInt("b_like"));

      }
      
      


    } catch (Exception e) {
      System.out.println("boardRead 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }


    return vo;
  }
//======================특정 글 번호로 글 정보 조회===================================
//============================특정 글 검색=========================================
  public ArrayList boardList(String key, String word) {

    String sql = null;

    ArrayList list = new ArrayList();

    if (!word.equals("")) {// 검색어를 입력했다면 ?

      if (key.equals("titleContent")) {// 검색 기준값 제목+내용을 선택했다면 ?

        sql = "select * from free_board " + " where b_title like '%" + word + "%' "
            + " or b_content like '%" + word + "%' order by b_idx asc";
      } else {// 검색 기준값 작성자를 선택했다면?

        sql = "select * from free_board where b_nickname like '%" + word + "%' order by b_idx asc";
      }

    } else {// 검색어를 입력하지 않았다면?
      // 모든 글 조회
      // 조건 -> b_idx열의 글번호 데이터들을 기준으로 해서 내림 차순으로 정렬 후 조회!
      sql = "select * from free_board order by b_idx asc";

      // 참고. 정렬 조회 -> order by 정렬기준열 desc(내림차순) 또는 asc(오름차순)
    }

    try {
      con = ds.getConnection();
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      // 조회된 Result의 정보를 한행 단위로 꺼내서
      // BoardVo객체에 한행씩 저장 후 BoardVo객체들을 ArrayList배열에 하나씩 추가해서 저장
      while (rs.next()) {
        FreeBoardVo vo = new FreeBoardVo(
                              rs.getInt("b_idx"), 
                              rs.getString("b_id"),
                              rs.getString("b_nickname"), 
                              rs.getString("b_title"), 
                              rs.getString("b_content"), 
                              rs.getDate("b_date"), 
                              rs.getInt("b_cnt"), 
                              rs.getString("b_file"), 
                              rs.getString("b_realfile"),
                              rs.getInt("b_like")
                                         );
        list.add(vo);
      }
      System.out.println("음...." + list);

    } catch (Exception e) {
      System.out.println("boardList 메소드 내부에서 오류!");
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return list;
  }
//============================특정 글 검색=========================================
//=================특정 글 검색 후 목록에 나타낼 게시글 수==============================
  public int getTotalRecord(String key, String word) {
    String sql = null;
    
    //조회된 글의 글수 저장
    int total = 0;
    
    if(!word.equals("")) {//검색어를 입력했다면?
      
      if(key.equals("titleContent")) {//검색기준값  제목+내용을 선택했다면? 
      
        sql = "select count(*) as cnt from free_board "
          + " where b_title like '%"+ word + "%' or"
              + " b_content like '%"+ word+"%'";
      
      }else {//"name" 검색기준값 작성자를 선택했다면?
      
        sql = "select count(*) as cnt from free_board "
          + " where b_name like '%"+ word + "%'";       
      }
      
    }else {//검색어 입력 안했아면?
      
      sql = "select count(*) as cnt from free_board";
    }
      
    try {
      con = ds.getConnection();
      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      rs.next();
      total = rs.getInt("cnt");
       
    }catch (Exception e) {
      System.out.println("getTotalRecord메소드에서 오류");
      e.printStackTrace();
    }finally {
      closeResource();
    }
  
    return total;
  }
//=================특정 글 검색 후 목록에 나타낼 게시글 수==============================
//========================좋아요 수 몇개인지 확인=====================================
  public int checkLike(String sessionId, int b_idx) {
    int result = 0;
    try {
      con = ds.getConnection();

      String sql = "SELECT * FROM LIKE_TABLE WHERE FREEBOARD_B_ID= ? AND FREEBOARD_B_IDX = ? ";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, sessionId);
      pstmt.setInt(2, b_idx);

      rs = pstmt.executeQuery();

      if (rs.next()) {
        result = 1;
      }


    } catch (Exception e) {
      System.out.println("checkLike 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }

    return result;
  }
//========================좋아요 수 몇개인지 확인=====================================
//========================좋아요 눌렀을 시 like_board에 행 삽입=======================
  public boolean insertLikeBoard(int b_idx2, String id3) {
    boolean result = false;

    try {
      con = ds.getConnection();

      String sql = "INSERT INTO LIKE_TABLE VALUES(LIKE_BOARD_SEQ.NEXTVAL,?,?,1)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, id3);
      pstmt.setInt(2, b_idx2);

      pstmt.executeUpdate();

      sql = "UPDATE FREE_BOARD SET B_LIKE = B_LIKE + 1 WHERE B_IDX=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx2);

      int insertOrNot = pstmt.executeUpdate();
      if (insertOrNot == 1) {
        result = true;
      }

    } catch (Exception e) {
      System.out.println("checkLike 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }

    return result;
  }
//========================좋아요 눌렀을 시 like_board에 행 삽입=======================
//=================해당 글 좋아요 수를 버튼 옆에 표시하기 위해 좋아요 수 조회=================
  public int getOnlyLikeCount(int b_idx2) {
    int result = 0;
    FreeBoardVo vo = null;
    try {
      con = ds.getConnection();

      String sql = "SELECT COUNT(*) FROM LIKE_TABLE WHERE FREEBOARD_B_IDX = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx2);

      rs = pstmt.executeQuery();

      if (rs.next()) {
      }
      result = rs.getInt(1);

    } catch (Exception e) {
      System.out.println("checkLike 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return result;
  }
//=================해당 글 좋아요 수를 버튼 옆에 표시하기 위해 좋아요 수 조회=================
//====================좋아요 버튼 눌렀을 시, like_board에서 행 삭제 ====================
  public void deleteLike(String id3, int b_idx2) {

    try {
      con = ds.getConnection();

      String sql = "DELETE FROM LIKE_TABLE WHERE FREEBOARD_B_IDX=? AND FREEBOARD_B_ID=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx2);
      pstmt.setString(2, id3);
      pstmt.executeUpdate();


      sql = "UPDATE FREE_BOARD SET B_LIKE = B_LIKE - 1 WHERE B_IDX=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, b_idx2);
      pstmt.executeUpdate();

    } catch (Exception e) {
      System.out.println("deleteLike 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
  }//deleteLike 끝
//====================좋아요 버튼 눌렀을 시, like_board에서 행 삭제 ====================
//====================write.jsp에서 글을 작성한 뒤, 테이블에 담는다. ====================
  public int insertBoard(FreeBoardVo vo) {
    int result = 0 ;
    try {
      con = ds.getConnection();
      
      String sql = "INSERT INTO FREE_BOARD VALUES(FREEBOARD_SEQ.NEXTVAL,?,?,?,?,SYSDATE,0,?,?,0)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, vo.getB_id());
      pstmt.setString(2, vo.getB_nickname());
      pstmt.setString(3, vo.getB_title());
      pstmt.setString(4, vo.getB_content());
      pstmt.setString(5, vo.getB_file());
      pstmt.setString(6, vo.getB_realfile());
      result = pstmt.executeUpdate();
      System.out.println(result);
      
    } catch (Exception e) {
      System.out.println("insertBoard 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    
    return result;
  }
//====================write.jsp에서 글을 작성한 뒤, 테이블에 담는다. ====================
}
