package VO;

import java.util.Date;

public class TrainerBoardVo {
    private int tb_idx; // 글 번호
    private String tb_id; // 작성자 아이디
    private String tb_name; // 작성자 이름
    private String tb_title; // 글 제목
    private String tb_content; // 글 내용
    private int tb_group; // 그룹 번호
    private int tb_level; // 답글 계층
    private Date tb_date; // 작성 일자
    private int tb_cnt; // 조회수
    private String tb_file; // 첨부 파일 이름
    
    public TrainerBoardVo() {
		// TODO Auto-generated constructor stub
	}

    //모든 생성자
	public TrainerBoardVo(int tb_idx, String tb_id, String tb_name, String tb_title, String tb_content, int tb_group,
			int tb_level, Date tb_date, int tb_cnt, String tb_file) {
		super();
		this.tb_idx = tb_idx;
		this.tb_id = tb_id;
		this.tb_name = tb_name;
		this.tb_title = tb_title;
		this.tb_content = tb_content;
		this.tb_group = tb_group;
		this.tb_level = tb_level;
		this.tb_date = tb_date;
		this.tb_cnt = tb_cnt;
		this.tb_file = tb_file;
	}

	//작성일 제외 생성자
	public TrainerBoardVo(int tb_idx, String tb_id, String tb_name, String tb_title, String tb_content, int tb_group,
			int tb_level, int tb_cnt, String tb_file) {
		super();
		this.tb_idx = tb_idx;
		this.tb_id = tb_id;
		this.tb_name = tb_name;
		this.tb_title = tb_title;
		this.tb_content = tb_content;
		this.tb_group = tb_group;
		this.tb_level = tb_level;
		this.tb_cnt = tb_cnt;
		this.tb_file = tb_file;
	}

	//get set
	public int getTb_idx() {
		return tb_idx;
	}

	public void setTb_idx(int tb_idx) {
		this.tb_idx = tb_idx;
	}

	public String getTb_id() {
		return tb_id;
	}

	public void setTb_id(String tb_id) {
		this.tb_id = tb_id;
	}

	public String getTb_name() {
		return tb_name;
	}

	public void setTb_name(String tb_name) {
		this.tb_name = tb_name;
	}

	public String getTb_title() {
		return tb_title;
	}

	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}

	public String getTb_content() {
		return tb_content;
	}

	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}

	public int getTb_group() {
		return tb_group;
	}

	public void setTb_group(int tb_group) {
		this.tb_group = tb_group;
	}

	public int getTb_level() {
		return tb_level;
	}

	public void setTb_level(int tb_level) {
		this.tb_level = tb_level;
	}

	public Date getTb_date() {
		return tb_date;
	}

	public void setTb_date(Date tb_date) {
		this.tb_date = tb_date;
	}

	public int getTb_cnt() {
		return tb_cnt;
	}

	public void setTb_cnt(int tb_cnt) {
		this.tb_cnt = tb_cnt;
	}

	public String getTb_file() {
		return tb_file;
	}

	public void setTb_file(String tb_file) {
		this.tb_file = tb_file;
	}
	
	

}