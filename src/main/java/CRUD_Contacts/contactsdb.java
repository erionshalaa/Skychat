package CRUD_Contacts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class contactsdb {
	private String dbUrl = "jdbc:sqlserver://E-User;databaseName=chatapp;integratedSecurity=true;encrypt=false;";
	private String dbUname = "root";
	private String dbPassword = "";
	private String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public String insert(ContactGS contact) {
		loadDriver(dbDriver);
		Connection conn = getConnection();
		String result = "";
		String sql = "INSERT INTO contacts VALUES(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, contact.getName());
			ps.setString(2, contact.getPhone());
			ps.setString(3, contact.getEmail());
			ps.setString(4, contact.getCompany());
			ps.setString(5, contact.getMessage());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "";
		}
		return result;
		
		
	}

	
}
