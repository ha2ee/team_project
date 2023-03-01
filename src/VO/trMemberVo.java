package VO;

import java.sql.Date;

//회원 한사람의 정보를 DB로 부터 조회해서 저장할 변수가 있는 VO클래스
//입력한 회원정보를 DB에 INSERT추가 하기 전 임시로 저장할 변수가 있는 VO클래스
public class trMemberVo {
	
	private String tr_id, tr_pw, tr_email, tr_hp, tr_birth, tr_gender, tr_address1, tr_address2, tr_address3, tr_address4, tr_img, tr_name, tr_nick;
	private Date tr_joindate;
	private int tr_number;

	// 1) 기본 생성자
	public trMemberVo() {
		
	}
	
	// 2) 트레이너 DB 전부 가져오는 생성자
	public trMemberVo(String tr_id, String tr_nick, String tr_pw, String tr_email, String tr_hp, String tr_birth, String tr_gender,
			String tr_address1, String tr_address2, String tr_address3, String tr_address4, String tr_img,
			String tr_name, Date tr_joindate, int tr_number) {
		super();
		this.tr_id = tr_id;
		this.tr_nick = tr_nick;
		this.tr_pw = tr_pw;
		this.tr_email = tr_email;
		this.tr_hp = tr_hp;
		this.tr_birth = tr_birth;
		this.tr_gender = tr_gender;
		this.tr_address1 = tr_address1;
		this.tr_address2 = tr_address2;
		this.tr_address3 = tr_address3;
		this.tr_address4 = tr_address4;
		this.tr_img = tr_img;
		this.tr_name = tr_name;
		this.tr_joindate = tr_joindate;
		this.tr_number = tr_number;
	}
	

	

	// 3) 날짜 빼고 DB 전부 가져오는 생성자
	public trMemberVo(String tr_id, String tr_nick, String tr_pw, String tr_email, String tr_hp, String tr_birth, String tr_gender,
			String tr_address1, String tr_address2, String tr_address3, String tr_address4, String tr_img,
			String tr_name, int tr_number) {
		super();
		this.tr_id = tr_id;
		this.tr_nick = tr_nick;
		this.tr_pw = tr_pw;
		this.tr_email = tr_email;
		this.tr_hp = tr_hp;
		this.tr_birth = tr_birth;
		this.tr_gender = tr_gender;
		this.tr_address1 = tr_address1;
		this.tr_address2 = tr_address2;
		this.tr_address3 = tr_address3;
		this.tr_address4 = tr_address4;
		this.tr_img = tr_img;
		this.tr_name = tr_name;
		this.tr_number = tr_number;
	}

	// 4) Getter & Setter
	public String getTr_id() {
		return tr_id;
	}
	
	public String getTr_nick() {
		return tr_nick;
	}

	public String getTr_pw() {
		return tr_pw;
	}

	public String getTr_email() {
		return tr_email;
	}

	public String getTr_hp() {
		return tr_hp;
	}

	public String getTr_birth() {
		return tr_birth;
	}

	public String getTr_gender() {
		return tr_gender;
	}

	public String getTr_address1() {
		return tr_address1;
	}

	public String getTr_address2() {
		return tr_address2;
	}

	public String getTr_address3() {
		return tr_address3;
	}

	public String getTr_address4() {
		return tr_address4;
	}

	public String getTr_img() {
		return tr_img;
	}

	public String getTr_name() {
		return tr_name;
	}

	public Date getTr_joindate() {
		return tr_joindate;
	}

	public int getTr_number() {
		return tr_number;
	}

	public void setTr_id(String tr_id) {
		this.tr_id = tr_id;
	}
	
	public void setTr_nick(String tr_nick) {
		this.tr_nick = tr_nick;
	}

	public void setTr_pw(String tr_pw) {
		this.tr_pw = tr_pw;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public void setTr_hp(String tr_hp) {
		this.tr_hp = tr_hp;
	}

	public void setTr_birth(String tr_birth) {
		this.tr_birth = tr_birth;
	}

	public void setTr_gender(String tr_gender) {
		this.tr_gender = tr_gender;
	}

	public void setTr_address1(String tr_address1) {
		this.tr_address1 = tr_address1;
	}

	public void setTr_address2(String tr_address2) {
		this.tr_address2 = tr_address2;
	}

	public void setTr_address3(String tr_address3) {
		this.tr_address3 = tr_address3;
	}

	public void setTr_address4(String tr_address4) {
		this.tr_address4 = tr_address4;
	}

	public void setTr_img(String tr_img) {
		this.tr_img = tr_img;
	}

	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}

	public void setTr_joindate(Date tr_joindate) {
		this.tr_joindate = tr_joindate;
	}

	public void setTr_number(int tr_number) {
		this.tr_number = tr_number;
	}
	
	
	
	
}
