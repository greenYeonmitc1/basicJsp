package com.rentcar.test.reseveCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class CarReserveDAO {

	private CarReserveDAO() {
	}

	private static CarReserveDAO dao = new CarReserveDAO();
 
	public static CarReserveDAO getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	
}
