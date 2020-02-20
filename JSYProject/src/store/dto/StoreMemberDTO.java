package store.dto;

import java.util.Date;

public class StoreMemberDTO {
	
	private int	usernum;
	private String userid;
	private String passwd; 
	private String username;
	private String birthday; 
	private String useremail;
	private String phone;
	private String postcode;
	private String address;
	private String address2;
	private Date join_date;
	
	
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "StoreMemberDTO [usernum=" + usernum + ", userid=" + userid + ", passwd=" + passwd + ", username="
				+ username + ", birthday=" + birthday + ", useremail=" + useremail + ", phone=" + phone + ", postcode="
				+ postcode + ", address=" + address + ", address2=" + address2 + ", join_date=" + join_date + "]";
	}
	public StoreMemberDTO() {

	}
	public StoreMemberDTO(int usernum, String userid, String passwd, String username, String birthday, String useremail,
			String phone, String postcode, String address, String address2, Date join_date) {
		this.usernum = usernum;
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.birthday = birthday;
		this.useremail = useremail;
		this.phone = phone;
		this.postcode = postcode;
		this.address = address;
		this.address2 = address2;
		this.join_date = join_date;
	}
	
	
	
	
	
}
