package storemanager.dto;

import java.util.Date;

public class StoreManagerDTO {
	private int	managernum;
	private String managerid;
	private String passwd; 
	private String managername;
	private String manager;
	private String birthday; 
	private String manageremail;
	private String phone;
	private String postcode;
	private String address;
	private String address2;
	private Date join_date;
	
	
	
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	public int getManagernum() {
		return managernum;
	}
	public void setManagernum(int managernum) {
		this.managernum = managernum;
	}
	public String getManagerid() {
		return managerid;
	}
	public void setManagerid(String managerid) {
		this.managerid = managerid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getManagername() {
		return managername;
	}
	public void setManagername(String managername) {
		this.managername = managername;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getManageremail() {
		return manageremail;
	}
	public void setManageremail(String manageremail) {
		this.manageremail = manageremail;
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
		return "StoreManagerDTO [managernum=" + managernum + ", managerid=" + managerid + ", passwd=" + passwd
				+ ", managername=" + managername + ", manager=" + manager + ", birthday=" + birthday + ", manageremail="
				+ manageremail + ", phone=" + phone + ", postcode=" + postcode + ", address=" + address + ", address2="
				+ address2 + ", join_date=" + join_date + "]";
	}
	public StoreManagerDTO(int managernum, String managerid, String passwd, String managername, String manager,
			String birthday, String manageremail, String phone, String postcode, String address, String address2,
			Date join_date) {

		this.managernum = managernum;
		this.managerid = managerid;
		this.passwd = passwd;
		this.managername = managername;
		this.manager = manager;
		this.birthday = birthday;
		this.manageremail = manageremail;
		this.phone = phone;
		this.postcode = postcode;
		this.address = address;
		this.address2 = address2;
		this.join_date = join_date;
	}
	public StoreManagerDTO() {
	
	}
	
	
	
	
}
