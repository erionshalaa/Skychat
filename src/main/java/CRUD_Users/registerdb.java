package CRUD_Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



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
		String sql = "INSERT INTO users(name,surname,email,password,salt) VALUES(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPword());
			ps.setString(3, user.getFname());
			ps.setString(4, user.getLname());
			ps.setString(5, user.getSalt());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "";
		}
		return result;
		
		
	}
	
	
	public User getUserByEmail(String email) {
		loadDriver(dbDriver);
		Connection conn = getConnection();
	    PreparedStatement stmt;
	    ResultSet rs = null;
	    User user = null;
	    String query = "SELECT * FROM users WHERE email = ?";
	    try {
	        
	        stmt = conn.prepareStatement(query);
	        stmt.setString(1, email);
	        rs = stmt.executeQuery();
	        if (rs.next()) {
	            user = new User();
	            user.setFname(rs.getString("name"));
	            user.setLname(rs.getString("surname"));
	            user.setEmail(rs.getString("email"));
	            user.setPword(rs.getString("password"));
	            user.setSalt(rs.getString("salt"));
	         
	        }
	    } catch (SQLException e) {
	    } 
	    return user;
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
	public boolean checkAccess(User user) {
		loadDriver(dbDriver);
		Connection conn = getConnection();
		boolean access = false;
		String sql = "select access from users where email = ? and password = ?";
		PreparedStatement ps;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getPword());
			
			try(ResultSet rs = ps.executeQuery()){
				if (rs.next()) {
		            String role = rs.getString("access");
		            if (role.equals("user")) {
		                access = true;
		            }
	            }
	        }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return access;
	}
	

	public ArrayList<User> selectallusers() {
	    loadDriver(dbDriver);
	    Connection conn = getConnection();
	    ArrayList<User> users = new ArrayList<>();
	    String sql = "SELECT * FROM users";
	    PreparedStatement ps;
	    try {
	        ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	        	String id = rs.getString("userid");
	            String email = rs.getString("email");
	            String fname = rs.getString("name");
	            String lname = rs.getString("surname");
	            String pword = rs.getString("password");
	            String access = rs.getString("access");
	            User user = new User(id,fname,lname,email,pword,access);
	            users.add(user);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return users;
	}
	public void changeAccessToAdmin(int userId) {
		 loadDriver(dbDriver);
		 Connection conn = getConnection();
		 String sql = "UPDATE users SET access='admin' where userid=?";
		 PreparedStatement ps;
		 try {
			 ps = conn.prepareStatement(sql);
			 ps.setInt(1, userId);
		     ps.executeUpdate();
		 }
		 catch(SQLException e ) {
			 e.printStackTrace();
		 }
	}
	public void changeAccessToUser(int userId) {
		 loadDriver(dbDriver);
		 Connection conn = getConnection();
		 String sql = "UPDATE users SET access='user' where userid=?";
		 PreparedStatement ps;
		 try {
			 ps = conn.prepareStatement(sql);
			 ps.setInt(1, userId);
		     ps.executeUpdate();
		 }
		 catch(SQLException e ) {
			 e.printStackTrace();
		 }
	}
	
}
