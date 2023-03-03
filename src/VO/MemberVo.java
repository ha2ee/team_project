package VO;

import java.sql.Date;

//회원 한사람의 정보를 DB로 부터 조회해서 저장할 변수가 있는 VO클래스
//입력한 회원정보를 DB에 INSERT추가 하기 전 임시로 저장할 변수가 있는 VO클래스
public class MemberVo {
	

	//일반회원 테이블 
	private String mem_id;           
	private String mem_nick;
	private String mem_name; 
	private String mem_pw;        
	private String mem_email;      
	private String mem_hp;          
	private String mem_birth;      
	private String mem_gender;      
	private Date mem_joindate;         
	private String mem_pet;
	private String mem_address1;
	private String mem_address2;
	private String mem_address3;
	private String mem_address4;
	private String mem_address5;
	
	//기본생성자
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	//모든 생성자
	public MemberVo(String mem_id, String mem_name, String mem_nick, String mem_pw, String mem_email, String mem_hp,
			String mem_birth, String mem_gender, Date mem_joindate, String mem_pet, String mem_address1,
			String mem_address2, String mem_address3, String mem_address4, String mem_address5) {
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_nick = mem_nick;
		this.mem_pw = mem_pw;
		this.mem_email = mem_email;
		this.mem_hp = mem_hp;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_joindate = mem_joindate;
		this.mem_pet = mem_pet;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_address3 = mem_address3;
		this.mem_address4 = mem_address4;
		this.mem_address5 = mem_address5;
	}
	
	//날짜 뺀 생성자
	public MemberVo(String mem_id, String mem_name, String mem_nick, String mem_pw, String mem_email, String mem_hp,
			String mem_birth, String mem_gender, String mem_pet, String mem_address1,
			String mem_address2, String mem_address3, String mem_address4, String mem_address5) {
		this.mem_id = mem_id;
		this.mem_name = mem_name;
		this.mem_nick = mem_nick;
		this.mem_pw = mem_pw;
		this.mem_email = mem_email;
		this.mem_hp = mem_hp;
		this.mem_birth = mem_birth;
		this.mem_gender = mem_gender;
		this.mem_pet = mem_pet;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_address3 = mem_address3;
		this.mem_address4 = mem_address4;
		this.mem_address5 = mem_address5;
	}


	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_hp() {
		return mem_hp;
	}

	public void setMem_hp(String mem_hp) {
		this.mem_hp = mem_hp;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public Date getMem_joindate() {
		return mem_joindate;
	}

	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}

	public String getMem_pet() {
		return mem_pet;
	}

	public void setMem_pet(String mem_pet) {
		this.mem_pet = mem_pet;
	}

	public String getMem_address1() {
		return mem_address1;
	}

	public void setMem_address1(String mem_address1) {
		this.mem_address1 = mem_address1;
	}

	public String getMem_address2() {
		return mem_address2;
	}

	public void setMem_address2(String mem_address2) {
		this.mem_address2 = mem_address2;
	}

	public String getMem_address3() {
		return mem_address3;
	}

	public void setMem_address3(String mem_address3) {
		this.mem_address3 = mem_address3;
	}

	public String getMem_address4() {
		return mem_address4;
	}

	public void setMem_address4(String mem_address4) {
		this.mem_address4 = mem_address4;
	}

	public String getMem_address5() {
		return mem_address5;
	}

	public void setMem_address5(String mem_address5) {
		this.mem_address5 = mem_address5;
	}

}	
	
	