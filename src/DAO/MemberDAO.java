package DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;

public class MemberDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public MemberDAO() {
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

			String sql = "select mem_id from ys_member where mem_id=?";
//				String sql = "select decode(count(*),1,'true','false') as result from ys_member where mem_id=?";
			
			
			//SELECT문장을 DB의 member테이블에 전송해서 조회할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//SLELCT문장을 실행하여 조회된 데이터들을 ResultSet에 담아 반환 받기
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memResult = true;
			}
			
//				 조회된 제목줄에 커서(화살표)가 있다가 조회된 줄로 내려가 위치함			
//				memResult = Boolean.parseBoolean(value);
			
			
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

	// #2) 회원아이디 중복 체크
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

			String sql = "select tr_id from member_trainer where tr_id=?";
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
			System.out.println("훈련사 멤버 :"+trResult);
//			true면 중복 , false면 중복아님
			
		} catch (Exception e) {
			System.out.println("trResult 메소드 내부에서 오류!");
			e.printStackTrace();
		}finally {
			closeResource();
		}
		
		return trResult;
	}
	
	//---------------------------------------------------일반회원

	
	
	
	// #3) 일반회원 회원가입
		public void insertMember(MemberVo mem_vo) {
			
			
			try {
				//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
				//요약 DB연결
				con = ds.getConnection();
				//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
				//insert문장 완성하기
				String sql = "INSERT INTO YS_MEMBER(Mem_id, Mem_name, Mem_nick, Mem_pw, Mem_email, Mem_hp, Mem_birth, Mem_gender, Mem_joindate, Mem_pet) "
						+" VALUES (?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
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
				//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				System.out.println("insertMember메소드 내부에서 SQL실행 오류" + e);
			}finally {
				closeResource();
			}
			
		}

		// #3-1) 일반회원 주소 insert
		public void insertMemAddress(MemberVo mem_vo) {
			
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

				
				//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
				pstmt.executeUpdate();
				
				
			}catch (Exception e) {
				System.out.println("insertMemAddress메소드 내부에서 SQL실행 오류" + e);
			}finally {
				closeResource();
			}
			
		}
		
		// #3-2) 일반회원 정보 삭제
				public boolean memDelete(String deleteId) {
					
					boolean mem_result = false; //
					
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

						if(rs.next()) {
							mem_result = true;
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					
					} finally {
						//5. 자원해제 
						try {
							if(con != null) con.close();
							if(pstmt != null) pstmt.close();
							if(rs != null) rs.close();
						} catch (Exception e) {
							System.out.println("memDelete메소드 내부에서 SQL실행 오류" + e );
							e.printStackTrace();
						}	
					}
					
					return mem_result;
				
				}
				
				
			// #3-3) 일반회원 정보 수정
			public int memUpdate(String up_id,String up_pw,String up_nick,String up_name,String up_hp,String up_birth,String up_email,String up_gender) {
				
				int mem_UpResult = 0; //
				
				try {
					con = ds.getConnection();
					
					String query = "update YS_MEMBER set MEM_NAME='" + up_name + "',"
								                     + " MEM_NICK='" + up_nick + "'"
								                     + " MEM_PW='" + up_pw + "'"
								                     + " MEM_EMAIL='" + up_email + "'"
								                     + " MEM_HP='" + up_hp + "'"
								                     + " MEM_BIRTH='" + up_birth + "'"
								                     + " MEM_GENDER='" + up_gender + "'"
						  						     + " where MEM_ID ='"+ up_id +"'";
					
					
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
		
			//	#3-4) 일반회원  주소 정보 수정
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
			
			
			// #3-5)  유저 DB 정보 조회 메소드
			public int userCheck(String login_id, String login_pass) {
				
				System.out.println("MemberDAO -> userCheck() 메소드 호출!");
				
				
				// check 변수를 설정하고 기본값 -1로 설정
				int check = -1;
				
				try {
					
					//DB접속
					con = ds.getConnection();
					//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
					String sql = "select * from ys_member where mem_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, login_id);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {//입력한 아이디로 조회한 행이 있으면? (아이디가 있으면?)
						
						//입력한 비밀번호와 조회된 비밀번호와 비교해서 있으면 ?(비밀번호가 있으면?)
						if(login_pass.equals(rs.getString("mem_pw"))) {
							
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
				
				System.out.println("check : "+check);
				
				return check;

			}
			

		
	//---------------------------------------------------훈련사

	// #4) 훈련사 회원가입
	public void insertTrMember(MemberVo tr_vo) {
		
		
		try {
			//커넥션 풀에 만들어져 있는 DB와 미리 연결을 맺은 Connection객체 빌려오기
			//요약 DB연결
			con = ds.getConnection();
			//매개변수로 전달 받는 MemberVo객체의 각변수에 저장된 값들을 얻어
			//insert문장 완성하기
			String sql = "INSERT INTO MEMBER_TRAINER(TR_id, TR_name, TR_nick, TR_pw, TR_email, TR_hp, TR_birth, TR_gender, TR_joindate) "
					+" VALUES (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, tr_vo.getTr_id() );
//			pstmt.setString(2, tr_vo.getTr_name()  );
//			pstmt.setString(3, tr_vo.getTr_nick() );
//			pstmt.setString(4, tr_vo.getTr_pw() );
//			pstmt.setString(5, tr_vo.getTr_email() );
//			pstmt.setString(6, tr_vo.getTr_hp() );
//			pstmt.setString(7, tr_vo.getTr_birth() );
//			pstmt.setString(8, tr_vo.getTr_gender() );
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertTrMember메소드 내부에서 SQL실행 오류" + e);
		}finally {
			closeResource();
		}
		
	}
		
		// #4-1) 훈련사 회원 주소 insert
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
//				pstmt.setString(1, tr_vo.getTr_id());
//				pstmt.setString(2, tr_vo.getTr_address1());
//				pstmt.setString(3, tr_vo.getTr_address2());
//				pstmt.setString(4, tr_vo.getTr_address3());
//				pstmt.setString(5, tr_vo.getTr_address4());
				
				
				//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
				pstmt.executeUpdate();
				
				
			}catch (Exception e) {
				System.out.println("insertTrMemAddress메소드 내부에서 SQL실행 오류" + e);
			}finally {
				closeResource();
			}
			
		}	
		
		
		
		
		// #4-2) 훈련사 정보 삭제
		public boolean trDelete(String deleteId) {
			
			boolean tr_result = false; //
			
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

				if(rs.next()) {
					tr_result = true;
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
		
		
		
		// #4-3) 훈련사 정보 수정
		public int trUpdate(String up_id,String up_pw,String up_nick,String up_name,String up_hp,String up_birth,String up_email,String up_gender) {
			
			int tr_UpResult = 0; //
			
			try {
				con = ds.getConnection();
				
				String query = "update MEMBER_TRAINER set TR_NAME='" + up_name + "',"
													  + " TR_NICK='" + up_nick + "'"
													  + " TR_PW='" + up_pw + "'"
													  + " TR_EMAIL='" + up_email + "'"
													  + " TR_HP='" + up_hp + "'"
													  + " TR_BIRTH='" + up_birth + "'"
													  + " TR_GENDER='" + up_gender + "'"
	            					   				  + " where TR_ID ='"+ up_id +"'";

				
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
		
		
		
		//	#4-4) 훈련사회원  주소 정보 수정
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

		
		
}
