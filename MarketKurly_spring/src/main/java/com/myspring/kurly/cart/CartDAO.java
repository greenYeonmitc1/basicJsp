package com.myspring.kurly.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	DataSource dataSource;
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void insertCart(CartDTO dto) {
		int cart_number = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT MAX(cart_number) FROM cart";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cart_number = rs.getInt(1);
			}
			
			sql = "INSERT INTO cart(cart_number, buyer,item_name,buy_price,buy_count,item_image) VALUES(?, ?, ?, ?, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number+1);
			pstmt.setString(2, dto.getBuyer());
			pstmt.setString(3, dto.getItem_name());
			pstmt.setInt(4, dto.getBuy_price());
			pstmt.setInt(5, dto.getBuy_count());
			pstmt.setString(6, dto.getItem_image());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
	}
	
	public ArrayList<CartDTO> getCartList(String id){
		ArrayList<CartDTO> cartlist = new ArrayList<CartDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM cart WHERE buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				
				dto.setCart_number(rs.getInt("cart_number"));
				dto.setBuyer(rs.getString("buyer"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setBuy_price(rs.getInt("buy_price"));
				dto.setBuy_count(rs.getInt("buy_count"));
				dto.setItem_image(rs.getString("item_image"));
				
				cartlist.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
			if(rs != null) { try { rs.close(); } catch(SQLException e) {} }
		}
		
		return cartlist;
	}
	
	public int getItemCount(String id) {
		int cnt = 0;
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT COUNT(*) FROM cart WHERE buyer=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
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
	
	public void deleteCart(int cart_number) {
		try {
			conn = dataSource.getConnection();
			
			String sql = "DELETE FROM cart WHERE cart_number=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart_number);
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(conn != null) { try { conn.close(); } catch(SQLException e) {} }
			if(pstmt != null) { try { pstmt.close(); } catch(SQLException e) {} }
		}
	}
	
	
}










