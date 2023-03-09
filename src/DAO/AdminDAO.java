package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;
import VO.PetVo;
import VO.TrainerVo;

public class AdminDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;

	// Vo
	MemberVo memberVO;
	TrainerVo trainerVO;
	PetVo petVO;

	public AdminDAO() {
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

	// 모든 회원 조회
	public List<MemberVo> selectAllMember () {
		 List<MemberVo> list = new ArrayList<>();
		 
		 try {
            con = ds.getConnection();
            String query = "SELECT * from ys_member";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	memberVO = new MemberVo();
            	memberVO.setMem_id(rs.getString("mem_id"));
            	memberVO.setMem_name(rs.getString("mem_name"));
            	memberVO.setMem_nick(rs.getString("mem_nick"));
            	memberVO.setMem_img(rs.getString("mem_img"));
            	memberVO.setMem_pw(rs.getString("mem_pw"));
            	memberVO.setMem_email(rs.getString("mem_email"));
            	memberVO.setMem_hp(rs.getString("mem_hp"));
            	memberVO.setMem_birth(rs.getString("mem_birth"));
            	memberVO.setMem_gender(rs.getString("mem_gender"));
            	memberVO.setMem_joindate(rs.getDate("mem_joindate"));
            	memberVO.setMem_pet(rs.getString("mem_pet"));
            	memberVO.setMem_address1(rs.getString("mem_address1"));
            	memberVO.setMem_address2(rs.getString("mem_address2"));
            	memberVO.setMem_address3(rs.getString("mem_address3"));
            	memberVO.setMem_address4(rs.getString("mem_address4"));
            	memberVO.setMem_address5(rs.getString("mem_address5"));
            	list.add(memberVO);
            }
		 }catch (SQLException e) {
			System.out.println("selectAllMember메소드에서 오류");
			e.printStackTrace();
			
		} finally {
			closeResource();
		}
		 return list;
	
	}	
		 
	

}
