package CRUD_Users;



public class User {
	private String fname,lname,email,pword;

	
	
	public User() {
		super();
	}

	public User(String fname, String lname, String email, String pword) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.pword = pword;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPword() {
		return pword;
	}

	public void setPword(String pword) {
		this.pword = pword;
	}
	
	
}

