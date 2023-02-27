package kr.board.model;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collections;


public class BoardDAOList {
	ArrayList<BoardVO> list;
	private BoardDAOList() {
		list = new ArrayList<BoardVO>();
		setDummy();
	}
	static private BoardDAOList instance = new BoardDAOList();
	static public BoardDAOList getInstance() {
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
	
	public void addBoardList(String writer, String subject,String contents) {
		BoardVO b = new BoardVO();
		b.setNo(getMaxNo()+1);
		b.setWriter(writer);
		b.setSubject(subject);
		b.setContents(contents);
		b.setRegDate(""+LocalDate.now());
		list.add(b);
	}
	
	public BoardVO getABoard(int idx) {
		if(idx < 0 || idx >= list.size()) {
			return null;
		}
		return list.get(idx);
	}
	
	public void updateBoard(int idx, String subject, String contents) {
		BoardVO board = list.get(idx);
		board.setSubject(subject);
		board.setContents(contents);
		
	}
	
	
	public void removeAllList() {
		list.clear();
	}
	
	public int removeABoard(int idx) {
		if(idx < 0 || idx >= list.size()) {
			return -1;
		}
		list.remove(idx);
		return 1;
	}
	
	public ArrayList<BoardVO> getPageData(String curPageNo) {
		ArrayList<BoardVO> showList = new ArrayList<BoardVO>();
		int count = list.size();
		int limit = 5;
		int pageNo = 0;
		if(curPageNo== null) {
			pageNo =1;
		}else {
			pageNo = Integer.parseInt(curPageNo);
		}
		
		int start = (pageNo-1)* limit;
		int end = start + limit;
		if(end > count) {
			end = count;
		}
		// end 포함하면 안됨 index 이기 때문에 0~end 전까지 
		for(int i = start; i <end;i++) {
			showList.add(list.get(i));
		}
		
		
		return showList;
		
	}
	
	public int[] addPageNextBefore(String end) {
	
		int count = list.size();
		int limit = 5;
		int totalPageNum = count/ limit;
		if(count%limit != 0 ) {
			totalPageNum++;
		}
		int pageLimit = 3;
		int startPage = 1;

		if(end != null) {
			startPage = Integer.parseInt(end);
		}
	
		             // 3 + 3 => 6  -1    --->   3 4 5  
		//               1 +3 => 4 -1 = 3 
		int endPage = startPage + pageLimit -1;
		if(endPage > totalPageNum) {
			endPage = totalPageNum;
		}
		
		int[] nums = {startPage, endPage, pageLimit,totalPageNum};
		return nums;
	}
	
	
	
}
