package Perform;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnection {
    public static void main(String[] args) throws ClassNotFoundException {
        try{
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	String connectionUrl = 
        			"jdbc:sqlserver://E-User;databaseName=chatapp;integratedSecurity=true;encrypt=false;";
        	Connection connection = DriverManager.getConnection(connectionUrl);
        	System.out.println("Connected");
        }
        catch (SQLException e) {
        	System.out.println("Connection failed");
            e.printStackTrace();
        }
    }
}