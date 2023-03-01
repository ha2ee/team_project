package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;
import VO.trMemberVo;

public class OrderDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public OrderDAO() {
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
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// OrderDAO INFO /////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// #1) 		/checkTrainer()			 		메소드		<- 훈련사		 	정보 조회
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
	

	// 조회된 이름값으로 MEMBER_TRAINER DB에 저장 된 트레이너를 조회하고
	// 다시 리턴 해준다.
	public trMemberVo checkTrainer(String tr_name) {
		
		System.out.println("OrderDAO -> checkTrainer 호출!");
		System.out.println("String tr_name : "+tr_name);
		
		// 1) 트레이너를 조회할 멤버VO 초기화 시키기
		trMemberVo trmembervo = null;
		
		try {
			
	        // 1) DB접속
	        con = ds.getConnection();
	        
	        // 2) SELECT문		
	        // sql 변수값에 가져온 이름으로  트레이너의 전화번호, 이미지를 조회한다. 
	 		String sql = "select TR_NAME, TR_HP, TR_IMG from MEMBER_TRAINER where TR_NAME=?";
			
	        
	        // 3) pstmt에 sql 문 저장 하기
	        pstmt = con.prepareStatement(sql);
	        
	        // 4) sql에서 ?로 된 구문에 tr_name 넣기
	        pstmt.setString(1, tr_name);
	        
	        // 5) resultset에 저장시키고 조회 해온다.
	        rs = pstmt.executeQuery();
	        
	        // 6) 조회해온 행이 있으면?
	        if(rs.next()) {
		            
        		// 7) trMembervo에 저장한다.
	            trmembervo = new trMemberVo();
	            trmembervo.setTr_name(rs.getString("tr_name"));
	            trmembervo.setTr_hp(rs.getString("tr_hp"));
	            trmembervo.setTr_img(rs.getString("tr_img"));
	            
	            System.out.println("tr_name : "+trmembervo.getTr_name());
	            System.out.println("tr_hp :"+trmembervo.getTr_hp());
	            System.out.println("tr_img :"+trmembervo.getTr_img());
	           
	         }
	        
			
			
		} catch (Exception e) {
		         System.out.println("OrderDAO -> ClickTrainer 메소드 내부에서 오류!");
		         e.printStackTrace();
			
		} finally {
			
			 closeResource();
			
		}
		
		// 8) trMembervo로 리턴해준다.
		return trmembervo;
	}

		
		
		
		
		
		
}
