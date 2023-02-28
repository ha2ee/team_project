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
	
	//아이디 중복 체크
	public boolean overlappedId(String id) {
		
		boolean result = false;
		
		try {
			
			//DB접속 : 커넥션풀에 만들어져 있는 커넥션 얻기
			con = ds.getConnection();
			//오라클의 decode()함수를 이용하여 서블릿에서 전달되는
			//입력한 ID에 해당하는 데이터를 검색하여 true 또는 false를 반환하는데
			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 'true'를 반환,
			//존재하지 않으면 'false'를 문자열로 반환하여 조회합니다.
			String sql = "select decode(count(*), 1, 'true', 'false') as result from member where id=?";
			//SELECT문장을 DB의 member테이블에 전송해서 조회할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//SLELCT문장을 실행하여 조회된 데이터들을 ResultSet에 담아 반환 받기
			rs = pstmt.executeQuery();
			
			rs.next(); //조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함
			
			String value = rs.getString("result");
			result = Boolean.parseBoolean(value);
			//true면 중복 , false면 중복아님
			
		} catch (Exception e) {
			System.out.println("overlappedId 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return result;
	}

	public void insertMember(MemberVo vo) {
		
		
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO MEMBER(id, pass, name, reg_date, age, gender, address, email, tel, hp) "
					+" VALUES (?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getTel());
			pstmt.setString(9, vo.getHp());
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}

	public int userCheck(String login_id, String login_pass) {
		
		int check = -1;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {//입력한 아이디로 조회한 행이 있으면? (아이디가 있으면?)
				
				//입력한 비밀번호와 조회된 비밀번호와 비교해서 있으면 ?(비밀번호가 있으면?)
				if(login_pass.equals(rs.getString("pass"))) {
					check = 1;
				}else {//아이디는 맞고 , 비밀번호 틀림
					check = 0;
				}
			}else {//아이디가 틀림
				check = -1;
			}
			
		} catch (Exception e) {
			System.out.println("userCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		
		return check;
	}

	public MemberVo memberOne(String memberid) {
			MemberVo membervo = null;
		
		try {
	
			//DB접속
			con = ds.getConnection();
			// email,name,id 값을 매개변수 id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select email, name, id from member where id=?";
			
			pstmt = con.prepareStatement(sql);
			
			// sql문이 잘들어갔는지출력해보기
			System.out.println(sql);
			pstmt.setString(1, memberid);
			
			// 불러온 email, name, id 값을 result set에 저장한다
			rs = pstmt.executeQuery();
	
			// 조회된 내용을 한개씩 나열해서, membervo에 저장시킴
			if (rs.next()) {
				
				//membervo 객체 생성
				membervo = new MemberVo();
				membervo.setEmail(rs.getString("email"));
				membervo.setId(rs.getString("id"));
				membervo.setName(rs.getString("name"));
				
			}
			
			
		} catch (Exception e) {
			System.out.println("memberOne 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		//BoardController로 전달 
		return membervo;
		}

	public MemberVo memberOneIdPass(String id) {
	      MemberVo membervo = null;
	      
	      try {
	         //DB접속
	         con = ds.getConnection();
	         //SELECT문
	         String sql = "select id, pass, hp from member where id=?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, id);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {//입력한 아이디로 조회한 행이 있으면? (아이디가 있으면?)
	            
	            membervo = new MemberVo();
	            membervo.setId(rs.getString("id"));
	            membervo.setPass(rs.getString("pass"));
	            membervo.setHp(rs.getString("hp"));
	         }
	         
	      } catch (Exception e) {
	         System.out.println("memberOneIdPass 메소드 내부에서 오류!");
	         e.printStackTrace();
	      }finally {
	         closeResource();
	      }
	      
	      
	      return membervo;
	   }

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
