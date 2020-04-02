package user.management.model;

public class User {
	private int userId;
	private String userEmail;
	private String userName;
	private String userLastName;
	private String userPassword;
	private String userConfPassword;
	private String userDob;
	private String userCaptcha;
	private String userCity;
	private String userPhn;
	
	private String Access_Type;
	
	private String	Department;

	private String Adrress;
	private String Postal;
	
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserConfPassword() {
		return userConfPassword;
	}

	public void setUserConfPassword(String userConfPassword) {
		this.userConfPassword = userConfPassword;
	}

	public String getUserDob() {
		return userDob;
	}

	public void setUserDob(String userDob) {
		this.userDob = userDob;
	}

	public String getUserCaptcha() {
		return userCaptcha;
	}

	public void setUserCaptcha(String userCaptcha) {
		this.userCaptcha = userCaptcha;
	}

	public String getUserCity() {
		return userCity;
	}

	public void setUserCity(String userCity) {
		this.userCity = userCity;
	}

	public String getUserPhn() {
		return userPhn;
	}

	public void setUserPhn(String userPhn) {
		this.userPhn = userPhn;
	}

	public String getAccess_Type() {
		return Access_Type;
	}

	public void setAccess_Type(String access_Type) {
		Access_Type = access_Type;
	}

	public String getDepartment() {
		return Department;
	}

	public void setDepartment(String department) {
		Department = department;
	}

	public String getAdrress() {
		return Adrress;
	}

	public void setAdrress(String adrress) {
		Adrress = adrress;
	}

	public String getPostal() {
		return Postal;
	}

	public void setPostal(String postal) {
		Postal = postal;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userEmail=" + userEmail + ", userName=" + userName + ", userLastName="
				+ userLastName + ", userPassword=" + userPassword + ", userConfPassword=" + userConfPassword
				+ ", userDob=" + userDob + ", userCaptcha=" + userCaptcha + ", userCity=" + userCity + ", userPhn="
				+ userPhn + ", Access_Type=" + Access_Type + ", Department=" + Department + ", Adrress=" + Adrress
				+ ", Postal=" + Postal + "]";
	}

	
	
	
	
	
	
	
	
	
	

}
