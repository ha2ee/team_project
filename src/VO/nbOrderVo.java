package VO;
import java.sql.Date;


// 수강신청 예약 정보를 가져오고 입력하기 위한 클래스
public class nbOrderVo {
	
	// edu_order 내에 있는 컬럼 값들을 해당 타입에 맞게 변수화 설정
	
	
	private int edu_num, edu_price, edu_pet_age, edu_pet_weight;
	
	private String edu_tr_img, edu_tr_name, edu_pet_img, edu_tr_hp, edu_pet_name,
				     edu_pet_type, edu_pet_gender, edu_pet_op;
	
	Date edu_reg_date, edu_date1, edu_date2, edu_date3, edu_date4,
		   edu_date5, edu_date6, edu_date7;

	// getter & setter 기본 설정
	
	public int getEdu_num() {
		return edu_num;
	}

	public int getEdu_price() {
		return edu_price;
	}

	public int getEdu_pet_age() {
		return edu_pet_age;
	}

	public int getEdu_pet_weight() {
		return edu_pet_weight;
	}

	public String getEdu_pet_op() {
		return edu_pet_op;
	}

	public String getEdu_tr_img() {
		return edu_tr_img;
	}

	public String getEdu_tr_name() {
		return edu_tr_name;
	}

	public String getEdu_pet_img() {
		return edu_pet_img;
	}

	public String getEdu_tr_hp() {
		return edu_tr_hp;
	}

	public String getEdu_pet_name() {
		return edu_pet_name;
	}

	public String getEdu_pet_type() {
		return edu_pet_type;
	}

	public String getEdu_pet_gender() {
		return edu_pet_gender;
	}

	public Date getEdu_reg_date() {
		return edu_reg_date;
	}

	public Date getEdu_date1() {
		return edu_date1;
	}

	public Date getEdu_date2() {
		return edu_date2;
	}

	public Date getEdu_date3() {
		return edu_date3;
	}

	public Date getEdu_date4() {
		return edu_date4;
	}

	public Date getEdu_date5() {
		return edu_date5;
	}

	public Date getEdu_date6() {
		return edu_date6;
	}

	public Date getEdu_date7() {
		return edu_date7;
	}

	public void setEdu_num(int edu_num) {
		this.edu_num = edu_num;
	}

	public void setEdu_price(int edu_price) {
		this.edu_price = edu_price;
	}

	public void setEdu_pet_age(int edu_pet_age) {
		this.edu_pet_age = edu_pet_age;
	}

	public void setEdu_pet_weight(int edu_pet_weight) {
		this.edu_pet_weight = edu_pet_weight;
	}

	public void setEdu_pet_op(String edu_pet_op) {
		this.edu_pet_op = edu_pet_op;
	}

	public void setEdu_tr_img(String edu_tr_img) {
		this.edu_tr_img = edu_tr_img;
	}

	public void setEdu_tr_name(String edu_tr_name) {
		this.edu_tr_name = edu_tr_name;
	}

	public void setEdu_pet_img(String edu_pet_img) {
		this.edu_pet_img = edu_pet_img;
	}

	public void setEdu_tr_hp(String edu_tr_hp) {
		this.edu_tr_hp = edu_tr_hp;
	}

	public void setEdu_pet_name(String edu_pet_name) {
		this.edu_pet_name = edu_pet_name;
	}

	public void setEdu_pet_type(String edu_pet_type) {
		this.edu_pet_type = edu_pet_type;
	}

	public void setEdu_pet_gender(String edu_pet_gender) {
		this.edu_pet_gender = edu_pet_gender;
	}

	public void setEdu_reg_date(Date edu_reg_date) {
		this.edu_reg_date = edu_reg_date;
	}

	public void setEdu_date1(Date edu_date1) {
		this.edu_date1 = edu_date1;
	}

	public void setEdu_date2(Date edu_date2) {
		this.edu_date2 = edu_date2;
	}

	public void setEdu_date3(Date edu_date3) {
		this.edu_date3 = edu_date3;
	}

	public void setEdu_date4(Date edu_date4) {
		this.edu_date4 = edu_date4;
	}

	public void setEdu_date5(Date edu_date5) {
		this.edu_date5 = edu_date5;
	}

	public void setEdu_date6(Date edu_date6) {
		this.edu_date6 = edu_date6;
	}

	public void setEdu_date7(Date edu_date7) {
		this.edu_date7 = edu_date7;
	}
	
	// 기본 생성자 설정

	public nbOrderVo(int edu_num, int edu_price, int edu_pet_age, int edu_pet_weight, String edu_pet_op, String edu_tr_img,
			String edu_tr_name, String edu_pet_img, String edu_tr_hp, String edu_pet_name, String edu_pet_type,
			String edu_pet_gender, Date edu_reg_date, Date edu_date1, Date edu_date2, Date edu_date3, Date edu_date4,
			Date edu_date5, Date edu_date6, Date edu_date7) {
		super();
		this.edu_num = edu_num;
		this.edu_price = edu_price;
		this.edu_pet_age = edu_pet_age;
		this.edu_pet_weight = edu_pet_weight;
		this.edu_pet_op = edu_pet_op;
		this.edu_tr_img = edu_tr_img;
		this.edu_tr_name = edu_tr_name;
		this.edu_pet_img = edu_pet_img;
		this.edu_tr_hp = edu_tr_hp;
		this.edu_pet_name = edu_pet_name;
		this.edu_pet_type = edu_pet_type;
		this.edu_pet_gender = edu_pet_gender;
		this.edu_reg_date = edu_reg_date;
		this.edu_date1 = edu_date1;
		this.edu_date2 = edu_date2;
		this.edu_date3 = edu_date3;
		this.edu_date4 = edu_date4;
		this.edu_date5 = edu_date5;
		this.edu_date6 = edu_date6;
		this.edu_date7 = edu_date7;
	}
	
	
	
	
	
}
