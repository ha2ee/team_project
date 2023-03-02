package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;
import VO.nbPetMemVo;
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
	// OrderDAO INFO ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// #1) 		checkTrainer()			 		메소드		<- 훈련사		 	정보 조회
	// #2)      petuserCheck()                메소드     <- 유저+PET      정보 조회 
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
	
	// #2) 수강신청 시 유저 DB+PET 정보 조회 메소드
	public nbPetMemVo petuserCheck(String login_id) {
	nbPetMemVo nbpetmemvo = null;
		
		System.out.println("OrderDAO -> petuserCheck() 메소드 호출!");
					
		
		try {
			
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from ys_member NATURAL JOIN pet where mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			
			//입력한 아이디로 조회한 행이 있으면?
			if(rs.next()) {
			
			// 하나씩 가져와서 vo에 담는다.
			nbpetmemvo	= new nbPetMemVo();
			// 1) 회원 정보에 대한 부분
			nbpetmemvo.setMem_id(rs.getString("mem_id"));
			nbpetmemvo.setMem_name(rs.getString("mem_name"));
			nbpetmemvo.setMem_email(rs.getString("mem_email"));
			nbpetmemvo.setMem_hp(rs.getString("mem_hp"));
			nbpetmemvo.setMem_address1(rs.getString("mem_address1"));
			nbpetmemvo.setMem_address2(rs.getString("mem_address2"));
			nbpetmemvo.setMem_address3(rs.getString("mem_address3"));
			nbpetmemvo.setMem_address4(rs.getString("mem_address4"));
			nbpetmemvo.setMem_address5(rs.getString("mem_address5"));
			
			// 2) 회원이 등록한 펫 정보에 대한 부분
			nbpetmemvo.setP_name(rs.getString("p_name"));
			nbpetmemvo.setP_age(rs.getInt("p_age"));
			nbpetmemvo.setP_gender(rs.getString("p_gender"));
			nbpetmemvo.setP_type(rs.getString("p_type"));
			nbpetmemvo.setP_op(rs.getString("p_op"));
			nbpetmemvo.setP_weight(rs.getInt("p_weight"));
			nbpetmemvo.setP_img(rs.getString("p_img"));
			
			
			
				
				
			}
			
			
			
		} catch (Exception e) {
			
			System.out.println("MemberDAO -> petuserCheck 메소드 내부에서 오류!");
			e.printStackTrace();
			
		}finally {
			
			closeResource();
		}
		
		
		return nbpetmemvo;

	}

		
		
		
		
		
		
}
