package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import VO.CommentVO;

public class CommentDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public CommentDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:/comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("DB연결 실패! - "+ e);
		}
	}
	
	//자원해제 기능
	private void closeResource() {
		if(con != null)try {con.close();} catch (Exception e) {e.printStackTrace();}
		if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public ArrayList<CommentVO> listComment(int b_idx) {
		
		try {
			con = ds.getConnection();
			// 부모글 번호를 조건으로 받기
			String sql = "select c.*, (select name from ys_member where mem_id = c.id) as name "
					+ "from tblComment c where pseq = ? order by seq asc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			
			rs = pstmt.executeQuery();
			
			ArrayList<CommentVO> clist = new ArrayList<CommentVO>();
			
			while ( rs.next() ) {
				
				CommentVO cvo = new CommentVO();
				
				cvo.setSeq(rs.getString("seq"));
				cvo.setContent(rs.getString("content"));
				cvo.setId(rs.getString("id"));
				cvo.setRegdate(rs.getString("regdate"));
				cvo.setPseq(rs.getString("pseq"));
				cvo.setName(rs.getString("name"));
				
				clist.add(cvo);
				
			}
			
			return clist;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
}
