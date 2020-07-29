package com.kos.vo;

public class PagingVO {

	private int nowpage; 			// 현재 페이지
	private int startpage; 			// 시작 페이지
	private int endpage; 			// 끝 페이지
	private int total; 				// 게시글 총 갯수
	private int cntPerPage = 20; 	// 페이지당 글 갯수
	private int lastPage; 			// 마지막 페이지
	private int start; 				// SQL 검색시 시작
	private int end; 				// SQL 검색시 끝
	private int cntPage; 			// 보여질 페이징 수
	private String boardname;		// 페이지당 게시물 검색시 필요한 게시판 이름
	private String searchword;

	// gettger setter
	
	
	
	
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

	// 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	/*
	 * //보여지기 시작페이지 수 계산 [1] [2] [3] [4] [5] >> public void calcStartEndPage(int
	 * nowPage, int cntPage) { setEndpage(((int)Math.ceil((double)nowPage /
	 * (double)cntPage)) * cntPage); if (getLastPage() < getEndpage()) {
	 * setEndPage(getLastPage()); } setStartPage(getEndPage() - cntPage + 1); if
	 * (getStartPage() < 1) { setStartPage(1); } }
	 */

	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

}