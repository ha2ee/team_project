package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.CommentVO;
import VO.FreeBoardVo;
import VO.LikeVo;
import VO.ReviewVo;


public class ReviewDAO {
  Connection con;
  PreparedStatement pstmt;
  ResultSet rs;
  DataSource ds;

  public ReviewDAO() {
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
//============================목록 불러오기=======================================
  public ArrayList reviewListAll() {
    ArrayList list = new ArrayList();
    ReviewVo vo = null;
    try {
      con = ds.getConnection();

      String sql = "SELECT * FROM REVIEW order by idx desc";

      pstmt = con.prepareStatement(sql);
      rs = pstmt.executeQuery();
      while (rs.next()) {
        vo = new ReviewVo();
        vo.setIdx(rs.getInt("idx"));
        vo.setId(rs.getString("id"));
        vo.setImg(rs.getString("img"));
        vo.setImgRealName(rs.getString("imgRealName"));
        vo.setTitle(rs.getString("title"));
        vo.setContext(rs.getString("context"));
        vo.setReview_date(rs.getDate("review_date"));
        list.add(vo);
      }

    } catch (Exception e) {
      System.out.println("reviewListAll 메소드에서 에러가 발생하였습니다. 이유는 ? --> " + e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return list;
  }
//============================목록 불러오기=======================================

  public int insertReview(ReviewVo vo) {
    int result = 0 ;
    try {
      con = ds.getConnection();
      
      String sql = "INSERT INTO REVIEW VALUES(REVIEW_SEQ.NEXTVAL,?,?,?,?,?,sysdate)";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, vo.getId());
      pstmt.setString(2, vo.getImg());
      pstmt.setString(3, vo.getImgRealName());
      pstmt.setString(4, vo.getTitle());
      pstmt.setString(5, vo.getContext());
      result = pstmt.executeUpdate();
      
    } catch (Exception e) {
      System.out.println("insertReview 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    
    return result;
  }

  public ReviewVo boardRead(String loginid) {
    ReviewVo vo = null;
    try {
      con = ds.getConnection();
      
      String sql = "SELECT * FROM REVIEW WHERE ID = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, loginid);
      rs = pstmt.executeQuery();
      while(rs.next()) {
        vo.setId(rs.getString("id"));
      }
      
    } catch (Exception e) {
      System.out.println("boardRead 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return vo;
  }

  public int deleteOne(int idx) {
    int result = 0;
    try {
      con = ds.getConnection();
      
      String sql = "DELETE FROM REVIEW WHERE IDX = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, idx);
      result = pstmt.executeUpdate();
      
    } catch (Exception e) {
      System.out.println("deleteOne 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    
    return result;
  }

  public ReviewVo getAllByIdx(int idx1) {
    ReviewVo vo= null;
    try {
      con = ds.getConnection();
      
      String sql = "SELECT * FROM REVIEW WHERE IDX = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setInt(1, idx1);
      rs = pstmt.executeQuery();
      if(rs.next()) {
        vo = new ReviewVo();
        vo.setContext(rs.getString("context"));
        vo.setId(rs.getString("id"));
        vo.setImg(rs.getString("img"));
        vo.setImgRealName(rs.getString("imgRealName"));
        vo.setTitle(rs.getString("title"));
        vo.setIdx(idx1);
      }
    } catch (Exception e) {
      System.out.println("getAllByIdx 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    
    return vo;
  }

  public int editOnePro(ReviewVo vo) {
    int result = 0;
    try {
      con = ds.getConnection();
      
      System.out.println(vo.getTitle());
      String sql = "UPDATE REVIEW "
                 + "SET TITLE = ? , CONTEXT = ? "
                 + "WHERE IDX = ?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, vo.getTitle());
      pstmt.setString(2, vo.getContext());
      pstmt.setInt(3, vo.getIdx());
      
      result = pstmt.executeUpdate();
    } catch (Exception e) {
      System.out.println("modifyOnePro 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
      e.printStackTrace();
    } finally {
      closeResource();
    }
    return result;
  }


 
  
}
