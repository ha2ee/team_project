package VO;

// 펫 정보를 조회하는 클래스
public class PetVo {
	

	// 펫 테이블 
	private String p_name;
	int p_age;
	private String p_gender;
	private String p_type;
	private String p_op;
	int p_weight;
	private String p_img;
	private String p_mem_id;
	
	
	
	// 기본 생성자
	public PetVo() {
		
	}




	// 전체 생성자
	public PetVo(String p_name, int p_age, String p_gender, String p_type, String p_op, int p_weight, String p_img,
			String p_mem_id) {
		super();
		this.p_name = p_name;
		this.p_age = p_age;
		this.p_gender = p_gender;
		this.p_type = p_type;
		this.p_op = p_op;
		this.p_weight = p_weight;
		this.p_img = p_img;
		this.p_mem_id = p_mem_id;
	}


	// Setter & Getter

	public String getP_name() {
		return p_name;
	}




	public int getP_age() {
		return p_age;
	}




	public String getP_gender() {
		return p_gender;
	}




	public String getP_type() {
		return p_type;
	}




	public String getP_op() {
		return p_op;
	}




	public int getP_weight() {
		return p_weight;
	}




	public String getP_img() {
		return p_img;
	}




	public String getP_mem_id() {
		return p_mem_id;
	}




	public void setP_name(String p_name) {
		this.p_name = p_name;
	}




	public void setP_age(int p_age) {
		this.p_age = p_age;
	}




	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}




	public void setP_type(String p_type) {
		this.p_type = p_type;
	}




	public void setP_op(String p_op) {
		this.p_op = p_op;
	}




	public void setP_weight(int p_weight) {
		this.p_weight = p_weight;
	}




	public void setP_img(String p_img) {
		this.p_img = p_img;
	}




	public void setP_mem_id(String p_mem_id) {
		this.p_mem_id = p_mem_id;
	}

	
	
	
}	
	
	