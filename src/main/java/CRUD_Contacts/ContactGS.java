package CRUD_Contacts;



public class ContactGS {
	private String contact_id,name,phone,email,company,message;
	

	public ContactGS() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ContactGS(String contact_id,String name, String phone, String email, String company, String message) {
		super();
		this.name = name;
		this.email = email;
		this.company = company;
		this.message = message;
		this.phone = phone;
		this.contact_id = contact_id;
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
	public String getContact_id() {
		return contact_id;
	}
	public void setContact_id(String contact_id) {
		this.contact_id = contact_id;
	}
	
}

