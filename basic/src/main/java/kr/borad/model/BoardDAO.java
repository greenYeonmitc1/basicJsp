package kr.borad.model;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;


public class BoardDAO {
	ArrayList<BoardVO> list;
	private BoardDAO() {
		list = new ArrayList<BoardVO>();
		setDummy();
	}
	static private BoardDAO instance = new BoardDAO();
	static public BoardDAO getInstance() {
		return instance;
	}
	
	private void setDummy() {
		list.add(new BoardVO(1,"작성자1","제목1","내용1","2022-02-01"));
		list.add(new BoardVO(2,"작성자2","제목2","내용2","2022-02-02"));
		list.add(new BoardVO(3,"작성자3","제목3","내용3","2022-02-03"));	
	}
	
	public ArrayList<BoardVO> getAllList(){
		return list;
	}
	
	public int getMaxNo() {
//		int max =0;
//		for(BoardVO vo : list) {
//			if(vo.getNo() > max) {
//				max = vo.getNo();
//			}
//		}
		if(list.size() == 0) {
			return 0;
		}else {
			BoardVO maxNoBoard = Collections.max(list);
			return maxNoBoard.getNo();
		}
	}
	
	public void createSet10Dummies() {
		int no = getMaxNo(); // 3 
		for(int i =0; i < 10; i++) {
			no+=1; // 4
			BoardVO b = new BoardVO();
			b.setNo(no);
			b.setWriter("작성자"+no);
			b.setSubject("제목"+no);
			b.setContents("내용"+no);
			b.setRegDate(""+LocalDate.now());
			list.add(b);
		}
	}
	
	
}
