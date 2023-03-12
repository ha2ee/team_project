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
	
	//일반회원 닉네임 체크
	public boolean checkMemNick(String nick) {
		
		boolean memResult = false;
		try {
			con = ds.getConnection();
			System.out.println(nick);

			String sql = "SELECT MEM_NICK FROM YS_MEMBER WHERE MEM_NICK=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memResult = true;
			}
			
		} catch (Exception e) {
			System.out.println("memCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return memResult;
	}
	 
		
	//일반회원 정보 수정
	public void memUpdate(MemberVo vo) {
		
		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set MEM_NICK='" + vo.getMem_nick() + "',"
						                     + " MEM_PW='" + vo.getMem_pw() + "',"
						                     + " MEM_EMAIL='" + vo.getMem_email() + "',"
						                     + " MEM_HP='" + vo.getMem_hp() + "',"
				  						     + " MEM_ADDRESS1='" + vo.getMem_address1() + "',"
										 	 + " MEM_ADDRESS2='" + vo.getMem_address2() + "',"
										 	 + " MEM_ADDRESS3='" + vo.getMem_address3() + "',"
										 	 + " MEM_ADDRESS4='" + vo.getMem_address4() + "',"
										 	 + " MEM_ADDRESS5='" + vo.getMem_address5() + "'"
						                     + " WHERE MEM_ID ='"+ vo.getMem_id() +"'";
			pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("memUpdate메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
	}
		
	

}
