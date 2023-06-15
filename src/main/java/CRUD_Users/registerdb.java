package CRUD_Users;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Dashboard_Messages.Friends;
import java.util.List;
import CRUD_Users.usertest;


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
	public User getUserByEmail1(String email) {
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
	            user.setId(rs.getString("userid"));
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
	public void addfriend(int user1Id, int user2Id) {
	    loadDriver(dbDriver);
	    Connection conn = getConnection();
	    String sql = "INSERT INTO friends (user_id_1, user_id_2) VALUES (?, ?)";
	    PreparedStatement ps = null;
	    
	    try {
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, user1Id);
	        ps.setInt(2, user2Id);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public List<Friends> getFriends(int yourId) throws SQLException {
	    List<Friends> friends = new ArrayList<>();

	    // SQL query to retrieve friend data from the friendship table, excluding your ID
	    String sqlQuery = "SELECT u.userid, u.name, u.surname FROM friends f " +
	                      "JOIN users u ON f.user_id_1 = u.userid OR f.user_id_2 = u.userid " +
	                      "WHERE (f.user_id_1 = ? OR f.user_id_2 = ?) " +
	                      "AND u.userid != ?";

	    Connection conn = getConnection();
	    try (PreparedStatement statement = conn.prepareStatement(sqlQuery)) {
	        // Set the parameter values to exclude your ID
	        statement.setInt(1, yourId);
	        statement.setInt(2, yourId);
	        statement.setInt(3, yourId);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                int friendId = resultSet.getInt("userid");
	                String name = resultSet.getString("name");
	                String surname = resultSet.getString("surname");
	                Friends friend = new Friends(friendId, name, surname);
	                friends.add(friend);
	            }
	        }
	    }

	    return friends;
	}

	public boolean isFriendAdded(int loggedInUserId, int friendId) {
	    // Connect to the database
	    Connection conn = getConnection(); 
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        // Prepare and execute the SQL query to check if the user is already a friend
	        String sql = "SELECT COUNT(*) FROM friends WHERE (user_id_1 = ? AND user_id_2 = ?) OR (user_id_1 = ? AND user_id_2 = ?)";
	        stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, loggedInUserId);
	        stmt.setInt(2, friendId);
	        stmt.setInt(3, friendId);
	        stmt.setInt(4, loggedInUserId);
	        rs = stmt.executeQuery();

	        // Check if the query returned any rows
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            return count > 0;
	        }

	        return false;
	    } catch (SQLException e) {
	        // Handle any exceptions
	        e.printStackTrace();
	        return false;
	    } 
	}
	public String updateUser(User user) {
	    loadDriver(dbDriver);
	    Connection conn = getConnection();
	    String result = "";
	    String sql = "UPDATE users SET email = ?, name = ?, surname = ? WHERE userid = ?";
	    PreparedStatement ps;

	    try {
	        ps = conn.prepareStatement(sql);
	        
	        ps.setString(1, user.getEmail());
	        ps.setString(2, user.getFname());
	        ps.setString(3, user.getLname());
	        ps.setString(4, user.getId()); 
	        int rowsAffected = ps.executeUpdate();

	        if (rowsAffected > 0) {
	            result = "Credentials updated successfully.";
	        } else {
	            result = "No user found with the given ID.";
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        result = "Error updating credentials.";
	    } 
	    return result;
	}
	

	


}
