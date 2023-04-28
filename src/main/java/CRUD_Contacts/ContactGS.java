package CRUD_Contacts;



public class ContactGS {
	private String name,phone,email,company,message;
	
	
	
	public ContactGS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContactGS(String name, String phone, String email, String company, String message) {
		super();
		this.name = name;
		this.email = email;
		this.company = company;
		this.message = message;
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}

