package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {	return instance;}
	private MemberDAO() {}
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		String dbURL = "jdbc:mysql://localhost:3306/ajaxMemberDB?serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPassword = "root";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		
		return conn;
	}
	
	public ArrayList<MemberVO> memberList() {
		 ArrayList<MemberVO> list=new ArrayList<MemberVO>();
		 try {
		   getConnection();
		   ps=conn.prepareStatement("select * from member");
		   rs=ps.executeQuery(); 
		   while(rs.next()) {
		
			   MemberVO member=new MemberVO();
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setReg_date(rs.getString("reg_date"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));
			   list.add(member);		   
		   }
		 } catch (Exception e) {
	    e.printStackTrace();
		 }finally {
			dbClose();
		 }	 
		 return list;
	}//memberList

	
	public int insertMember(MemberVO member) {
		int check =0;
		try {
			conn = getConnection();

			ps = conn.prepareStatement("INSERT INTO member VALUES (?,?,?,now(),?,?)");
			ps.setString(1, member.getId());
			ps.setString(2, member.getPasswd());
			ps.setString(3, member.getName());
			ps.setString(4, member.getAddress());
			ps.setString(5, member.getTel());
			check = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return check;
	}

	// 로그인 폼 처리(loginPro.java)페이지의 사용자 인증 처리 및 ajax 
	public int userCheck(String id, String passwd) {
		int x = 0;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("SELECT passwd FROM member WHERE id=?");
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {// 해당 아이디가 있으면 수행 // 첫번째줄 한줄 가져옴 
				String dbPasswd = rs.getString(1); // 컬럼1번째있는
				if(passwd.equals(dbPasswd)) {
					x = 1; // 인증성공
				}
			} else {// 해당 아이디 없으면 수행
				x = -1;// 아이디 없음
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return x;
	}

	// 아이디 중복 확인 (confirm.java)에서 아이디의 중복 여부를 확인하는 메소드
	public int confirmId(String id) {
		int x = 0;

		try {
			conn = getConnection();

			ps = conn.prepareStatement("select id from member where id = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next())// 아이디 존재
				x = 1; // 같은 아이디 있음
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return x; // 같은 아이디없으면 0 
	}

	// 회원 정보 수정 폼을 위한 기존 가입 정보를 가져오는 메소드
	public MemberVO getMember(String id, String passwd) {
		MemberVO member = null;

		try {
			conn = getConnection();

			ps = conn.prepareStatement("select * from member where id = ? ");
			ps.setString(1, id);
			rs = ps.executeQuery();

			if (rs.next()) {// 해당 아이디에 대한 레코드가 존재

				member = new MemberVO();// 데이터저장빈 객체생성
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setReg_date(rs.getString("reg_date"));
				member.setAddress(rs.getString("address"));
				member.setTel(rs.getString("tel"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return member;
	}
	// 회원정보 수정 ajax updatePro.jsp 수행 

	public int updateMember(MemberVO member) {
		int x = 0;

		try {
			conn = getConnection();
			ps = conn.prepareStatement("update member set name=?,address=?,tel=? where id=? and passwd=?");
			
				ps.setString(1, member.getName());
				ps.setString(2, member.getAddress());
				ps.setString(3, member.getTel());
				ps.setString(4, member.getId());
				ps.setString(5, member.getPasswd());
			
				
				x= ps.executeUpdate();// 회원정보 수정 처리 성공 하면 1 리턴 :  executeUpdate() 는 처리된 레코드(row) 갯수를 리턴

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return x;
	}

	// 회원 탈퇴 처리(deletePro.java)에서 회원 정보를 삭제하는 메소드 ajax 
	public int deleteMember(String id, String passwd) {
		int x = 0;

		try {
			conn = getConnection();
			String dbPw ="";
			ps = conn.prepareStatement("select passwd from member where id = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dbPw = rs.getString(1);
			}

			if (dbPw.equals(passwd)) {
				ps = conn.prepareStatement("delete from member where id=?");
				ps.setString(1, id);
				x = ps.executeUpdate();// 회원탈퇴처리 성공
			}else {
				x= -1;// 비밀번호 불일치 
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			dbClose();
		}
		return x;
	}
	
	public void dbClose() {
		  try { 
		   if(rs!=null) rs.close();
		   if(ps!=null) ps.close();
		   if(conn!=null) conn.close();
		  }catch(Exception e) {
			  e.printStackTrace();
		  }
	}  
}