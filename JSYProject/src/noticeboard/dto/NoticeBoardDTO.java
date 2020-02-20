package noticeboard.dto;

import java.sql.Date;

public class NoticeBoardDTO {
	private int num;
	private String managerid; 
	private String subject; 
	private String passwd; 
	private Date reg_date;//java.sql.Date;
	private int readcount; 
	private int ref; //답변 그룹 번호
	private int re_step; //답변 그룹 내에서의 순서
	private int re_level; //답변 단계(들여쓰기 1번, 2번..)
	private String contents;
	private int comment_count;//댓글 갯수, 테이블에는 없음
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getManagerid() {
		return managerid;
	}
	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardDTO [num=" + num + ", managerid=" + managerid + ", subject=" + subject + ", passwd=" + passwd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", contents=" + contents + ", comment_count=" + comment_count + "]";
	}
	public NoticeBoardDTO(int num, String managerid, String subject, String passwd, Date reg_date, int readcount,
			int ref, int re_step, int re_level, String contents, int comment_count) {
		this.num = num;
		this.managerid = managerid;
		this.subject = subject;
		this.passwd = passwd;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.contents = contents;
		this.comment_count = comment_count;
	}
	public NoticeBoardDTO() {
		
	}

	
	
}
