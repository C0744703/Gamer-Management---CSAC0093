package user.management.model;

public class Sub_user {
	
	private String Email_Address;
	private String	Password;
	private String  First_Name;
	private String Last_Name;
	private String Date_Of_Birth;
	
	private String Access_Type;
	private String Phone_Number;
	private String	Department;

	private String Adrress;
	private String Postal;
	
	public Sub_user() {
		// TODO Auto-generated constructor stub
	}

	public String getEmail_Address() {
		return Email_Address;
	}

	public void setEmail_Address(String email_Address) {
		Email_Address = email_Address;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getFirst_Name() {
		return First_Name;
	}

	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}

	public String getLast_Name() {
		return Last_Name;
	}

	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
	}

	public String getDate_Of_Birth() {
		return Date_Of_Birth;
	}

	public void setDate_Of_Birth(String date_Of_Birth) {
		Date_Of_Birth = date_Of_Birth;
	}

	public String getAccess_Type() {
		return Access_Type;
	}

	public void setAccess_Type(String access_Type) {
		Access_Type = access_Type;
	}

	public String getPhone_Number() {
		return Phone_Number;
	}

	public void setPhone_Number(String phone_Number) {
		Phone_Number = phone_Number;
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
		return "Sub_user [Email_Address=" + Email_Address + ", Password=" + Password + ", First_Name=" + First_Name
				+ ", Last_Name=" + Last_Name + ", Date_Of_Birth=" + Date_Of_Birth + ", Access_Type=" + Access_Type
				+ ", Phone_Number=" + Phone_Number + ", Department=" + Department + ", Adrress=" + Adrress + ", Postal="
				+ Postal + "]";
	}
	
	
	
}
