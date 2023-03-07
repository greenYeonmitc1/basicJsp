package com.myspring.kurly.manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.kurly.buy.BuyDTO;
import com.myspring.kurly.item.ItemDTO;

@Repository
public class ManagerDAO {

	@Autowired
	DataSource dataSource;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int getCustomerCnt() {
		int cnt = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT COUNT(*) FROM cart";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		return cnt;
	}	
	
	public int getItemCnt() {
		int cnt = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT COUNT(*) FROM item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		return cnt;
	}
	
	public int getOrderCnt() {
		int cnt = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT COUNT(*) FROM buy";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		return cnt;
	}	
	
	public int checkManager(String id, String pw) {
		int check = 0;
		try {
			conn = dataSource.getConnection();
			System.out.println("id = " + id);
			System.out.println("pw = " + pw);;
			
			String sql = "SELECT * FROM manager WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		
		return check;
	}
	
	public void insertNewItem(ItemDTO dto) {
		try {
			conn = dataSource.getConnection();
			
			int maxNum = 0;
			String sql = "SELECT MAX(item_number) FROM item";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxNum = rs.getInt(1);
			}
			
			sql = "INSERT INTO item (item_number, item_category, item_name, item_price, item_stock, item_image, item_info, discount_rate, reg_date, sold)";
			sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, now(), 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, maxNum+1);
			pstmt.setString(2, dto.getItem_category());
			pstmt.setString(3, dto.getItem_name());
			pstmt.setInt(4, dto.getItem_price());
			pstmt.setInt(5, dto.getItem_stock());
			pstmt.setString(6, dto.getItem_image());
			pstmt.setString(7, dto.getItem_info());
			pstmt.setInt(8, dto.getDiscount_rate());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
	}
	
	public ArrayList<ItemDTO> getOneItem(int item_number) {
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM item WHERE item_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_number);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ItemDTO dto = new ItemDTO();
				
				dto.setItem_number(rs.getInt("item_number"));
				dto.setItem_category(rs.getString("item_category"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setItem_price(rs.getInt("item_price"));
				dto.setItem_stock(rs.getInt("item_stock"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setItem_info(rs.getString("item_info"));
				dto.setDiscount_rate(rs.getInt("discount_rate"));
				dto.setReg_date(rs.getString("reg_date"));
				dto.setSold(rs.getInt("sold"));
				
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		
		return list;
	}
	
	public String getItemImage(int item_number) {
		
		String item_image = "";
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT item_image FROM item WHERE item_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_number);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				item_image = rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		
		return item_image;
	}
	
	public void updateItem(ItemDTO dto) {
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE item SET item_category=?, item_name=?, item_price=?, item_stock=?, item_image=?, item_info=?, discount_rate=? WHERE item_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getItem_category());
			pstmt.setString(2, dto.getItem_name());
			pstmt.setInt(3, dto.getItem_price());
			pstmt.setInt(4, dto.getItem_stock());
			pstmt.setString(5, dto.getItem_image());
			pstmt.setString(6, dto.getItem_info());
			pstmt.setInt(7, dto.getDiscount_rate());
			pstmt.setInt(8, dto.getItem_number());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
		}
	}
	
	public void deleteItem(int item_number) {
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "DELETE FROM item WHERE item_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item_number);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
		}
		
	}
	
	public ArrayList<BuyDTO> getAllOrderList() {
		ArrayList<BuyDTO> orderList = new ArrayList<BuyDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM buy";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BuyDTO dto = new BuyDTO();
				
				dto.setCustomer_id(rs.getString("customer_id"));
				dto.setCustomer_name(rs.getString("customer_name"));
				dto.setCart_number(rs.getInt("cart_number"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setBuy_count(rs.getInt("buy_count"));
				dto.setItem_image(rs.getString("item_image"));
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setHowpay(rs.getString("howpay"));
				dto.setAddress(rs.getString("address"));
				
				orderList.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}	
		
		return orderList;
	}
	
}

