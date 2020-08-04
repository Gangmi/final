package com.kos.vo;

public class PagingVO {

	private int nowpage; 			// 현재 페이지
	private int startpage; 			// 시작 페이지
	private int endpage; 			// 끝 페이지
	private int total; 				// 게시글 총 갯수
	private int cntPerPage = 30; 	// 페이지당 글 갯수
	private int lastPage; 			// 마지막 페이지
	private int start; 				// SQL 검색시 시작
	private int end; 				// SQL 검색시 끝
	private int cntPage=5; 			// 보여질 페이징 수
	private String boardname;		// 페이지당 게시물 검색시 필요한 게시판 이름
	private String searchword="";

	private int boardno;
	private String b_boardname;

	private int totalblock;
	private int nowblock;
	


	// gettger setter 
	 



	public String getB_boardname() {
		return b_boardname;
	}

	public void setB_boardname(String b_boardname) {
		this.b_boardname = b_boardname;
	}

	public PagingVO(){
		
	}  
	
	public int getBoardno() {
		return boardno;
	}


	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	
	public String getBoardname() {
		return boardname;
	}

	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}

	public int getNowpage() {
		return nowpage;
	}

	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}

	public int getStartpage() {
		return startpage;
	}

	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}

	public int getEndpage() {
		return endpage;
	} 

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

//method

	// 처음 객체가 만들어질 때 사용되는 함수
	public PagingVO(int total, int nowPage, int cntPerPage) {
		this.total = total;
		this.nowpage = nowPage;
		this.cntPerPage = cntPerPage;

		calcLastPage(getTotal(), getCntPerPage());
		// calcStartEndPage(getNowpage(), cntPage);
		calcStartEnd(getNowpage(), getCntPerPage());
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}	

	// 진짜마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 보여지기 시작페이지 수 계산 [1] [2] [3] [4] [5] >>
	public void calcStartEndPage(int nowPage, int cntPage) {
		//현재 페이지와 블록당보여줄 페이지수 전체 카운트, 페이지당 보여줄 갯수
	
		//전체 블록 계산
		totalblock=(int)Math.ceil(((double)lastPage/(double)cntPage));
		
		//현재 페이지를 보여줄 페이지로 나눈 값을 올림하면 현재 블록
		nowblock=(int)Math.ceil((double)nowPage/(double)cntPage);
	
	
	}

	
		
		
		
		
		
		
		
		
		
		//보여줄마지막 페이지
		// 보여줄 마지막 페이지 = (int)현재페이지 / 사용자에게 보여줄 페이지수=5 * 5 
		// 만약 진짜 마지막페이지가 보여줄 마지막 페이지보다 작다면
		// 보여줄 마지막 페이지는 진짜 마지막 페이지로 한다.
//		setEndpage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
//		if (getLastPage() < getEndpage()) {
//			setEndpage(getLastPage());
//		}
		
		// 보여줄 마지막 페이지에서 보여줄 페이지수를빼고 1을 더한것을 시작 페이지로 한다.
		//ex) 
		//만약
//		setStartpage(getEndpage() - cntPage + 1);
//		if (getStartpage() < 1) {
//			setStartpage(1);
//		}
		
		
		
	

}
