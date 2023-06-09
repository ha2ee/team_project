package VO;

public class CommentVO {
	
	
	
	
	
	
	
	private String seq;
	private String id; 
	private String content;
	private String regdate;
	private String pseq;
	private String name;
	private String nickname;// 추가멤버 (이름) 
	
	public CommentVO() {
	}
	
	
	
	public CommentVO(String seq, String id, String content, String regdate, String pseq, String name, String nickname) {
		super();
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.pseq = pseq;
		this.name = name;
		this.nickname = nickname;
	}



	public CommentVO(String seq, String id, String content, String regdate, String pseq, String name) {
		this.seq = seq;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.pseq = pseq;
		this.name = name;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
	
}
