package DAO;

import java.sql.Connection;




import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Year;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import VO.MemberVo;
import VO.PetVo;
import VO.TrainerVo;
import VO.eduOrderVo;


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
	//OrderDAO INFO ////////////////////////////////////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//#1) checkTrainer() 메소드 <- 훈련사 정보 조회
	//#2) checkMember() 메소드 <- 멤버 정보 조회
	//#3) checkPet() 메소드 <- 반려견 정보 조회
	//#4) checkDate() 메소드 <- 예약일정에서 이미 예약된 일정을 조회
	//#4-1) checkCart() 메소드 <- 예약일정에서 카트에 저장된 일정을 조회
	//#5) insertCartedu() 메소드 <- 수강신청 정보 등록
	//#6) insertEduOrder() 메소드 <- 결제하기 정보 등록
	//#7) checkCartedu() 메소드 <- 장바구니 정보 조회
	//#8) deleteEdu() 메소드 <- 장바구니 예약 삭제
	//#8-1) deleteAlledu() 메소드 <- 장바구니 모두 비우기
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	





	//조회된 이름값으로 MEMBER_TRAINER DB에 저장 된 트레이너를 조회하고
	//다시 리턴 해준다.
	public TrainerVo checkTrainer(String tr_name) {
	
		System.out.println("OrderDAO -> checkTrainer 호출!");
		System.out.println("String tr_name : "+tr_name);
		
		//1) 트레이너를 조회할 멤버VO 초기화 시키기
		TrainerVo trainervo = null;
		
		try {
		
		//1) DB접속
		con = ds.getConnection();
		
		//2) SELECT문
		//sql 변수값에 가져온 이름으로 트레이너의 전화번호, 이미지를 조회한다.
		String sql = "select TR_NAME, TR_HP, TR_IMG from MEMBER_TRAINER where TR_NAME=?";
		
		
		//3) pstmt에 sql 문 저장 하기
		pstmt = con.prepareStatement(sql);
		
		//4) sql에서 ?로 된 구문에 tr_name 넣기
		pstmt.setString(1, tr_name);
		
		//5) resultset에 저장시키고 조회 해온다.
		rs = pstmt.executeQuery();
		
		//6) 조회해온 행이 있으면?
		if(rs.next()) {
		
		//7) trainervo에 저장한다.
		trainervo = new TrainerVo();
		trainervo.setTr_name(rs.getString("tr_name"));
		trainervo.setTr_hp(rs.getString("tr_hp"));
		trainervo.setTr_img(rs.getString("tr_img"));
		
		}
		
		
		
		} catch (Exception e) {
		System.out.println("OrderDAO -> ClickTrainer 메소드 내부에서 오류!");
		e.printStackTrace();
		
		} finally {
		
		closeResource();
		
		}
		
		//8) trMembervo로 리턴해준다.
		return trainervo;
	}

	//#2) 수강신청 시 멤버 정보 조회 메소드
	public MemberVo checkMember(String login_id) {
	
		MemberVo membervo = null;
		System.out.println("OrderDAO -> checkMember() 메소드 호출!");
		
		
		try {
		
		//DB접속
		con = ds.getConnection();
		//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
		String sql = "select * from ys_member where mem_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, login_id);
		rs = pstmt.executeQuery();
		
		//입력한 아이디로 조회한 행이 있으면?
		if(rs.next()) {
		
		//하나씩 가져와서 vo에 담는다.
		membervo = new MemberVo();
		//1) 회원 정보에 대한 부분
		membervo.setMem_id(rs.getString("mem_id"));
		membervo.setMem_name(rs.getString("mem_name"));
		membervo.setMem_email(rs.getString("mem_email"));
		membervo.setMem_hp(rs.getString("mem_hp"));
		membervo.setMem_address1(rs.getString("mem_address1"));
		membervo.setMem_address2(rs.getString("mem_address2"));
		membervo.setMem_address3(rs.getString("mem_address3"));
		membervo.setMem_address4(rs.getString("mem_address4"));
		membervo.setMem_address5(rs.getString("mem_address5"));
		
		}
		
		
		
		} catch (Exception e) {
		
		System.out.println("OrderDAO -> checkMember 메소드 내부에서 오류!");
		e.printStackTrace();
		
		}finally {
		
		closeResource();
		}
		
		return membervo;
		
	}

	//#3) 수강신청 시 반려견 정보 조회 메소드
	public Vector<PetVo> checkPet(String login_id) {
	
		Vector<PetVo> vector = new Vector<PetVo>();
		
		
		
		System.out.println("OrderDAO -> checkPet() 메소드 호출!");
		
		
		try {
		
		//DB접속
		con = ds.getConnection();
		//매개변수 login_id로 받는 입력한 아이디에 해당되는 행을 조회 SELECT문
		//sql = id 값으로 저장 된 반려견 정보를 조회한다
		String sql = "select * from pet where p_mem_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, login_id);
		rs = pstmt.executeQuery();
		
		//만약에 값들이 존재 한다면?
		while(rs.next()) {
		
		//petvo 객체를 생성해준다.
		PetVo petvo = new PetVo();
		
		//petvo에 담는다.
		petvo.setP_name(rs.getString("p_name"));
		petvo.setP_age(Integer.parseInt(rs.getString("p_age")));
		petvo.setP_gender(rs.getString("p_gender"));
		petvo.setP_type(rs.getString("p_type"));
		petvo.setP_op(rs.getString("p_op"));
		petvo.setP_weight(Integer.parseInt(rs.getString("p_weight")));
		petvo.setP_img(rs.getString("p_img"));
		
		vector.add(petvo);
		}
		
		
		
		
		} catch (Exception e) {
		
		System.out.println("OrderDAO -> checkPet 메소드 내부에서 오류!");
		e.printStackTrace();
		
		}finally {
		
		closeResource();
		}
		
		return vector;
	
	}

	//#4) 이미 예약된 일정을 필터링 해서 반환해주는 메소드
	public List checkDate(String tr_name) {
	
		List<String> list = new ArrayList();
		
		System.out.println("OrderDAO -> checkDate 메소드 호출!");
		
		try {
		
		//DB접속
		con = ds.getConnection();
		//매개변수 tr_name으로 받는 입력한 이름에 해당되는 행을 조회 SELECT문
		//sql = tr_name 값으로 선택 된 훈련사의 예약 된 일정들을 조회해 온다.
		String sql = "SELECT TO_CHAR(date1, 'DD') from edu_order where sysdate <= TO_DATE(date1, 'YY/MM/DD') AND tr_name=? AND NOT date1 IS NULL "
		+"union SELECT TO_CHAR(date2, 'DD') from edu_order where sysdate <= TO_DATE(date2, 'YY/MM/DD') AND tr_name=? AND NOT date2 IS NULL "
		+"union SELECT TO_CHAR(date3, 'DD') from edu_order where sysdate <= TO_DATE(date3, 'YY/MM/DD') AND tr_name=? AND NOT date3 IS NULL "
		+ "union SELECT TO_CHAR(date4, 'DD') from edu_order where sysdate <= TO_DATE(date4, 'YY/MM/DD') AND tr_name=? AND NOT date4 IS NULL "
		+ "union SELECT TO_CHAR(date5, 'DD') from edu_order where sysdate <= TO_DATE(date5, 'YY/MM/DD') AND tr_name=? AND NOT date5 IS NULL "
		+ "union SELECT TO_CHAR(date6, 'DD') from edu_order where sysdate <= TO_DATE(date6, 'YY/MM/DD') AND tr_name=? AND NOT date6 IS NULL "
		+ "union SELECT TO_CHAR(date7, 'DD') from edu_order where sysdate <= TO_DATE(date7, 'YY/MM/DD') AND tr_name=? AND NOT date7 IS NULL";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, tr_name);
		pstmt.setString(2, tr_name);
		pstmt.setString(3, tr_name);
		pstmt.setString(4, tr_name);
		pstmt.setString(5, tr_name);
		pstmt.setString(6, tr_name);
		pstmt.setString(7, tr_name);
		rs = pstmt.executeQuery();
		
		//값이 있다면
		while(rs.next()) {
		
		//list 배열에 저장한다.
		list.add(rs.getString(1));
		
		
		
		
		
		}
		
		} catch (Exception e) {
		
		System.out.println("OrderDAO -> checkDate 메소드 내부에서 오류!");
		e.printStackTrace();
		
		}finally {
		
		closeResource();
		}
		return list;
	
	
	}

	//#4-1) 현재 장바구니에 등록되어있는 예약일정을 반환해주는 메소드
	public List checkCart(String tr_name) {
	
		List<String> list = new ArrayList();
		
		System.out.println("OrderDAO -> checkDate 메소드 호출!");
		
		try {
		
		//DB접속
		con = ds.getConnection();
		//매개변수 tr_name으로 받는 입력한 이름에 해당되는 행을 조회 SELECT문
		//sql = tr_name 값으로 선택 된 훈련사의 예약 된 일정들을 조회해 온다.
		String sql = "SELECT TO_CHAR(date1, 'DD') from cart_edu where sysdate <= TO_DATE(date1, 'YY/MM/DD') AND tr_name=? AND NOT date1 IS NULL "
		+"union SELECT TO_CHAR(date2, 'DD') from cart_edu where sysdate <= TO_DATE(date2, 'YY/MM/DD') AND tr_name=? AND NOT date2 IS NULL "
		+"union SELECT TO_CHAR(date3, 'DD') from cart_edu where sysdate <= TO_DATE(date3, 'YY/MM/DD') AND tr_name=? AND NOT date3 IS NULL "
		+ "union SELECT TO_CHAR(date4, 'DD') from cart_edu where sysdate <= TO_DATE(date4, 'YY/MM/DD') AND tr_name=? AND NOT date4 IS NULL "
		+ "union SELECT TO_CHAR(date5, 'DD') from cart_edu where sysdate <= TO_DATE(date5, 'YY/MM/DD') AND tr_name=? AND NOT date5 IS NULL "
		+ "union SELECT TO_CHAR(date6, 'DD') from cart_edu where sysdate <= TO_DATE(date6, 'YY/MM/DD') AND tr_name=? AND NOT date6 IS NULL "
		+ "union SELECT TO_CHAR(date7, 'DD') from cart_edu where sysdate <= TO_DATE(date7, 'YY/MM/DD') AND tr_name=? AND NOT date7 IS NULL";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, tr_name);
		pstmt.setString(2, tr_name);
		pstmt.setString(3, tr_name);
		pstmt.setString(4, tr_name);
		pstmt.setString(5, tr_name);
		pstmt.setString(6, tr_name);
		pstmt.setString(7, tr_name);
		rs = pstmt.executeQuery();
		
		//값이 있다면
		while(rs.next()) {
		
		//list 배열에 저장한다.
		list.add(rs.getString(1));
		
		
		
		
		
		}
		
		} catch (Exception e) {
		
		System.out.println("OrderDAO -> checkCart 메소드 내부에서 오류!");
		e.printStackTrace();
		
		}finally {
		
		closeResource();
		}
		return list;
		
	
	}

	//#5) 수강신청 정보 카트에 등록 메소드
	public void insertCartedu(eduOrderVo eduordervo, List<String> list) {
	
		System.out.println("OrderDAO -> insertCartedu 메소드 호출!");
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		//매개변수로 전달받은 eduOrderVo의 각 변수에 저장되어 전달받은 값들을
		//sql 문을 이용해 insert 하기
		String sql = "insert into cart_edu(edu_id, edu_name, edu_hp, edu_email, "
		+ "edu_address1, edu_address2, edu_address3, edu_address4, edu_address5, "
		+ "pet_img, pet_name, pet_type, pet_age, pet_weight, pet_gender, pet_op, "
		+ "tr_img, tr_name, tr_hp, "
		+ "date1, date2, date3, date4, date5, date6, date7, "
		+ "edu_cnt, edu_totalprice) "
		+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//sql문을 pstmt 객체에 저장
		pstmt = con.prepareStatement(sql);
		
		//1) 회원 정보 부분
		pstmt.setString(1, eduordervo.getEdu_id());
		pstmt.setString(2, eduordervo.getEdu_name());
		pstmt.setString(3, eduordervo.getEdu_hp());
		pstmt.setString(4, eduordervo.getEdu_email());
		pstmt.setString(5, eduordervo.getEdu_address1());
		pstmt.setString(6, eduordervo.getEdu_address2());
		pstmt.setString(7, eduordervo.getEdu_address3());
		pstmt.setString(8, eduordervo.getEdu_address4());
		pstmt.setString(9, eduordervo.getEdu_address5());
		//2) 펫 정보 부분
		pstmt.setString(10, eduordervo.getPet_img());
		pstmt.setString(11, eduordervo.getPet_name());
		pstmt.setString(12, eduordervo.getPet_type());
		pstmt.setInt(13, eduordervo.getPet_age());
		pstmt.setInt(14, eduordervo.getPet_weight());
		pstmt.setString(15, eduordervo.getPet_gender());
		pstmt.setString(16, eduordervo.getPet_op());
		//3) tr 정보 부분
		pstmt.setString(17, eduordervo.getTr_img());
		pstmt.setString(18, eduordervo.getTr_name());
		pstmt.setString(19, eduordervo.getTr_hp());
		//4) tr 예약일 부분
		pstmt.setString(20, list.get(0));
		pstmt.setString(21, list.get(1));
		pstmt.setString(22, list.get(2));
		pstmt.setString(23, list.get(3));
		pstmt.setString(24, list.get(4));
		pstmt.setString(25, list.get(5));
		pstmt.setString(26, list.get(6));
		pstmt.setInt(27, eduordervo.getEdu_cnt());
		pstmt.setString(28, eduordervo.getEdu_totalprice());
		
		//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
		pstmt.executeUpdate();
		
		
		
		
		} catch(Exception e) {
		
		System.out.println("insertEduOrder 메소드 내부에서 SQL 실행 오류 "+ e);
		
		} finally {
		
		closeResource();
		
		}
	
	
	}

	//#6) 장바구니 수강 정보 조회 메소드
	public Vector<eduOrderVo> checkCartedu(String id) {
	
		Vector<eduOrderVo> vector = new Vector<eduOrderVo>();
		
		eduOrderVo eduordervo = new eduOrderVo();
		
		System.out.println("OrderDAO -> checkCartedu 메소드 호출!");
		
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		//sql 문을 이용해 select 하기
		
		String sql = "select * from cart_edu where sysdate <= TO_DATE(date1, 'YY/MM/DD') OR sysdate <= TO_DATE(date2, 'YY/MM/DD') OR sysdate <= TO_DATE(date3, 'YY/MM/DD') OR sysdate <= TO_DATE(date4, 'YY/MM/DD') OR sysdate <= TO_DATE(date5, 'YY/MM/DD') OR sysdate <= TO_DATE(date6, 'YY/MM/DD') OR sysdate <= TO_DATE(date7, 'YY/MM/DD') AND edu_id=? order by edu_num asc";
		
		//sql문을 pstmt 객체에 저장
		pstmt = con.prepareStatement(sql);
		
		
		//4) sql에서 ?로 된 구문에 tr_name 넣기
		pstmt.setString(1, id);
		
		//5) resultset에 저장시키고 조회 해온다.
		rs = pstmt.executeQuery();
		
		//6) 조회해온 행이 있으면?
		while(rs.next()) {
		
		//7) 조회해온 값들을 eduOrderVo에 저장한다.
		
		eduordervo = new eduOrderVo();
		
		eduordervo.setedu_num(Integer.parseInt(rs.getString("edu_num")));
		eduordervo.setEdu_id(rs.getString("edu_id"));
		eduordervo.setEdu_name(rs.getString("edu_name"));
		eduordervo.setEdu_hp(rs.getString("edu_hp"));
		eduordervo.setEdu_email(rs.getString("edu_email"));
		eduordervo.setEdu_address1(rs.getString("edu_address1"));
		eduordervo.setEdu_address2(rs.getString("edu_address2"));
		eduordervo.setEdu_address3(rs.getString("edu_address3"));
		eduordervo.setEdu_address4(rs.getString("edu_address4"));
		eduordervo.setEdu_address5(rs.getString("edu_address5"));
		eduordervo.setPet_img(rs.getString("pet_img"));
		eduordervo.setPet_name(rs.getString("pet_name"));
		eduordervo.setPet_type(rs.getString("pet_type"));
		eduordervo.setPet_age(Integer.parseInt(rs.getString("pet_age")));
		eduordervo.setPet_weight(Integer.parseInt(rs.getString("pet_weight")));
		eduordervo.setPet_gender(rs.getString("pet_gender"));
		eduordervo.setPet_op(rs.getString("pet_op"));
		eduordervo.setTr_img(rs.getString("tr_img"));
		eduordervo.setTr_name(rs.getString("tr_name"));
		eduordervo.setTr_hp(rs.getString("tr_hp"));
		eduordervo.setTr_reg_date(rs.getDate("tr_reg_date"));
		eduordervo.setDate1(rs.getDate("date1"));
		eduordervo.setDate2(rs.getDate("date2"));
		eduordervo.setDate3(rs.getDate("date3"));
		eduordervo.setDate4(rs.getDate("date4"));
		eduordervo.setDate5(rs.getDate("date5"));
		eduordervo.setDate6(rs.getDate("date6"));
		eduordervo.setDate7(rs.getDate("date7"));
		eduordervo.setEdu_cnt(Integer.parseInt(rs.getString("edu_cnt")));
		eduordervo.setEdu_totalprice(rs.getString("edu_totalprice"));
		
		vector.add(eduordervo);
		
		}
		
		System.out.println(vector);
		
		
		} catch (Exception e) {
		System.out.println("OrderDAO -> checkCartedu 메소드 내부에서 오류!");
		e.printStackTrace();
		
		} finally {
		
		closeResource();
		
		}
		
		//8) eduordervo로 리턴해준다.
		
		return vector;
	}


	//#7) 수강신청 정보 등록 메소드
	public void insertEduOrder(List<String> order_edu_id, List<String> order_edu_name, List<String> order_edu_hp,
			List<String> order_edu_email, List<String> order_edu_address1, List<String> order_edu_address2,
			List<String> order_edu_address3, List<String> order_edu_address4, List<String> order_edu_address5,
			List<String> order_pet_img, List<String> order_pet_name, List<String> order_pet_type,
			List<String> order_pet_age, List<String> order_pet_weight, List<String> order_pet_gender,
			List<String> order_pet_op, List<String> order_tr_img, List<String> order_tr_name, List<String> order_tr_hp,
			List<String> order_date1, List<String> order_date2, List<String> order_date3, List<String> order_date4,
			List<String> order_date5, List<String> order_date6, List<String> order_date7, List<String> order_edu_cnt,
			List<String> order_edu_totalprice) {
	
		System.out.println("OrderDAO -> InsertEduOrder 메소드 호출!");
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		// list 배열안에 사이즈 만큼 가져오기 위해 for문을 돌리기
		for(int i = 0; i < order_edu_id.size(); i++) {
		
			//매개변수로 전달받은 eduOrderVo의 각 변수에 저장되어 전달받은 값들을
			//sql 문을 이용해 insert 하기
			String sql = "insert into edu_order(edu_id, edu_name, edu_hp, edu_email, "
			+ "edu_address1, edu_address2, edu_address3, edu_address4, edu_address5, "
			+ "pet_img, pet_name, pet_type, pet_age, pet_weight, pet_gender, pet_op, "
			+ "tr_img, tr_name, tr_hp, "
			+ "date1, date2, date3, date4, date5, date6, date7, "
			+ "edu_cnt, edu_totalprice) "
			+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			//sql문을 pstmt 객체에 저장
			pstmt = con.prepareStatement(sql);
			
				//1) 회원 정보 부분
				pstmt.setString(1, order_edu_id.get(i));
				pstmt.setString(2, order_edu_name.get(i));
				pstmt.setString(3, order_edu_hp.get(i));
				pstmt.setString(4, order_edu_email.get(i));
				pstmt.setString(5, order_edu_address1.get(i));
				pstmt.setString(6, order_edu_address2.get(i));
				pstmt.setString(7, order_edu_address3.get(i));
				pstmt.setString(8, order_edu_address4.get(i));
				pstmt.setString(9, order_edu_address5.get(i));
				//2) 펫 정보 부분
				pstmt.setString(10, order_pet_img.get(i));
				pstmt.setString(11, order_pet_name.get(i));
				pstmt.setString(12, order_pet_type.get(i));
				pstmt.setString(13, order_pet_age.get(i));
				pstmt.setString(14, order_pet_weight.get(i));
				pstmt.setString(15, order_pet_gender.get(i));
				pstmt.setString(16, order_pet_op.get(i));
				//3) tr 정보 부분
				pstmt.setString(17, order_tr_img.get(i));
				pstmt.setString(18, order_tr_name.get(i));
				pstmt.setString(19, order_tr_hp.get(i));
				//4) tr 예약일 부분
				pstmt.setString(20, order_date1.get(i));
				pstmt.setString(21, order_date2.get(i));
				pstmt.setString(22, order_date3.get(i));
				pstmt.setString(23, order_date4.get(i));
				pstmt.setString(24, order_date5.get(i));
				pstmt.setString(25, order_date6.get(i));
				pstmt.setString(26, order_date7.get(i));
				pstmt.setString(27, order_edu_cnt.get(i));
				pstmt.setString(28, order_edu_totalprice.get(i));
			
			//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
			pstmt.executeUpdate();
		
		}
		
		
		} catch(Exception e) {
		
		System.out.println("insertEduOrder 메소드 내부에서 SQL 실행 오류 "+ e);
		
		} finally {
		
		closeResource();
		
		}
	
	
	}
	//#8) deleteEdu() 메소드 <- 장바구니 예약 삭제
	public void deleteEdu(String loginId, int eduNum) {
	
		System.out.println("OrderDAO -> deleteEdu 메소드 호출!");
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		//매개변수로 전달받은 로그인 아이디와 예약번호를
		//sql 문을 이용해 insert 하기
		String sql = "DELETE FROM cart_edu WHERE edu_id=? AND edu_num=?";
		
		//sql문을 pstmt 객체에 저장
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, loginId);
		pstmt.setInt(2, eduNum);
		
		//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
		pstmt.executeUpdate();
		
		
		
		
		} catch(Exception e) {
		
		System.out.println("deleteEdu 메소드 내부에서 SQL 실행 오류 "+ e);
		
		} finally {
		
		closeResource();
		
		}
		
		
		
	}

	//#8-1) deleteAlledu() 메소드 <- 장바구니 모두 비우기
	public void deleteAlledu(String loginId) {
	
		System.out.println("OrderDAO -> deleteAlledu 메소드 호출!");
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		//매개변수로 전달받은 로그인 아이디와 예약번호를
		//sql 문을 이용해 insert 하기
		String sql = "DELETE FROM cart_edu WHERE edu_id=?";
		
		//sql문을 pstmt 객체에 저장
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, loginId);
		
		//PreparedStatement실행객체메모리에 설정된 insert전체 문장을 DB의 테이블에 실행!
		pstmt.executeUpdate();
		
		
		
		
		} catch(Exception e) {
		
		System.out.println("deleteEdu 메소드 내부에서 SQL 실행 오류 "+ e);
		
		} finally {
		
		closeResource();
		
		}
	
	
	
	}

	public PetVo checkingPet(String loging_id, String petName) {
	
	
		//PetVo 객체 생성
		PetVo petvo1 = new PetVo();
		
		System.out.println("OrderDAO -> checkingPet 메소드 호출!");
		
		try {
		
		//커넥션 풀 연결
		con = ds.getConnection();
		
		//매개변수로 전달받은 로그인 아이디와 예약번호를
		//sql 문을 이용해 insert 하기
		String sql = "select * FROM pet WHERE p_name=? and p_mem_id=?";
		
		//sql문을 pstmt 객체에 저장
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, petName);
		pstmt.setString(2, loging_id);
		
		//PreparedStatement실행객체메모리에 설정된 select전체 문장을 DB의 테이블에 실행!
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
		
		
		petvo1.setP_img(rs.getString("p_img"));
		petvo1.setP_name(petName);
		petvo1.setP_age(rs.getInt("p_age"));
		petvo1.setP_gender(rs.getString("p_gender"));
		petvo1.setP_type(rs.getString("p_type"));
		petvo1.setP_weight(rs.getInt("p_weight"));
		petvo1.setP_op(rs.getString("p_op"));
		
		}
		
		
		} catch(Exception e) {
		
		System.out.println("checkingPet 메소드 내부에서 SQL 실행 오류 "+ e);
		e.printStackTrace();
		
		} finally {
		
		closeResource();
		
		}
		
		return petvo1;
	}


}

