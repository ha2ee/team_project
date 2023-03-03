package VO;
import java.sql.Date;


// 수강신청 예약 정보를 가져오고 입력하기 위한 클래스
public class eduOrderVo {
	
	// edu_order 내에 있는 컬럼 값들을 해당 타입에 맞게 변수화 설정
	String edu_id;
	String edu_name;
	String edu_hp;
	String edu_email;
	String edu_address1;
	String edu_address2;
	String edu_address3;
	String edu_address4;
	String edu_address5;
	String pet_img;
	String pet_name;
	String pet_type;
	int		pet_age;
	int		pet_weight;
	String	pet_gender;
	String	pet_op;
	String	tr_img;
	String	tr_name;
	String	tr_hp;
	Date	tr_reg_date;
	String date1;
	String date2;
	String date3;
	String date4;
	String date5;
	String date6;
	String date7;
	int		edu_cnt;
	String edu_totalprice;

	


	// getter & setter 기본 설정
	public String getEdu_id() {
		return edu_id;
	}

	public void setEdu_id(String edu_id) {
		this.edu_id = edu_id;
	}

	public String getEdu_name() {
		return edu_name;
	}

	public void setEdu_name(String edu_name) {
		this.edu_name = edu_name;
	}

	public String getEdu_hp() {
		return edu_hp;
	}

	public void setEdu_hp(String edu_hp) {
		this.edu_hp = edu_hp;
	}

	public String getEdu_email() {
		return edu_email;
	}

	public void setEdu_email(String edu_email) {
		this.edu_email = edu_email;
	}

	public String getEdu_address1() {
		return edu_address1;
	}

	public void setEdu_address1(String edu_address1) {
		this.edu_address1 = edu_address1;
	}

	public String getEdu_address2() {
		return edu_address2;
	}

	public void setEdu_address2(String edu_address2) {
		this.edu_address2 = edu_address2;
	}

	public String getEdu_address3() {
		return edu_address3;
	}

	public void setEdu_address3(String edu_address3) {
		this.edu_address3 = edu_address3;
	}

	public String getEdu_address4() {
		return edu_address4;
	}

	public void setEdu_address4(String edu_address4) {
		this.edu_address4 = edu_address4;
	}

	public String getEdu_address5() {
		return edu_address5;
	}

	public void setEdu_address5(String edu_address5) {
		this.edu_address5 = edu_address5;
	}

	public String getPet_img() {
		return pet_img;
	}

	public void setPet_img(String pet_img) {
		this.pet_img = pet_img;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public int getPet_age() {
		return pet_age;
	}

	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public int getPet_weight() {
		return pet_weight;
	}

	public void setPet_weight(int pet_weight) {
		this.pet_weight = pet_weight;
	}

	public String getPet_gender() {
		return pet_gender;
	}

	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}

	public String getPet_op() {
		return pet_op;
	}

	public void setPet_op(String pet_op) {
		this.pet_op = pet_op;
	}

	public String getTr_img() {
		return tr_img;
	}

	public void setTr_img(String tr_img) {
		this.tr_img = tr_img;
	}

	public String getTr_name() {
		return tr_name;
	}

	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}

	public String getTr_hp() {
		return tr_hp;
	}

	public void setTr_hp(String tr_hp) {
		this.tr_hp = tr_hp;
	}

	public Date getTr_reg_date() {
		return tr_reg_date;
	}

	public void setTr_reg_date(Date tr_reg_date) {
		this.tr_reg_date = tr_reg_date;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getDate3() {
		return date3;
	}

	public void setDate3(String date3) {
		this.date3 = date3;
	}

	public String getDate4() {
		return date4;
	}

	public void setDate4(String date4) {
		this.date4 = date4;
	}

	public String getDate5() {
		return date5;
	}

	public void setDate5(String date5) {
		this.date5 = date5;
	}

	public String getDate6() {
		return date6;
	}

	public void setDate6(String date6) {
		this.date6 = date6;
	}

	public String getDate7() {
		return date7;
	}

	public void setDate7(String date7) {
		this.date7 = date7;
	}

	public int getEdu_cnt() {
		return edu_cnt;
	}

	public void setEdu_cnt(int edu_cnt) {
		this.edu_cnt = edu_cnt;
	}

	public String getEdu_totalprice() {
		return edu_totalprice;
	}

	public void setEdu_totalprice(String edu_totalprice) {
		this.edu_totalprice = edu_totalprice;
	}

	
	// 기본 생성자 설정
	public eduOrderVo () {
		
	}



	// tr_reg_date를 제외한 선택자 생성
	public eduOrderVo(String edu_id, String edu_name, String edu_hp, String edu_email, String edu_address1,
			String edu_address2, String edu_address3, String edu_address4, String edu_address5, String pet_img,
			String pet_name, String pet_type, int pet_age, int pet_weight, String pet_gender, String pet_op,
			String tr_img, String tr_name, String tr_hp, String date1, String date2, String date3, String date4, String date5,
			String date6, String date7, int edu_cnt, String edu_totalprice) {
		
		this.edu_id = edu_id;
		this.edu_name = edu_name;
		this.edu_hp = edu_hp;
		this.edu_email = edu_email;
		this.edu_address1 = edu_address1;
		this.edu_address2 = edu_address2;
		this.edu_address3 = edu_address3;
		this.edu_address4 = edu_address4;
		this.edu_address5 = edu_address5;
		this.pet_img = pet_img;
		this.pet_name = pet_name;
		this.pet_type = pet_type;
		this.pet_age = pet_age;
		this.pet_weight = pet_weight;
		this.pet_gender = pet_gender;
		this.pet_op = pet_op;
		this.tr_img = tr_img;
		this.tr_name = tr_name;
		this.tr_hp = tr_hp;
		this.date1 = date1;
		this.date2 = date2;
		this.date3 = date3;
		this.date4 = date4;
		this.date5 = date5;
		this.date6 = date6;
		this.date7 = date7;
		this.edu_cnt = edu_cnt;
		this.edu_totalprice = edu_totalprice;
	}
	
}
