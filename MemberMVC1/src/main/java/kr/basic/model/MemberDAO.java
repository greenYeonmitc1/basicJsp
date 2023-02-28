package kr.basic.model;

//JDBC->myBatis, JPA
import java.sql.*;
import java.util.ArrayList;

public class MemberDAO {
	
	private MemberDAO() {}
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
		
// 직접 mysql 명령문 사용해서 연결방식 -> 수동 
	
	
private Connection conn; // 1. db 연동 객체 : mysql, oracle ... (url, id, pw)
private PreparedStatement ps; //2. 명령문을 미리 로딩 객체(? 제외하고 나머지부분 준비시킴) -> 미리 명령문 test 
private ResultSet rs;

// c(creat)r(read)u(update)d(delete)
// 데이터베이스 연동 1.값 읽어오기 ->ps.executeQuery() 실행 -> 결과 rs 객체 
// 쓰고,수정,삭제 -> db의 내용 변경 -> ps.executeUpdate() 실행 

// 데이터베이스 연결객체 생성(Connection)
public void getConnect() {
	   //데이터베이스접속URL
	   String URL="jdbc:mysql://localhost:3306/test?characterEncoding=UTF-8&serverTimezone=UTC";
	   String user="root";
	   String password="root";
	   // MySQL Driver Loading

		  //동적로딩(실행시점에서 객체를 생성하는 방법)
		  // Class.forName("com.mysql.cj.jdbc.Driver"); mysql 8.0버전 이상
		  // Class.forName("com.mysql.jdbc.Driver"); mysql 8.0버전 이상
		  
		  // 클래스 로딩 1. 컴파일과정(미리로딩) 2.런타임과정(프로그램이 실행하는 도중 ) 
		  
		  // Reflection.getCallerClass() -> 클래스 동적 바이딩 
		  
		  // webapp -> WEB-INF -> lib -> mysql-connector-java-8.0.15.jar
	   try {
		  Class.forName("com.mysql.cj.jdbc.Driver"); // 	
		  conn=DriverManager.getConnection(URL, user, password);
		  System.out.println("db 연동성공: " + conn );
	   }catch(ClassNotFoundException e) {
		   
		   e.printStackTrace();
	   }catch(SQLException e) {
		   e.printStackTrace();
	   }
}   
// 회원저장 동작
public int memberInsert(MemberVO vo) {
	
	//sql 쿼리문 => 명령문 
	
	  //                                                        
	 // String sql="insert into member(id,pass,name,age,email,phone) values('test7','7777','테스트7',37,'test7@test.com','010-1111-1234')";
   //                               1    2     3    4     5      6 ?(파라메터) 1 2 3 4 5 6   
	String SQL="insert into member(id, pass, name, age, email, phone) values(?,?,?,?,?,?)"; 
	// 매번 db 연동을 해줘야지 -> 최신 db 정보값을 받아온다  
	getConnect(); // 1. db객체를 연동한다 
	  // SQL문장을 전송하는 객체 생성
	  int cnt=-1;
	  try {
		ps=conn.prepareStatement(SQL); //미리 컴파일을 시킨다.(속도가빠르기) : 명령문 미리 대기 : 명령문객체
		ps.setString(1, vo.getId());
		ps.setString(2, vo.getPass());
		ps.setString(3, vo.getName());
		ps.setInt(4, vo.getAge());
		ps.setString(5, vo.getEmail());
		ps.setString(6, vo.getPhone());
		//   ps.executeUpdate(); 하게되면 실행 완료 1 row affected -> 한줄 영향을 미쳤다 
 		// 한줄 추가적으로 성공했으면 1 리턴 실패 0 리턴 
		
		cnt=ps.executeUpdate(); //전송(실행)
		
	   }catch (Exception e) {
		e.printStackTrace();
	   }finally {
		   dbClose();
	  }
	  return cnt; // 1 or 0
}
// 회원(VO)전체 리스트(ArrayList) 가져오기
public ArrayList<MemberVO> memberList() {
	 String SQL="select * from member";
	 getConnect();
	 ArrayList<MemberVO> list=new ArrayList<MemberVO>();
	 try {
	   ps=conn.prepareStatement(SQL);
	   rs=ps.executeQuery(); // rs->커서
	   while(rs.next()) {
		   int num=rs.getInt("num");
		   String id=rs.getString("id");
		   String pass=rs.getString("pass");
		   String name=rs.getString("name");		   
		   int age=rs.getInt("age");
		   String email=rs.getString("email");
		   String phone=rs.getString("phone");
		   // 묶고->담고
		   MemberVO vo=new MemberVO(num, id, pass, name, age, email, phone);
		   list.add(vo);		   
	   }
	 } catch (Exception e) {
    e.printStackTrace();
	 }finally {
		dbClose();
	 }	 
	 return list;
}//memberList


public String checkMemberId(String id) {
	 String SQL="select pass from member where id=?";
	 getConnect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
		rs=ps.executeQuery();
		 if(rs.next()) {
			 return rs.getString("pass");
		 }
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return null;
}

public int getMemberNo(String id) {
	 String SQL="select num from member where id=?";
	 getConnect();

	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1, id);
		rs=ps.executeQuery();
		 if(rs.next()) {
			 return rs.getInt("num");
		 }
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return -1;
}



public int memberDelete(String id) {
	 String SQL="delete from member where id=?";
	 getConnect();
	 int cnt=-1;
	 try {
	   ps=conn.prepareStatement(SQL);
	   ps.setString(1,id);
	   cnt=ps.executeUpdate();// 1 or 0	   
	 } catch (Exception e) {
		e.printStackTrace();
	 }finally {
		dbClose();
	}	   
	 return cnt;
}//memberDelete


public MemberVO memberContent(int num) {
	   String SQL="select * from member where num=?";
	   getConnect();
	   MemberVO vo=null;
	   try {
		 ps=conn.prepareStatement(SQL);
		  ps.setInt(1,num);
		 rs=ps.executeQuery();
		 if(rs.next()) {
			 //회원한명의 정보를 가져와서->묶고(VO)
			   String id=rs.getString("id");
			   String pass=rs.getString("pass");
			   String name=rs.getString("name");		   
			   int age=rs.getInt("age");
			   String email=rs.getString("email");
			   String phone=rs.getString("phone");
			   vo=new MemberVO(num, id, pass, name, age, email, phone);
		 }
	   } catch (Exception e) {
		 e.printStackTrace();
	   }finally {
		  dbClose();
	   }	
	   return vo;
}
public int memberUpdate(MemberVO vo) {
	   String SQL="update member set age=?, email=?, phone=? where num=?";
	   getConnect();
	   int cnt=-1;
	   try {
	   	ps=conn.prepareStatement(SQL);
	   	ps.setInt(1, vo.getAge());
	   	ps.setString(2, vo.getEmail());
	   	ps.setString(3, vo.getPhone());
	   	ps.setInt(4, vo.getNum());	   	
	   	cnt=ps.executeUpdate();	   	
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		dbClose();
	}	   
	   return cnt;
}
// 데이터베이스 연결 끊기
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
