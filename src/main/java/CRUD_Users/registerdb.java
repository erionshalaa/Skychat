package CRUD_Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class registerdb {
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
	
	public String insert(User user) {
		loadDriver(dbDriver);
		Connection conn = getConnection();
		String result = "";
		String sql = "INSERT INTO users VALUES(?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPword());
			ps.setString(3, user.getFname());
			ps.setString(4, user.getLname());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "";
		}
		return result;
		
		
	}
	
	

	public boolean validate(User user) {
		loadDriver(dbDriver);
		Connection conn = getConnection();
		boolean status = false;
		String sql = "select * from users where email = ? and password = ?";
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPword());
			
			ResultSet rs = ps.executeQuery();
			
			status = rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}

	
}
