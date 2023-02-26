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

			String sql = "SELECT * FROM FREE_BOARD ORDER BY B_IDX DESC";
			
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

	public int insertBoard(FreeBoardVo vo) {
		int result = 0 ;
		try {
			con = ds.getConnection();

			String sql = "INSERT INTO FREE_BOARD VALUES(FREEBOARD_SEQ.NEXTVAL,?,?,?,?,0,0,SYSDATE,0,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getB_id());
			pstmt.setString(2, vo.getB_nickname());
			pstmt.setString(3, vo.getB_title());
			pstmt.setString(4, vo.getB_content());
			pstmt.setString(5, vo.getB_file());
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

	public FreeBoardVo boardRead(int b_idx) {
		FreeBoardVo vo = null;
	
		try {
			con = ds.getConnection();

			String sql = "SELECT * FROM FREE_BOARD WHERE B_IDX=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_idx);
			rs = pstmt.executeQuery();

			if(rs.next()) {
			vo = new FreeBoardVo();
			
			vo.setB_idx(rs.getInt("b_idx"));
			vo.setB_id(rs.getString("b_id"));
			vo.setB_nickname(rs.getString("b_nickname"));
			vo.setB_title(rs.getString("b_title"));
			vo.setB_content(rs.getString("b_content"));
			vo.setB_group(rs.getInt("b_group"));
			vo.setB_level(rs.getInt("b_level"));
			vo.setB_date(rs.getDate("b_date"));
			vo.setB_cnt(rs.getInt("b_cnt"));
			vo.setB_file(rs.getString("b_file"));
			vo.setB_like(rs.getInt("b_like"));
			
			System.out.println(vo.getB_idx());
			}
		
			
		} catch (Exception e) {
			System.out.println("boardRead 메소드에서 에러가 발생하였습니다. 이유는 ? --> " +e);
			e.printStackTrace();
		} finally {
			closeResource();
		}
		
		
		return vo;
	}
	
	
	
	
	
}