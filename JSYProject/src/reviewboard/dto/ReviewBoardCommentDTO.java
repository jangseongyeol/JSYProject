package reviewboard.dto;

import java.util.Date;

public class ReviewBoardCommentDTO {
	
	private int comment_num; 
	private int board_num; 
	private String userid; 
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
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
		return "ReviewBoardCommentDTO [comment_num=" + comment_num + ", board_num=" + board_num + ", userid=" + userid
				+ ", contents=" + contents + ", reg_date=" + reg_date + "]";
	}
	public ReviewBoardCommentDTO(int comment_num, int board_num, String userid, String contents, Date reg_date) {

		this.comment_num = comment_num;
		this.board_num = board_num;
		this.userid = userid;
		this.contents = contents;
		this.reg_date = reg_date;
	}
	public ReviewBoardCommentDTO() {

	}
	
	

}
