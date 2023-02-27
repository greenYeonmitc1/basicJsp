package kr.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;

public class BoardDAO {
	Connection conn; // db연동객체
	PreparedStatement ps; // 명령문 객체
	ResultSet rs; // mysql -> select -> 결과테이블을 저장

	// conn 객체 안에 ps 객체 안에 rs 객체
	// rs.close -> ps->close -> conn->close

	private BoardDAO() {
	}

	static private BoardDAO instance = new BoardDAO();

	static public BoardDAO getInstance() {
		return instance;
	}

	// 매번 getConnection을 해주는데 : 생성 삭제
	private void getConnection() {
		String url = "jdbc:mysql://localhost:3306/test?charaterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String pw = "root";
		/*
		 * try { Class.forName("com.mysql.cj.jdbc.Driver");
		 * conn=DriverManager.getConnection(url, user, pw); } catch
		 * (ClassNotFoundException e) { e.printStackTrace(); } catch (SQLException e) {
		 * e.printStackTrace(); }
		 */
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("db연동 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	public ArrayList<BoardVO> getAllList() {
		String sql = "select * from board";
		// select 문은 항상 결과테이블 리턴 ->ResultSet 객체로 리턴값을 저장 
		getConnection(); // db 연동
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			ps = conn.prepareStatement(sql); // 명령문 준비
			rs = ps.executeQuery(); // alt+x -> 명령문 실행 
			// rs.next() -> 데이터 값(레코드: 한줄 row) 있으면 true 
			while(rs.next()) {
				BoardVO b = new BoardVO();
				
				// rs.get자료형타입("컬럼이름")
				//
				b.setNo(rs.getInt("no"));
				b.setWriter(rs.getString("writer"));
				b.setSubject(rs.getString("subject"));
				b.setContents(rs.getString("contents"));
				b.setRegDate(rs.getString("regDate"));
				list.add(b);
			}
			
			
		} catch (SQLException e) {
	
			e.printStackTrace();
		}finally {
			dbClose(); //db 연동 해제 
		}
		
		return list;
	}

	public int getMaxNo() {
		int max =0;
		String sql ="select max(no) from board";
		getConnection(); // 1. db연동한다 
		
		try {
			ps = conn.prepareStatement(sql);// 2. 쿼리명령문 준비
			// select 문이니깐 rs 객체를 통해서 ps 쿼리문 실행 
			rs = ps.executeQuery(); // 3. ? 가 있으면 셋팅 ? 없으면 쿼리 명령문 실행 
			// rs는 뷰테이블 값 
			if(rs.next()) {
				max = rs.getInt(1); // 첫번째 줄의 첫번째 컬럼값 
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return max+1;

	}
	
	public void createSet10Dummies() {
		int no = getMaxNo(); // 그 다음 넘버 
		for(int i =0; i < 10; i++) {
			String writer ="작성자"+no;
			String subject="제목"+no;
			String contents="내용"+no;
			no+=1;
			if(insertBoard(writer,subject,contents) == 0) {
				i--;
			}
		}
	}
	
	public int insertBoard(String writer, String subject,String contents) {
		int cnt =0;
		String sql = "insert into board(writer,subject,contents,regDate) values(?,?,?,curdate())";
		getConnection();
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, writer);
			ps.setString(2, subject);
			ps.setString(3, contents);
			cnt = ps.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return cnt;
	}
	
	public BoardVO getABoard(int no) {
		String sql="select * from board where no = ?";
		getConnection();
		
		BoardVO vo = new BoardVO();
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				vo.setNo(no);
				vo.setWriter(rs.getString("writer"));
				vo.setSubject(rs.getString("subject"));
				vo.setContents(rs.getString("contents"));
				vo.setRegDate(rs.getString("regDate"));
			}else {
				vo = null;
				System.out.println(" no 없음 ");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return vo;
	}

	public int updateBoard(int no, String subject, String contents) {
	                                   //     1           2            3
		String sql ="update board set subject=? , contents=? where no = ?";
		getConnection();
		int cnt =0;
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, contents);
			ps.setInt(3, no);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return cnt;
		
	}
	
	
	public int removeAllList() {
		String sql = "delete from board";
		int cnt =0;
		getConnection();
		try {
			ps = conn.prepareStatement(sql);
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return cnt;
				
	}
	
	public int removeABoard(int no) {
		String sql ="delete from board where no = ? ";
		int cnt =0;
		getConnection();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt = ps.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		
		return cnt;
	}

	void dbClose() {
  // db 사용되는 자원 반납 -> 연동 끊기 
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
