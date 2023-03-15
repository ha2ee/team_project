package VO;

import java.sql.Date;

//조회한 하나의 글정보를 저장할 용도
//수정할 하나의 글정보를 조회한후 저장할 용도
//DB에 추가한 새글정보를 임시로 저장할 용도
public class FreeBoardVo {
	private int b_idx;
	private String b_id,b_nickname,b_title,b_content;
	private Date b_date;
	private int b_cnt;
	private String b_file,b_realfile;
	private int b_like;
	private String ccnt;
	public FreeBoardVo() {}

  public FreeBoardVo(int b_idx, String b_id, String b_nickname, String b_title, String b_content,
      Date b_date, int b_cnt, String b_file, String b_realfile, int b_like) {
    super();
    this.b_idx = b_idx;
    this.b_id = b_id;
    this.b_nickname = b_nickname;
    this.b_title = b_title;
    this.b_content = b_content;
    this.b_date = b_date;
    this.b_cnt = b_cnt;
    this.b_file = b_file;
    this.b_realfile = b_realfile;
    this.b_like = b_like;
  }
  
  
  public FreeBoardVo(int b_idx, String b_id, String b_nickname, String b_title, String b_content, Date b_date, int b_cnt,
		String b_file, String b_realfile, int b_like, String ccnt) {
	this.b_idx = b_idx;
	this.b_id = b_id;
	this.b_nickname = b_nickname;
	this.b_title = b_title;
	this.b_content = b_content;
	this.b_date = b_date;
	this.b_cnt = b_cnt;
	this.b_file = b_file;
	this.b_realfile = b_realfile;
	this.b_like = b_like;
	this.ccnt = ccnt;
}

public String getCcnt() {
	return ccnt;
  }

public void setCcnt(String ccnt) {
	this.ccnt = ccnt;
	}

public int getB_idx() {
    return b_idx;
  }

  public void setB_idx(int b_idx) {
    this.b_idx = b_idx;
  }

  public String getB_id() {
    return b_id;
  }

  public void setB_id(String b_id) {
    this.b_id = b_id;
  }

  public String getB_nickname() {
    return b_nickname;
  }

  public void setB_nickname(String b_nickname) {
    this.b_nickname = b_nickname;
  }

  public String getB_title() {
    return b_title;
  }

  public void setB_title(String b_title) {
    this.b_title = b_title;
  }

  
  public String getB_content() {
    return b_content;
  }

  public void setB_content(String b_content) {
    this.b_content = b_content;
  }

  public Date getB_date() {
    return b_date;
  }

  public void setB_date(Date b_date) {
    this.b_date = b_date;
  }

  public int getB_cnt() {
    return b_cnt;
  }

  public void setB_cnt(int b_cnt) {
    this.b_cnt = b_cnt;
  }

  public String getB_file() {
    return b_file;
  }

  public void setB_file(String b_file) {
    this.b_file = b_file;
  }

  public String getB_realfile() {
    return b_realfile;
  }

  public void setB_realfile(String b_realfile) {
    this.b_realfile = b_realfile;
  }

  public int getB_like() {
    return b_like;
  }

  public void setB_like(int b_like) {
    this.b_like = b_like;
  }



	
	
	
}