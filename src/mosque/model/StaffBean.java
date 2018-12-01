package mosque.model;

public class StaffBean {

	private String staffID;
	private String staffName;
	private String staffAddress;
	private String staffNoTel;
	private String staffEmail;
	private String staffPos;
	private String managerID;
	private String password;
	//token check account
	public boolean valid;
	
	public String getStaffID() {
		return staffID;
	}
	public void setStaffID(String staffID) {
		this.staffID = staffID;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getStaffAddress() {
		return staffAddress;
	}
	public void setStaffAddress(String staffAddress) {
		this.staffAddress = staffAddress;
	}
	public String getStaffNoTel() {
		return staffNoTel;
	}
	public void setStaffNoTel(String staffNoTel) {
		this.staffNoTel = staffNoTel;
	}
	public String getStaffEmail() {
		return staffEmail;
	}
	public void setStaffEmail(String staffEmail) {
		this.staffEmail = staffEmail;
	}
	public String getStaffPos() {
		return staffPos;
	}
	public void setStaffPos(String staffPos) {
		this.staffPos = staffPos;
	}
	public String getManagerID() {
		return managerID;
	}
	public void setManagerID(String managerID) {
		this.managerID = managerID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}

	
}
