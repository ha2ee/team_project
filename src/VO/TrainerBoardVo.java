package VO;

import java.util.Date;

public class TrainerBoardVo {
    private int cb_idx; // 글 번호
    private String cb_id; // 작성자 아이디
    private String cb_nickname; // 작성자 닉네임
    private String cb_title; // 글 제목
    private String cb_content; // 글 내용
    private int cb_group; // 그룹 번호
    private int cb_level; // 답글 계층
    private Date cb_date; // 작성 일자
    private int cb_cnt; // 조회수
    private String cb_file; // 첨부 파일 이름
    
    public TrainerBoardVo() {
		// TODO Auto-generated constructor stub
	}
    
    
    
    

    public TrainerBoardVo(int cb_idx, String cb_id, String cb_nickname, String cb_title, String cb_content,
			int cb_group, int cb_level, Date cb_date, int cb_cnt, String cb_file) {
		super();
		this.cb_idx = cb_idx;
		this.cb_id = cb_id;
		this.cb_nickname = cb_nickname;
		this.cb_title = cb_title;
		this.cb_content = cb_content;
		this.cb_group = cb_group;
		this.cb_level = cb_level;
		this.cb_date = cb_date;
		this.cb_cnt = cb_cnt;
		this.cb_file = cb_file;
	}





	public int getCb_idx() {
        return cb_idx;
    }

    public void setCb_idx(int cb_idx) {
        this.cb_idx = cb_idx;
    }

    public String getCb_id() {
        return cb_id;
    }

    public void setCb_id(String cb_id) {
        this.cb_id = cb_id;
    }

    public String getCb_nickname() {
        return cb_nickname;
    }

    public void setCb_nickname(String cb_nickname) {
        this.cb_nickname = cb_nickname;
    }

    public String getCb_title() {
        return cb_title;
    }

    public void setCb_title(String cb_title) {
        this.cb_title = cb_title;
    }

    public String getCb_content() {
        return cb_content;
    }

    public void setCb_content(String cb_content) {
        this.cb_content = cb_content;
    }

    public int getCb_group() {
        return cb_group;
    }

    public void setCb_group(int cb_group) {
        this.cb_group = cb_group;
    }

    public int getCb_level() {
        return cb_level;
    }

    public void setCb_level(int cb_level) {
        this.cb_level = cb_level;
    }

    public Date getCb_date() {
        return cb_date;
    }

    public void setCb_date(Date cb_date) {
        this.cb_date = cb_date;
    }

    public int getCb_cnt() {
        return cb_cnt;
    }

    public void setCb_cnt(int cb_cnt) {
        this.cb_cnt = cb_cnt;
    }

    public String getCb_file() {
        return cb_file;
    }

    public void setCb_file(String cb_file) {
        this.cb_file = cb_file;
    }

}