package VO;

import java.sql.Date;

//트레이너 vo
public class TrainerVo {
	
	private String tr_id;           
	private String tr_name; 
	private String tr_nick;
	private String tr_pw;        
	private String tr_email;      
	private String tr_hp;          
	private String tr_birth;      
	private String tr_gender;      
	private String tr_address1;    
	private String tr_address2;  
	private String tr_address3;    
	private String tr_address4;      
	private String tr_address5;    
	private Date tr_joindate;         
	
//기본생성자
	public TrainerVo() {
		// TODO Auto-generated constructor stub
	}
	
//주소를 제외한 생성자
	public TrainerVo(String tr_id, String tr_name, String tr_nick, String tr_pw, String tr_email, String tr_hp,
			String tr_birth, String tr_gender) {
		super();
		this.tr_id = tr_id;
		this.tr_name = tr_name;
		this.tr_nick = tr_nick;
		this.tr_pw = tr_pw;
		this.tr_email = tr_email;
		this.tr_hp = tr_hp;
		this.tr_birth = tr_birth;
		this.tr_gender = tr_gender;
	}

//모두 포함한 생성자
	public TrainerVo(String tr_id, String tr_name, String tr_nick, String tr_pw, String tr_email, String tr_hp,
			String tr_birth, String tr_gender, String tr_address1, String tr_address2, String tr_address3,
			String tr_address4, String tr_address5, Date tr_joindate) {
		super();
		this.tr_id = tr_id;
		this.tr_name = tr_name;
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
		this.tr_address5 = tr_address5;
		this.tr_joindate = tr_joindate;
	}
	
	
//가입일 제외 생성자
	public TrainerVo(String tr_id, String tr_name, String tr_nick, String tr_pw, String tr_email, String tr_hp,
			String tr_birth, String tr_gender, String tr_address1, String tr_address2, String tr_address3,
			String tr_address4, String tr_address5) {
		super();
		this.tr_id = tr_id;
		this.tr_name = tr_name;
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
		this.tr_address5 = tr_address5;
	}





	public String getTr_id() {
		return tr_id;
	}

	public void setTr_id(String tr_id) {
		this.tr_id = tr_id;
	}

	public String getTr_name() {
		return tr_name;
	}

	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}

	public String getTr_nick() {
		return tr_nick;
	}

	public void setTr_nick(String tr_nick) {
		this.tr_nick = tr_nick;
	}

	public String getTr_pw() {
		return tr_pw;
	}

	public void setTr_pw(String tr_pw) {
		this.tr_pw = tr_pw;
	}

	public String getTr_email() {
		return tr_email;
	}

	public void setTr_email(String tr_email) {
		this.tr_email = tr_email;
	}

	public String getTr_hp() {
		return tr_hp;
	}

	public void setTr_hp(String tr_hp) {
		this.tr_hp = tr_hp;
	}

	public String getTr_birth() {
		return tr_birth;
	}

	public void setTr_birth(String tr_birth) {
		this.tr_birth = tr_birth;
	}

	public String getTr_gender() {
		return tr_gender;
	}

	public void setTr_gender(String tr_gender) {
		this.tr_gender = tr_gender;
	}

	public String getTr_address1() {
		return tr_address1;
	}

	public void setTr_address1(String tr_address1) {
		this.tr_address1 = tr_address1;
	}

	public String getTr_address2() {
		return tr_address2;
	}

	public void setTr_address2(String tr_address2) {
		this.tr_address2 = tr_address2;
	}

	public String getTr_address3() {
		return tr_address3;
	}

	public void setTr_address3(String tr_address3) {
		this.tr_address3 = tr_address3;
	}

	public String getTr_address4() {
		return tr_address4;
	}

	public void setTr_address4(String tr_address4) {
		this.tr_address4 = tr_address4;
	}

	public String getTr_address5() {
		return tr_address5;
	}

	public void setTr_address5(String tr_address5) {
		this.tr_address5 = tr_address5;
	}

	public Date getTr_joindate() {
		return tr_joindate;
	}

	public void setTr_joindate(Date tr_joindate) {
		this.tr_joindate = tr_joindate;
	}
	
	
	
	
	
	
}
