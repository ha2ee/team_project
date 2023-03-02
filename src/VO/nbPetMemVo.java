package VO;
import java.sql.Date;


// 캘린더에서 예약일을 선택하고 난 뒤 예약 신청으로 넘어갈때 불러올 클래스
public class nbPetMemVo {
	
	private int p_age, p_weight;
	
	private String mem_id, mem_name, mem_nick, mem_pw, mem_email, mem_hp, mem_birth, mem_gender,
					mem_pet, mem_address1, mem_address2, mem_address3, mem_address4, mem_address5,
					p_name, p_gender, p_type, p_op, p_img;
	
	Date mem_joindate;

	
	// getter & setter 기본 설정
	
	
	public int getP_age() {
		return p_age;
	}

	public void setP_age(int p_age) {
		this.p_age = p_age;
	}

	public int getP_weight() {
		return p_weight;
	}

	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
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

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_type() {
		return p_type;
	}

	public void setP_type(String p_type) {
		this.p_type = p_type;
	}

	public String getP_op() {
		return p_op;
	}

	public void setP_op(String p_op) {
		this.p_op = p_op;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public Date getMem_joindate() {
		return mem_joindate;
	}

	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}
	
	
	// 모든 값을 조회하는 생성자 설정
	public nbPetMemVo(int p_age, int p_weight, String mem_id, String mem_name, String mem_nick, String mem_pw,
			String mem_email, String mem_hp, String mem_birth, String mem_gender, String mem_pet, String mem_address1,
			String mem_address2, String mem_address3, String mem_address4, String mem_address5, String p_name, String p_gender,
			String p_type, String p_op, String p_img, Date mem_joindate) {
		super();
		this.p_age = p_age;
		this.p_weight = p_weight;
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
		this.p_name = p_name;
		this.p_gender = p_gender;
		this.p_type = p_type;
		this.p_op = p_op;
		this.p_img = p_img;
		this.mem_joindate = mem_joindate;
	}


	
	
	// 기본 생성자 설정
	
	public nbPetMemVo() {
		
	}

	
	
	
	
	
}
