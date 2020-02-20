package jsProject;

public class MemberDTO {
	
	private int cstnum;
	private String name, userid, password, passwordck, birthday, sx, email, hp, adrsnum, adrs, dadrs;

	public int getCstnum() {
		return cstnum;
	}

	public void setCstnum(int cstnum) {
		this.cstnum = cstnum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordck() {
		return passwordck;
	}

	public void setPasswordck(String passwordck) {
		this.passwordck = passwordck;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getSx() {
		return sx;
	}

	public void setSx(String sx) {
		this.sx = sx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAdrsnum() {
		return adrsnum;
	}

	public void setAdrsnum(String adrsnum) {
		this.adrsnum = adrsnum;
	}

	public String getAdrs() {
		return adrs;
	}

	public void setAdrs(String adrs) {
		this.adrs = adrs;
	}

	public String getDadrs() {
		return dadrs;
	}

	public void setDadrs(String dadrs) {
		this.dadrs = dadrs;
	}

	public MemberDTO(String name, String userid, String password, String passwordck, String birthday,
			String sx, String email, String hp, String adrsnum, String adrs, String dadrs) {
		
		this.name = name;
		this.userid = userid;
		this.password = password;
		this.passwordck = passwordck;
		this.birthday = birthday;
		this.sx = sx;
		this.email = email;
		this.hp = hp;
		this.adrsnum = adrsnum;
		this.adrs = adrs;
		this.dadrs = dadrs;
	}

	@Override
	public String toString() {
		return "MemberDTO [cstnum=" + cstnum + ", name=" + name + ", userid=" + userid + ", password=" + password
				+ ", passwordck=" + passwordck + ", birthday=" + birthday + ", sx=" + sx + ", email=" + email + ", hp="
				+ hp + ", adrsnum=" + adrsnum + ", adrs=" + adrs + ", dadrs=" + dadrs + "]";
	}

	public MemberDTO(String userid, String password) {
		this.userid = userid;
		this.password = password;
	}

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int cstnum, String name, String userid, String password, String passwordck, String birthday,
			String sx, String email, String hp, String adrsnum, String adrs, String dadrs) {
		super();
		this.cstnum = cstnum;
		this.name = name;
		this.userid = userid;
		this.password = password;
		this.passwordck = passwordck;
		this.birthday = birthday;
		this.sx = sx;
		this.email = email;
		this.hp = hp;
		this.adrsnum = adrsnum;
		this.adrs = adrs;
		this.dadrs = dadrs;
	}

	
}
