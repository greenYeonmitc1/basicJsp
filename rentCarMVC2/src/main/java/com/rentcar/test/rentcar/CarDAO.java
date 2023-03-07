package com.rentcar.test.rentcar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.rentcar.test.util.DBUtil;


public class CarDAO {
	private CarDAO() {
	}

	private static CarDAO dao = new CarDAO();
 
	public static CarDAO getInstance() {
		return dao;
	}

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ArrayList<CarVO> getSelectCar() {
		
		ArrayList<CarVO> list = new ArrayList<CarVO>();

		try {
			
			conn = DBUtil.getConnection();

			String sql = "SELECT * FROM rentcar ORDER BY no DESC";
			// String sql = "SELECT * FROM rentcar ORDER BY no DESC LIMIT 3";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {

				CarVO bean = new CarVO();
			    
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCategory(rs.getInt(3));
				bean.setPrice(rs.getInt(4));
				bean.setUsepeople(rs.getInt(5));
				bean.setCompany(rs.getString(6));
				bean.setImg(rs.getString(7));
				bean.setInfo(rs.getString(8));
				
				list.add(bean);
				count++;
				
				if (count > 2)
					break; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,ps,rs);
		}

		return list;
	}

	
}
