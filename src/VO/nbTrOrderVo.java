package VO;
import java.sql.Date;


// 수강신청 예약 정보를 가져오고 입력하기 위한 클래스
public class nbTrOrderVo {
	
	// tr_order 내에 있는 컬럼 값들을 해당 타입에 맞게 변수화 설정
	
	
	private int tr_num, pet_age, pet_weight, pet_op;
	
	private String tr_mem_name, tr_mem_id, tr_mem_hp, pet_name, pet_type, pet_gender,
					 pet_img;
	
	Date tr_reg_date, tr_date1, tr_date2, tr_date3, tr_date4,
		   tr_date5, tr_date6, tr_date7;
	
	// getter & setter 기본 설정

	public int getTr_num() {
		return tr_num;
	}

	public int getPet_age() {
		return pet_age;
	}

	public int getPet_weight() {
		return pet_weight;
	}

	public int getPet_op() {
		return pet_op;
	}

	public String getTr_mem_name() {
		return tr_mem_name;
	}

	public String getTr_mem_id() {
		return tr_mem_id;
	}

	public String getTr_mem_hp() {
		return tr_mem_hp;
	}

	public String getPet_name() {
		return pet_name;
	}

	public String getPet_type() {
		return pet_type;
	}

	public String getPet_gender() {
		return pet_gender;
	}

	public String getPet_img() {
		return pet_img;
	}

	public Date getTr_reg_date() {
		return tr_reg_date;
	}

	public Date getTr_date1() {
		return tr_date1;
	}

	public Date getTr_date2() {
		return tr_date2;
	}

	public Date getTr_date3() {
		return tr_date3;
	}

	public Date getTr_date4() {
		return tr_date4;
	}

	public Date getTr_date5() {
		return tr_date5;
	}

	public Date getTr_date6() {
		return tr_date6;
	}

	public Date getTr_date7() {
		return tr_date7;
	}

	public void setTr_num(int tr_num) {
		this.tr_num = tr_num;
	}

	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public void setPet_weight(int pet_weight) {
		this.pet_weight = pet_weight;
	}

	public void setPet_op(int pet_op) {
		this.pet_op = pet_op;
	}

	public void setTr_mem_name(String tr_mem_name) {
		this.tr_mem_name = tr_mem_name;
	}

	public void setTr_mem_id(String tr_mem_id) {
		this.tr_mem_id = tr_mem_id;
	}

	public void setTr_mem_hp(String tr_mem_hp) {
		this.tr_mem_hp = tr_mem_hp;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}

	public void setPet_img(String pet_img) {
		this.pet_img = pet_img;
	}

	public void setTr_reg_date(Date tr_reg_date) {
		this.tr_reg_date = tr_reg_date;
	}

	public void setTr_date1(Date tr_date1) {
		this.tr_date1 = tr_date1;
	}

	public void setTr_date2(Date tr_date2) {
		this.tr_date2 = tr_date2;
	}

	public void setTr_date3(Date tr_date3) {
		this.tr_date3 = tr_date3;
	}

	public void setTr_date4(Date tr_date4) {
		this.tr_date4 = tr_date4;
	}

	public void setTr_date5(Date tr_date5) {
		this.tr_date5 = tr_date5;
	}

	public void setTr_date6(Date tr_date6) {
		this.tr_date6 = tr_date6;
	}

	public void setTr_date7(Date tr_date7) {
		this.tr_date7 = tr_date7;
	}
	
	
	
	// 기본 생성자 설정

	public nbTrOrderVo(int tr_num, int pet_age, int pet_weight, int pet_op, String tr_mem_name, String tr_mem_id,
			String tr_mem_hp, String pet_name, String pet_type, String pet_gender, String pet_img, Date tr_reg_date,
			Date tr_date1, Date tr_date2, Date tr_date3, Date tr_date4, Date tr_date5, Date tr_date6, Date tr_date7) {
		super();
		this.tr_num = tr_num;
		this.pet_age = pet_age;
		this.pet_weight = pet_weight;
		this.pet_op = pet_op;
		this.tr_mem_name = tr_mem_name;
		this.tr_mem_id = tr_mem_id;
		this.tr_mem_hp = tr_mem_hp;
		this.pet_name = pet_name;
		this.pet_type = pet_type;
		this.pet_gender = pet_gender;
		this.pet_img = pet_img;
		this.tr_reg_date = tr_reg_date;
		this.tr_date1 = tr_date1;
		this.tr_date2 = tr_date2;
		this.tr_date3 = tr_date3;
		this.tr_date4 = tr_date4;
		this.tr_date5 = tr_date5;
		this.tr_date6 = tr_date6;
		this.tr_date7 = tr_date7;
	}
	
	
	
	// 기본 생성자 설정

	
	
	
	
	
}
