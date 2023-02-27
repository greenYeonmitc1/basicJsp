package kr.board.model;

public class BoardVO implements Comparable<BoardVO>{
	  private int no; // 게시글 번호 자동으로 1씩 증가 
	  private String writer; //작성자
	  private String subject;//제목
	  private String contents;//내용
	  private String regDate;//작성일
	  public BoardVO() {}  
	public BoardVO(int no, String writer, String subject, String contents, String regDate) {
		super();
		this.no = no;
		this.writer = writer;
		this.subject = subject;
		this.contents = contents;
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public int compareTo(BoardVO board) {
		return (this.no > board.no) ?1:-1 ;
	}
	  
}
