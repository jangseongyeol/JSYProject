package noticeboard.dto;

import java.util.Date;

public class NoticeBoardCommentDTO {
	private int comment_num; 
	private int board_num; 
	private String managerid; 
	private String contents; 
	private Date reg_date;//java.util.Date
	
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getManagerid() {
		return managerid;
	}
	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "NoticeBoardCommentDTO [comment_num=" + comment_num + ", board_num=" + board_num + ", managerid="
				+ managerid + ", contents=" + contents + ", reg_date=" + reg_date + "]";
	}
	public NoticeBoardCommentDTO(int comment_num, int board_num, String managerid, String contents, Date reg_date) {
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.managerid = managerid;
		this.contents = contents;
		this.reg_date = reg_date;
	}
	
	public NoticeBoardCommentDTO() {

	}

	
	
}
