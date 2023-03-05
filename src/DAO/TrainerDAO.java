package DAO;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import VO.MemberVo;
import VO.TrainerVo;

public class TrainerDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public TrainerDAO() {
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
	
	public TrainerVo trainerOne(String trid) {
			TrainerVo trainervo = null;
		
		try {
	
			//DB접속
			con = ds.getConnection();
			// email,name,id 값을 매개변수 id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from MEMBER_TRAINER where tr_id= ?" ;
			
			pstmt = con.prepareStatement(sql);
			
			// sql문이 잘들어갔는지출력해보기
//			System.out.println(sql);
			pstmt.setString(1, trid);
			
			// 불러온 email, name, id 값을 result set에 저장한다
			rs = pstmt.executeQuery();
	
			// 조회된 내용을 한개씩 나열해서, membervo에 저장시킴
			if (rs.next()) {
				
				trainervo = new TrainerVo();
				trainervo.setTr_id(rs.getString("tr_id"));
				trainervo.setTr_name(rs.getString("tr_name"));
				trainervo.setTr_pw(rs.getString("tr_pw"));
				trainervo.setTr_email(rs.getString("tr_email"));
//				trainervo.setTr_hp(rs.getString("tr_hp"));
//				trainervo.setTr_birth(rs.getString("tr_birth"));
//				trainervo.setTr_gender(rs.getString("tr_gender"));
//				trainervo.setTr_joindate(rs.getDate("tr_joindate"));
				
			}
			
			
		} catch (Exception e) {
			System.out.println("trainerOne 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		//BoardController로 전달 
		return trainervo;
		}

	
	public TrainerVo trRead(String tr_id) {
		
		String sql = "select * from MEMBER_TRAINER where tr_id=?";
		
		TrainerVo tr_vo = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tr_id);
			
			rs = pstmt.executeQuery();

			
			if(rs.next()) {				
				tr_vo = new TrainerVo();
				tr_vo.setSting(rs.getString("tr_name"));
				tr_vo.setSting(rs.getString("tr_img"));
				tr_vo.setSting(rs.getString("tr_email"));
				tr_vo.setSting(rs.getString("tr_hp"));
				tr_vo.setSting(rs.getString("tr_birth"));
				tr_vo.setSting(rs.getString("tr_gender"));
				tr_vo.setSting(rs.getString("tr_pet"));
				tr_vo.setSting(rs.getString("tr_address1"));
				tr_vo.setSting(rs.getString("tr_address2"));
				tr_vo.setSting(rs.getString("tr_address3"));
				tr_vo.setSting(rs.getString("tr_address4"));
				tr_vo.setSting(rs.getString("tr_address5"));
				
			}					
		}catch(Exception e) {
			
			System.out.println("trRead메소드 내부에서 SQL오류");
			e.printStackTrace();	
			
		}finally {
			closeResource();
		}
		return tr_vo;
	}


	
	
		
	
		
		
		
		
}
