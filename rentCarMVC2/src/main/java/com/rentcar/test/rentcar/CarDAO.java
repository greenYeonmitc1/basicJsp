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
	
   public CarVO getOneCar(int no) {
	   CarVO vo = new CarVO();

		try {
			
			conn = DBUtil.getConnection();

			String sql = "SELECT * FROM rentcar where no =? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {

				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setCategory(rs.getInt(3));
				vo.setPrice(rs.getInt(4));
				vo.setUsepeople(rs.getInt(5));
				vo.setCompany(rs.getString(6));
				vo.setImg(rs.getString(7));
				vo.setInfo(rs.getString(8));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,ps,rs);
		}

	   return vo;
   }
	
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
	
	int getMaxNo() {
		 
		int num = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*), max(no) from rentcar";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				System.out.println("test==" + cnt + " : " + rs.getInt(2) );
			     if(rs.getInt(1)> 0) {
			    	 num = rs.getInt(2);
			     }
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,ps,rs);
		}
		return num+1;
		
	}
	
	public int addCar(CarVO vo) {
		int maxNo = getMaxNo();
		
		int cnt =0;
		try {
			
			conn = DBUtil.getConnection();
			String sql = "insert into rentcar values(?,?,?,?,3,?,?,?)";
	
			ps = conn.prepareStatement(sql);
			    
			ps.setInt(1,maxNo);
			ps.setString(2, vo.getName());
			ps.setInt(3,vo.getCategory());
			ps.setInt(4,vo.getPrice());
			//ps.setInt(5,vo.getUsepeople());
			ps.setString(5,vo.getCompany());
			ps.setString(6,vo.getImg());
			ps.setString(7,vo.getInfo());
			
			cnt = ps.executeUpdate();

	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbclose(conn,ps,rs);
		}
		
		return cnt;

		
	}

	
}
