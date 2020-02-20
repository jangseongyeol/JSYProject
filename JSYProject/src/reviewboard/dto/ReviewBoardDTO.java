package reviewboard.dto;

import java.sql.Date;

public class ReviewBoardDTO {

	
	private int num;
	private String userid; 
	private String subject; 
	private String passwd; 
	private Date reg_date;//java.sql.Date;
	private int readcount; 
	private int ref; //답변 그룹 번호
	private int re_step; //답변 그룹 내에서의 순서
	private int re_level; //답변 단계(들여쓰기 1번, 2번..)
	private String contents;
	private String ip;
	private int comment_count;//댓글 갯수, 테이블에는 없음
	private String filename;
	private int filesize; 
	private int down;
	private String ext;//첨부파일의 확장명, 테이블에는 없음
	private String show;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getDown() {
		return down;
	}
	public void setDown(int down) {
		this.down = down;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	@Override
	public String toString() {
		return "ReviewBoardDTO [num=" + num + ", userid=" + userid + ", subject=" + subject + ", passwd=" + passwd
				+ ", reg_date=" + reg_date + ", readcount=" + readcount + ", ref=" + ref + ", re_step=" + re_step
				+ ", re_level=" + re_level + ", contents=" + contents + ", ip=" + ip + ", comment_count="
				+ comment_count + ", filename=" + filename + ", filesize=" + filesize + ", down=" + down + ", ext="
				+ ext + ", show=" + show + "]";
	}
	public ReviewBoardDTO(int num, String userid, String subject, String passwd, Date reg_date, int readcount, int ref,
			int re_step, int re_level, String contents, String ip, int comment_count, String filename, int filesize,
			int down, String ext, String show) {
		this.num = num;
		this.userid = userid;
		this.subject = subject;
		this.passwd = passwd;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.ref = ref;
		this.re_step = re_step;
		this.re_level = re_level;
		this.contents = contents;
		this.ip = ip;
		this.comment_count = comment_count;
		this.filename = filename;
		this.filesize = filesize;
		this.down = down;
		this.ext = ext;
		this.show = show;
	}
	public ReviewBoardDTO() {
		
	}
	
	
	
	
}
