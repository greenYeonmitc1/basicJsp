package com.rentcar.test.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class MemberDAO {
	private MemberDAO() {
	}

	private static MemberDAO dao = new MemberDAO();
 
	public static MemberDAO getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
}
