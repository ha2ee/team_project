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
			// 매개변수 id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from MEMBER_TRAINER where tr_id= ?" ;
			
			pstmt = con.prepareStatement(sql);
			
			// sql문이 잘들어갔는지출력해보기
//			System.out.println(sql);
			pstmt.setString(1, trid);
			
			rs = pstmt.executeQuery();
	
			if (rs.next()) {
				
				trainervo = new TrainerVo();
				trainervo.setTr_id(rs.getString("tr_id"));
				trainervo.setTr_name(rs.getString("tr_name"));
//				trainervo.setTr_pw(rs.getString("tr_img"));
				trainervo.setTr_pw(rs.getString("tr_pw"));
				trainervo.setTr_email(rs.getString("tr_email"));
				trainervo.setTr_hp(rs.getString("tr_hp"));
				trainervo.setTr_birth(rs.getString("tr_birth"));
				trainervo.setTr_gender(rs.getString("tr_gender"));
//				trainervo.setTr_joindate(rs.getDate("tr_joindate"));
				trainervo.setTr_address1(rs.getString("tr_address1"));
				trainervo.setTr_address2(rs.getString("tr_address2"));
				trainervo.setTr_address3(rs.getString("tr_address3"));
				trainervo.setTr_address4(rs.getString("tr_address4"));
				trainervo.setTr_address4(rs.getString("tr_address5"));
				
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

	
	
	
		
	
		
		
		
		
}
