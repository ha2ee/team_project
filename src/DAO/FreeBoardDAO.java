package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.FreeBoardVo;


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
			System.out.println("DB연결 실패! - "+ e);
		}
	}
	
	//자원해제 기능
	private void closeResource() {
		if(con != null)try {con.close();} catch (Exception e) {e.printStackTrace();}
		if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
		if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
	}
//------------------------------------------------------------------------------------------- 기본적으로 필요한 부분

	public ArrayList boardListAll() {
		ArrayList list = new ArrayList();
		FreeBoardVo vo;
		try {
			con = ds.getConnection();

			String sql = "SELECT * FROM FREE_BOARD";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				vo = new FreeBoardVo(
								rs.getInt("b_idx"), 
								rs.getString("b_id"), 
								rs.getString("b_nickname"), 
								rs.getString("b_title"), 
								rs.getString("b_content"),
								rs.getInt("b_group"), 
								rs.getInt("b_level"),
								rs.getDate("b_date"),
								rs.getInt("b_cnt"),
								rs.getString("b_file"),
								rs.getInt("b_like")
									);
				list.add(vo);
			}
			
		} catch (Exception e) {
			System.out.println("boardListAll 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
			e.printStackTrace();
		} finally {
			closeResource();
		}
		return list;
	}

	public int getTotalRecord() {
		int count = 0;
		try {
			con = ds.getConnection();

			String sql = "SELECT COUNT(*) FROM FREE_BOARD";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1); 
			}
			
		} catch (Exception e) {
			System.out.println("getTotalRecord 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		return count;
	}
	
	
	
	
	
}