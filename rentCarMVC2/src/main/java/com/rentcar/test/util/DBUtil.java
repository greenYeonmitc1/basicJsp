package com.rentcar.test.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

	public class DBUtil {
		
		public static Connection getConnection() {
			Connection conn = null;
			String dbURL = "jdbc:mysql://localhost:3306/rentcardb?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			     conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		
	
		public static void dbclose(Connection conn, PreparedStatement ps, ResultSet rs) {
			if (rs != null) {
				try {	rs.close();} catch (SQLException e) { }
			}
			if (ps != null) {
				try {	ps.close();} catch (SQLException e) { }
			}
			if (conn != null) {
				try {	conn.close();} catch (SQLException e) { }
			}
		}
		
	}

