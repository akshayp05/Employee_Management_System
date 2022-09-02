package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	private static Connection con=null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	String user="root";
	String password="root";
	String url="jdbc:mysql://localhost:3306/employee_data";
	con=DriverManager.getConnection(url,user,password);
	return con ;
	}

}
