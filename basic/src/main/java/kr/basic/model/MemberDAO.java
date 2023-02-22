package kr.basic.model;

import java.util.ArrayList;

public class MemberDAO {

	private ArrayList<MemberVO> list;
	private MemberDAO() {
		list = new ArrayList();
		setDummy();
	}
	
	static private MemberDAO instance = new MemberDAO();
	static public MemberDAO getInstance() {
		return instance;
	}
	
	void setDummy() {
		list.add(new MemberVO("admin","admin","관리자","남성"));
		list.add(new MemberVO("qwer","1111","이만수","남성"));
		list.add(new MemberVO("abcd","2222","박영희","여성"));
		list.add(new MemberVO("hello","3333","이수민","여성"));
	}
	
	// 멤버 전체 출력
	
	public ArrayList<MemberVO> getAllMemberList(){
		return list;
	}
	// 아이디체크 
	public int checkId(String id) {
		
		for(int i =0; i < list.size(); i++) {
			
			if(list.get(i).getId().equals(id)) {
				return i;
			}
		}
		
		return -1;
		
	}
	
	// 페스워드 체크 
	
	public boolean checkPw(String pw, int idx) {
//		if(list.get(idx).getPw().equals(pw)) {
//			return true;
//		}else {
//			return false;
//		}
		return list.get(idx).getPw().equals(pw);
	}
	
	// 멤버 한명 가져오기
	public MemberVO getAMember(int idx) {
		return list.get(idx);
	}
	
	
	// 멤버 삭제
	
	public void deleteMember(int idx) {
		list.remove(idx);
	}
	
	// 멤버 추가 
	
	public void addMember(String id, String pw, String name, String gender) {
		list.add(new MemberVO(id,pw,name,gender));
	}
	
	// 멤버 수정 
	public void updateMember(int idx, String name, String gender) {
		
		MemberVO member = list.get(idx);
		member.setGender(gender);
		member.setName(name);
		
	}
	
	
	
	
	
}
