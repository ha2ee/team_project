package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;
import VO.PetVo;
import VO.TrainerVo;

public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public MemberDAO() {
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
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// MemberDAO INFO /////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// #1) 		memCheck()			 		메소드			<- 일반회원		 중복 체크
	// #2)      trCheck()										<- 회원 아이디 	 중복 체크
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// #3)      insertMember()								<- 일반회원      	 회원 가입
	// #3-1)    insertMemberAddress()											 주소 입력
	// #3-2)    memDelete()							 		 					 정보 삭제
	// #3-3)  	 memUpdate()								 		 				 정보 수정
	// #3-4)	 memAddUpdate()									 				 주소 수정
	// #3-5)     userCheck()														 정보 조회
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// #4)      insertTrMember()		 						<- 훈련사			 회원 가입
	// #4-1)    insertTrMemberAddress()											 주소 입력
	// #4-2)    trDelete()															 정보 삭제
	// #4-3)    trUpdate()															 정보 수정
	// #4-4)    trAddUpdate()														 주소 수정
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	// #1) 일반회원 중복 체크
	public boolean memCheck(String id) {
		
		System.out.println("MemberDAO -> /memCheck.me 요청!");

		boolean memResult = false;
		try {
			//DB접속 : 커넥션풀에 만들어져 있는 커넥션 얻기
			con = ds.getConnection();
			//오라클의 decode()함수를 이용하여 서블릿에서 전달되는
			//입력한 ID에 해당하는 데이터를 검색하여 true 또는 false를 반환하는데
			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 'true'를 반환,
			//존재하지 않으면 'false'를 문자열로 반환하여 조회합니다.
			System.out.println(id);

			String sql = "SELECT MEM_ID FROM YS_MEMBER WHERE MEM_ID=?";
//			String sql = "select decode(count(*),1,'true','false') as result from ys_member where mem_id=?";
			
			
			//SELECT문장을 DB의 member테이블에 전송해서 조회할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//SLELCT문장을 실행하여 조회된 데이터들을 ResultSet에 담아 반환 받기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memResult = true;
			}
			
			
			
			System.out.println("일반멤버 :"+memResult);
//			true면 중복 , false면 중복아님
			
		} catch (Exception e) {
			System.out.println("memCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return memResult;
	}
	

	//회원아이디 중복체크
	public boolean trCheck(String id) {
		
		boolean trResult = false;
		try {
			//DB접속 : 커넥션풀에 만들어져 있는 커넥션 얻기
			con = ds.getConnection();
			//오라클의 decode()함수를 이용하여 서블릿에서 전달되는
			//입력한 ID에 해당하는 데이터를 검색하여 true 또는 false를 반환하는데
			//검색한 갯수가 1(검색한 레코드가 존재하면)이면 'true'를 반환,
			//존재하지 않으면 'false'를 문자열로 반환하여 조회합니다.
			System.out.println(id);

			String sql = "SELECT TR_ID FROM MEMBER_TRAINER WHERE TR_ID=?";
//			String sql = "select decode(count(*),1,'true','false') as result from member_trainer where tr_id=?";
			
			
			//SELECT문장을 DB의 member테이블에 전송해서 조회할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//SLELCT문장을 실행하여 조회된 데이터들을 ResultSet에 담아 반환 받기
			rs = pstmt.executeQuery();

			if(rs.next()) {
				trResult = true;
			}
			
//			 조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함			
//			String value = rs.getString("result");
			
//			System.out.println(value);
			System.out.println("트레이너멤버 :"+trResult);
//			true면 중복 , false면 중복아님
			
		} catch (Exception e) {
			System.out.println("trResult 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return trResult;
	}
	
	//---------------------------------------------------
	
	//일반회원 회원가입
	public void insertMember(MemberVo mem_vo) {
		
		
		try {
			System.out.println(mem_vo.getMem_id());
			System.out.println(mem_vo.getMem_pw());
			
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO YS_MEMBER(MEM_ID, MEM_NAME, MEM_NICK, MEM_PW, MEM_EMAIL, MEM_HP, MEM_BIRTH, MEM_GENDER, MEM_PET, MEM_ADDRESS1, MEM_ADDRESS2, MEM_ADDRESS3, MEM_ADDRESS4, MEM_ADDRESS5) "
					+" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_vo.getMem_id() );
			pstmt.setString(2, mem_vo.getMem_name() );
			pstmt.setString(3, mem_vo.getMem_nick() );
			pstmt.setString(4, mem_vo.getMem_pw() );
			pstmt.setString(5, mem_vo.getMem_email() );
			pstmt.setString(6, mem_vo.getMem_hp() );
			pstmt.setString(7, mem_vo.getMem_birth() );
			pstmt.setString(8, mem_vo.getMem_gender() );
			pstmt.setString(9, mem_vo.getMem_pet() );
			pstmt.setString(10, mem_vo.getMem_address1());
			pstmt.setString(11, mem_vo.getMem_address2());
			pstmt.setString(12, mem_vo.getMem_address3());
			pstmt.setString(13, mem_vo.getMem_address4());
			pstmt.setString(14, mem_vo.getMem_address5());
			
			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertTrMember메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}
	
/*	//일반회원 주소 insert
	public void insertMemAddress(MemberVo mem_vo) {
=======
>>>>>>> branch 'seohoon' of https://github.com/ha2ee/neulbom.git
		
<<<<<<< HEAD
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO ADDRESS_MEM(Memberid, address1, address2, address3, address4, address5) "
					+" VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_vo.getMem_id());
			pstmt.setString(2, mem_vo.getMem_address1());
			pstmt.setString(3, mem_vo.getMem_address2());
			pstmt.setString(4, mem_vo.getMem_address3());
			pstmt.setString(5, mem_vo.getMem_address4());
			pstmt.setString(6, mem_vo.getMem_address5());

			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			System.out.println("insertMemAddress메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}
*/
	//---------------------------------------------------
	
	//트레이너 회원가입
	public void insertTrMember(TrainerVo tr_vo) {
		
		
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO MEMBER_TRAINER(TR_ID, TR_NAME, TR_PW, TR_EMAIL, TR_HP, TR_BIRTH, TR_GENDER, TR_ADDRESS1,TR_ADDRESS2,TR_ADDRESS3,TR_ADDRESS4,TR_ADDRESS5) "
					+" VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			System.out.println("이미지"+tr_vo.getTr_img());
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tr_vo.getTr_id() );
			pstmt.setString(2, tr_vo.getTr_name()  );
			pstmt.setString(3, tr_vo.getTr_pw() );
			pstmt.setString(4, tr_vo.getTr_email() );
			pstmt.setString(5, tr_vo.getTr_hp() );
			pstmt.setString(6, tr_vo.getTr_birth() );
			pstmt.setString(7, tr_vo.getTr_gender() );
			pstmt.setString(8, tr_vo.getTr_address1());
			pstmt.setString(9, tr_vo.getTr_address2());
			pstmt.setString(10, tr_vo.getTr_address3());
			pstmt.setString(11, tr_vo.getTr_address4());
			pstmt.setString(12, tr_vo.getTr_address5());
			
		
			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertTrMember메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}
	
/*	//트레이너 회원 주소 insert
	public void insertTrMemAddress(MemberVo tr_vo) {
		
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO ADDRESS_TR(TR_ID	, address1, address2, address3, address4, address5) "
					+" VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tr_vo.getTr_id());
			pstmt.setString(2, tr_vo.getTr_address1());
			pstmt.setString(3, tr_vo.getTr_address2());
			pstmt.setString(4, tr_vo.getTr_address3());
			pstmt.setString(5, tr_vo.getTr_address4());
			pstmt.setString(6, tr_vo.getTr_address5());
			
			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
			
		}catch (Exception e) {
			System.out.println("insertTrMemAddress메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}
*/	
	
	
	//일반회원 정보 삭제
	public boolean memDelete(String deleteId) {
		
		boolean mem_result = true; //
		
		try {
			//1. 커넥션풀(DataSource)에서 Connection객체 얻기
			con = ds.getConnection();
			//2. DELETE 문 만들기 
			//-> 매개변수로 전달 받는  id에 해당되는 회원 삭제 시키는 DELETE문 
			String query = "DELETE FROM YS_MEMBER WHERE MEM_ID=?";
			//문법    DELETE FROM 삭제할테이블명 WHERE 조건열=조건값;
			
			//3. DELETE SQL문을 실행할  PreparedStatement객체 얻기
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deleteId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				System.out.println("삭제됨");
				mem_result = false;
			}
				System.out.println("안됨");
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			//5. 자원해제 
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("memDelete메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
		return mem_result;
	
	}
	
	//트레이너 정보 삭제
	public boolean trDelete(String deleteId) {
		
		boolean tr_result = true; //
		
		try {
			//1. 커넥션풀(DataSource)에서 Connection객체 얻기
			con = ds.getConnection();
			
			//2. DELETE 문 만들기 
			//-> 매개변수로 전달 받는  id에 해당되는 회원 삭제 시키는 DELETE문 
			String query = "DELETE FROM MEMBER_TRAINER WHERE TR_ID=?";
			//문법    DELETE FROM 삭제할테이블명 WHERE 조건열=조건값;
			
			//3. DELETE SQL문을 실행할  PreparedStatement객체 얻기
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, deleteId);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				tr_result = false;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		
		} finally {
			//5. 자원해제 
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("trDelete메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
		return tr_result;
	
	}
	
	//일반회원 정보 수정
	public int memUpdate(String id, String up_pw,String up_nick,String up_hp,String up_email,String up_address1,String up_address2,String up_address3,String up_address4,String up_address5) {
		
		int mem_UpResult = 0; //

		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set MEM_NICK='" + up_nick + "',"
						                     + " MEM_PW='" + up_pw + "',"
						                     + " MEM_EMAIL='" + up_email + "',"
						                     + " MEM_HP='" + up_hp + "',"
				  						     + " MEM_ADDRESS1='" + up_address1 + "',"
										 	 + " MEM_ADDRESS2='" + up_address2 + "',"
										 	 + " MEM_ADDRESS3='" + up_address3 + "',"
										 	 + " MEM_ADDRESS4='" + up_address4 + "',"
										 	 + " MEM_ADDRESS5='" + up_address5 + "'"
						                     + " WHERE MEM_ID ='"+ id +"'";
			
			
			pstmt = con.prepareStatement(query);
			
			mem_UpResult = pstmt.executeUpdate();

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
		
		return mem_UpResult;
		
	}
	
	//트레이너 정보 수정
	public int trUpdate(String id ,String up_pw, String up_hp, String up_email, String up_address1, String up_address2, String up_address3, String up_address4, String up_address5) {
		
		int tr_UpResult = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update MEMBER_TRAINER set TR_PW='" + up_pw + "',"
												  + " TR_EMAIL='" + up_email + "',"
												  + " TR_HP='" + up_hp + "',"
            					   				  + " TR_ADDRESS1='" + up_address1 + "',"
            					   				  + " TR_ADDRESS2='" + up_address2 + "',"
            					   				  + " TR_ADDRESS3='" + up_address3 + "',"
            					   				  + " TR_ADDRESS4='" + up_address4 + "',"
            					   				  + " TR_ADDRESS5='" + up_address5 + "'"
												  + " WHERE TR_ID ='"+ id +"'";

			
			pstmt = con.prepareStatement(query);
			
			tr_UpResult = pstmt.executeUpdate();
			
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
		
		return tr_UpResult;
		
	}
	
/*	
 
	public int memAddUpdate(String up_id, String up_address1,String up_address2,String up_address3,String up_address4,String up_address5) {
		
		int memAdd_UpResult = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set MEMBERID='" + up_id + "',"
										 	 + " address1='" + up_address1 + "',"
										 	 + " address2='" + up_address2 + "'"
										 	 + " address3='" + up_address3 + "'"
										 	 + " address4='" + up_address4 + "'"
										 	 + " address5='" + up_address5 + "'"
										 	 
										 	 + " where MEMBERID ='"+ up_id +"'";
			
			pstmt = con.prepareStatement(query);
			
			memAdd_UpResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("memAddUpdate메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
		return memAdd_UpResult;
		
	}
	
	//트레이너회원  주소 정보 수정
	public int trAddUpdate(String up_id, String up_address1,String up_address2,String up_address3,String up_address4,String up_address5) {
		
		int trAdd_UpResult = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set TR_ID='" + up_id + "',"
										 + " address1='" + up_address1 + "',"
										 + " address2='" + up_address2 + "'"
										 + " address3='" + up_address3 + "'"
										 + " address4='" + up_address4 + "'"
										 + " address5='" + up_address5 + "'"
										 + " where MEMBERID ='"+ up_id +"'";
			
			pstmt = con.prepareStatement(query);
			
			trAdd_UpResult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("trAddUpdate메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
		return trAdd_UpResult;
		
	}

*/	
	

	
	//로그인시 회원아이디 조회
	public int memCheck(String login_id, String login_pass) {
		
		int memCheck = 0;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM YS_MEMBER WHERE MEM_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			//
				if(login_pass.equals(rs.getString("MEM_PW"))) {
					memCheck = 1;
				}else {
					memCheck = 0;
				}
			}else {
				memCheck = 0;

			}
			
			System.out.println(memCheck);
		} catch (Exception e) {
			System.out.println("memCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		
		return memCheck;
	}
	
	//로그인시 트레이너 조회
	public int TrCheck(String login_id, String login_pass) {
		
		int trCheck = 0;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM MEMBER_TRAINER WHERE TR_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				
				if(login_pass.equals(rs.getString("TR_PW"))) {
					trCheck = 1;
				}else {
					trCheck = 0;
				}
			}else {
				trCheck = 0;
			}
			
			System.out.println(trCheck);
		} catch (Exception e) {
			System.out.println("memCheck 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		
		return trCheck;
	}

	public MemberVo memberOne(String memberid) {
			MemberVo membervo = null;
		try {
	
			//DB접속
			con = ds.getConnection();
			// email,name,id 값을 매개변수 id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "select * from YS_MEMBER where mem_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberid);
			rs = pstmt.executeQuery();
			rs.next();
//				membervo 객체 생성
			membervo = new MemberVo();
			membervo.setMem_name(rs.getString("mem_name"));
			membervo.setMem_id(rs.getString("mem_id"));
			membervo.setMem_pw(rs.getString("mem_pw"));
			membervo.setMem_nick(rs.getString("mem_nick"));
			 membervo.setMem_img(rs.getString("mem_img"));
			 membervo.setMem_email(rs.getString("mem_email"));
			 membervo.setMem_hp(rs.getString("mem_hp"));
			 membervo.setMem_birth(rs.getString("mem_birth"));
			 membervo.setMem_gender(rs.getString("mem_gender"));
			 membervo.setMem_pet(rs.getString("mem_pet"));
			 membervo.setMem_joindate(rs.getDate("mem_joindate"));
			 membervo.setMem_address1(rs.getString("mem_address1"));
			 membervo.setMem_address2(rs.getString("mem_address2"));
			 membervo.setMem_address3(rs.getString("mem_address3"));
			 membervo.setMem_address4(rs.getString("mem_address4"));
			 membervo.setMem_address5(rs.getString("mem_address5"));
				
				
				
			} catch (Exception e) {
					System.out.println("memberOne메소드 내부에서 SQL실행 오류" + e );
					e.printStackTrace();
				} finally {
					closeResource();
				}
			return membervo;
		}
		
		
		
		//	#4-4) 훈련사회원  주소 정보 수정
//		public int trAddUpdate(String up_id, String up_address1,String up_address2,String up_address3,String up_address4,String up_address5) {
//			
//			int trAdd_UpResult = 0; //
//			
//			try {
//				con = ds.getConnection();
//				
//				String query = "update YS_MEMBER set TR_ID='" + up_id + "',"
//											 + " address1='" + up_address1 + "',"
//											 + " address2='" + up_address2 + "'"
//											 + " address3='" + up_address3 + "'"
//											 + " address4='" + up_address4 + "'"
//											 + " address5='" + up_address5 + "'"
//											 + " where MEMBERID ='"+ up_id +"'";
//				
//				pstmt = con.prepareStatement(query);
//				
//				trAdd_UpResult = pstmt.executeUpdate();
//				
//			} catch (SQLException e) {
//				e.printStackTrace();
//				
//			} finally {
//				
//				try {
//					closeResource();
//				} catch (Exception e) {
//					System.out.println("trAddUpdate메소드 내부에서 SQL실행 오류" + e );
//					e.printStackTrace();
//				}	
//			}
//			
//			return trAdd_UpResult;
//			
//		}

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
	            
//	            membervo = new MemberVo();
//	            membervo.setId(rs.getString("id"));
//	            membervo.setPass(rs.getString("pass"));
//	            membervo.setHp(rs.getString("hp"));
	         }
	         
	      } catch (Exception e) {
	         System.out.println("memberOneIdPass 메소드 내부에서 오류!");
	         e.printStackTrace();
	      }finally {
	         closeResource();
	      }
	      
	      
	      return membervo;
	   }

	//회원 정보 조회
	public MemberVo memRead(String memberid) {
			
			String sql = "select * from YS_MEMBER where mem_id=?";

			MemberVo mem_vo = null;
			try {
					con = ds.getConnection();
								
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, memberid);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {				

							mem_vo = new MemberVo();
										 mem_vo.setMem_name(rs.getString("mem_name"));
										 mem_vo.setMem_pw(rs.getString("mem_pw"));
										 mem_vo.setMem_nick(rs.getString("mem_nick"));
										 mem_vo.setMem_img(rs.getString("mem_img"));
										 mem_vo.setMem_email(rs.getString("mem_email"));
										 mem_vo.setMem_hp(rs.getString("mem_hp"));
										 mem_vo.setMem_birth(rs.getString("mem_birth"));
										 mem_vo.setMem_gender(rs.getString("mem_gender"));
										 mem_vo.setMem_pet(rs.getString("mem_pet"));
										 mem_vo.setMem_address1(rs.getString("mem_address1"));
										 mem_vo.setMem_address2(rs.getString("mem_address2"));
										 mem_vo.setMem_address3(rs.getString("mem_address3"));
										 mem_vo.setMem_address4(rs.getString("mem_address4"));
										 mem_vo.setMem_address5(rs.getString("mem_address5"));
										 mem_vo.setMem_id(rs.getString("mem_id"));
					}else {
							mem_vo = new MemberVo();
										 mem_vo.setMem_name("");
										 mem_vo.setMem_pw("");
										 mem_vo.setMem_nick("");
										 mem_vo.setMem_img("");
										 mem_vo.setMem_email("");
										 mem_vo.setMem_hp("");
										 mem_vo.setMem_birth("");
										 mem_vo.setMem_gender("");
										 mem_vo.setMem_pet("");
										 mem_vo.setMem_address1("");
										 mem_vo.setMem_address2("");
										 mem_vo.setMem_address3("");
										 mem_vo.setMem_address4("");
										 mem_vo.setMem_address5("");
										 mem_vo.setMem_id("");
						
					}
					
			}catch(Exception e) {
				
				System.out.println("memRead메소드 내부에서 SQL오류");
				e.printStackTrace();	
				
			}finally {
				closeResource();
			}
			return mem_vo;
		}
	

	//트레이너 정보 조회		
	public TrainerVo trRead(String memberid) {

		String sql = "select * from MEMBER_TRAINER where tr_id=?";
		
		TrainerVo tr_vo = null;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {				
				tr_vo = new TrainerVo();
				tr_vo.setTr_name(rs.getString("tr_name"));
				tr_vo.setTr_pw(rs.getString("tr_pw"));
				tr_vo.setTr_img(rs.getString("tr_img"));
				tr_vo.setTr_email(rs.getString("tr_email"));
				tr_vo.setTr_hp(rs.getString("tr_hp"));
				tr_vo.setTr_birth(rs.getString("tr_birth"));
				tr_vo.setTr_gender(rs.getString("tr_gender"));
				tr_vo.setTr_address1(rs.getString("tr_address1"));
				tr_vo.setTr_address2(rs.getString("tr_address2"));
				tr_vo.setTr_address3(rs.getString("tr_address3"));
				tr_vo.setTr_address4(rs.getString("tr_address4"));
				tr_vo.setTr_address5(rs.getString("tr_address5"));
				
			}else {
				
				tr_vo = new TrainerVo();
				tr_vo.setTr_name(""); 
				tr_vo.setTr_pw("");
				tr_vo.setTr_img("");
				tr_vo.setTr_email("");
				tr_vo.setTr_hp("");
				tr_vo.setTr_birth("");
				tr_vo.setTr_gender("");
				tr_vo.setTr_address1("");
				tr_vo.setTr_address2("");
				tr_vo.setTr_address3("");
				tr_vo.setTr_address4("");
				tr_vo.setTr_address5("");
				
				
			}
				
		}catch(Exception e) {
			
			System.out.println("trRead메소드 내부에서 SQL오류");
			e.printStackTrace();	
			
		}finally {
			closeResource();
		}
		return tr_vo;
	}		
//==============================================================================
	
	//??
	public String getMemNickName(String memberid) {
	  String result = null;
	  
    String sql = "SELECT MEM_NICK FROM YS_MEMBER WHERE MEM_ID = ? ";
    
    try {
      con = ds.getConnection();
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, memberid);
      
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
        result = rs.getString("mem_nick");
      }
        
    }catch(Exception e) {
      
      System.out.println("getMemNickName메소드 내부에서 SQL오류");
      e.printStackTrace();  
      
    }finally {
      closeResource();
    }
    return result;
  }   

	//펫 정보 등록
	public boolean petJoin(PetVo pet_vo) {
		
		try {
			
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			
			String sql = "INSERT INTO PET(P_NAME, P_AGE, P_GENDER, P_TYPE, P_OP, P_WEIGHT, P_IMG, P_MEM_ID) "
					+" VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pet_vo.getP_name());
			pstmt.setInt(2, pet_vo.getP_age());
			pstmt.setString(3, pet_vo.getP_gender());
			pstmt.setString(4, pet_vo.getP_type());
			pstmt.setString(5, pet_vo.getP_op());
			pstmt.setInt(6, pet_vo.getP_weight());
			pstmt.setString(7, pet_vo.getP_img());
			pstmt.setString(8, pet_vo.getP_mem_id());
				
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("petJoin메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
		
		
		
		
		return false;
	}

	//펫 정보 조회
	public PetVo petRead(String memberid) {
		String sql = "SELECT * FROM PET WHERE P_MEM_ID=?";
		
		PetVo pet_vo = null;
		try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, memberid);
				
				rs = pstmt.executeQuery();
					rs.next();
					pet_vo = new PetVo();
								 pet_vo.setP_name(rs.getString("p_name"));
								 pet_vo.setP_age(rs.getInt("p_age"));
								 pet_vo.setP_gender(rs.getString("p_gender"));
								 pet_vo.setP_type(rs.getString("p_type"));
								 pet_vo.setP_op(rs.getString("p_op"));
								 pet_vo.setP_weight(rs.getInt("P_weight"));
								 pet_vo.setP_img(rs.getString("p_img"));
		}catch(Exception e) {
			
			System.out.println("petRead메소드 내부에서 SQL오류");
			e.printStackTrace();	
			
		}finally {
			closeResource();
		}
		return pet_vo;
	}

	//펫 정보 수정
	public int petInfoChange(String p_name, String p_age, String p_weight, String p_type, String p_gender, String p_op, String P_mem_id) {
		
		int result = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update PET set p_name='" + p_name + "',"
									   + " p_age='" + p_age + "',"
									   + " p_weight='" + p_weight + "',"
					   				   + " p_type='" + p_type + "',"
					   				   + " p_gender='" + p_gender + "',"
					   				   + " p_op='" + p_op + "'"
									   + " WHERE P_mem_id ='"+ P_mem_id +"'";

			
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("petInfoChange메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
		}
		
		
		return result;
	}

	//회원 사진 등록,업데이트
	public int imgUpdate(String p_mem_id, String fileName) {
		
		System.out.println(p_mem_id);
		System.out.println(fileName);
		
		int result = 0; //
				
			try {
				con = ds.getConnection();
				
				String query = "update YS_MEMBER set mem_img='" + fileName + "'"
										   + " WHERE mem_id ='"+ p_mem_id +"'";
	
				
				pstmt = con.prepareStatement(query);
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				e.printStackTrace();
				
			} finally {
				
				try {
					closeResource();
				} catch (Exception e) {
					System.out.println("imgUpdate메소드 내부에서 SQL실행 오류" + e );
					e.printStackTrace();
				}	
			
			}
		return result;
	
	}
	
	//트레이너 사진 등록,업데이트
	public int trImgUpdate(String p_mem_id, String fileName) {
		
		System.out.println(p_mem_id);
		System.out.println(fileName);
		
		int result = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update MEMBER_TRAINER set tr_img='" + fileName + "'"
					+ " WHERE tr_id ='"+ p_mem_id +"'";
			
			
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("trImgUpdate메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
			
		}
		return result;
		
	}
	
	//펫 사진 등록,업데이트
	public int petImgUpdate(String p_mem_id, String fileName) {
		
		System.out.println(p_mem_id);
		System.out.println(fileName);
		
		int result = 0; //
		
		try {
			con = ds.getConnection();
			
			String query = "update PET set p_img='" + fileName + "'"
					+ " WHERE p_mem_id ='"+ p_mem_id +"'";
			
			
			pstmt = con.prepareStatement(query);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("petImgUpdate메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
			
		}
		return result;
		
	}

	//펫정보 등록할때 YS_MEMBER 애완견 키움으로 변경
	public int mem_pet(String memberid) {
		
		int petResult = 0; 
		
		try {
			con = ds.getConnection();
			
			String query = "update YS_MEMBER set p_img='네'"
					+ " WHERE p_mem_id ='"+ memberid +"'";
			
			
			pstmt = con.prepareStatement(query);
			petResult = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			try {
				closeResource();
			} catch (Exception e) {
				System.out.println("mem_pet메소드 내부에서 SQL실행 오류" + e );
				e.printStackTrace();
			}	
			
		}
		return petResult;
	}

	public MemberVo findMemId(String name, String hp) {
		
		MemberVo mem_vo = null;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM YS_MEMBER WHERE MEM_NAME=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				if(hp.equals(rs.getString("MEM_HP"))) {
					
					mem_vo =  new MemberVo();
					mem_vo.setMem_id(rs.getString("mem_id"));
					System.out.println("이름 전화번호 일치");
				}else {
					
				}
			}else {

			}
	
		} catch (Exception e) {
			System.out.println("findMemId 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return mem_vo;
		
	}
	
	public TrainerVo findTrId(String name, String hp) {
		
		TrainerVo tr_vo = null;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM MEMBER_TRAINER WHERE TR_NAME=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//
				if(hp.equals(rs.getString("TR_HP"))) {
					
					tr_vo =  new TrainerVo();
					tr_vo.setTr_id(rs.getString("tr_id"));
				}else {
					
				}
			}else {
				
			}
			
		} catch (Exception e) {
			System.out.println("findTrId 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return tr_vo;
		
	}

	public MemberVo findMemPw(String id, String hp) {

		MemberVo mem_vo = null;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM YS_MEMBER WHERE MEM_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				
				if(hp.equals(rs.getString("MEM_HP"))) {
					
					mem_vo =  new MemberVo();
					mem_vo.setMem_pw(rs.getString("mem_pw"));

				}else {
					
				}
			}else {

			}
	
		} catch (Exception e) {
			System.out.println("findMemId 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return mem_vo;
	}

	public TrainerVo findTrPw(String id, String hp) {

		TrainerVo tr_vo = null;
		
		try {
			//DB접속
			con = ds.getConnection();
			//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
			String sql = "SELECT * FROM MEMBER_TRAINER WHERE TR_ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//
				if(hp.equals(rs.getString("TR_HP"))) {
					
					tr_vo =  new TrainerVo();
					tr_vo.setTr_pw(rs.getString("tr_pw"));
				
				}else {
					 
					
				}
			}else {
				
			}
			
		} catch (Exception e) {
			System.out.println("findTrId 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return tr_vo;
	
	
	
	}


	
}
