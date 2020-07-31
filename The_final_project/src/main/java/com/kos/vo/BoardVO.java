package com.kos.vo;

import java.util.ArrayList;
import java.util.List;

public class BoardVO implements Board {
	
	private int boardno;
	private String title;
	private String contents;
	private String regdate;
	private String id;
	private int boardView;
	
	private int boardLike;
	private int boardBad;
	private String nickname;
	private String searchword="";
	
	
	
	
	public String getSearchword() {
		return searchword;
	}
	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	//어떤 게시판인지 구분하는 변수 맵퍼에서 사용
	private String b_boardname;
	
	//해당 게시판의 총게시물 수
	private int total_board;
	
	//현재 페이지 기본 값 1 
	private int nowpage=1;
	
	//현재 보여지는 게시물수 기본값 30
	private int viewing_count=30;

	//농사인 게시판에서 추가로 사용하는 멤버 변수
	private String selected;
	private String selectDate;
	private int selectPoint;
	
	private int replno;
	
	public int getReplno() {
		return replno;
	}
	public void setReplno(int replno) {
		this.replno = replno;
	}
	public int getBoardView() {
		return boardView;
	}
	public void setBoardView(int boardView) {
		this.boardView = boardView;
	}
	public int getBoardLike() {
		return boardLike;
	}
	public void setBoardLike(int boardLike) {
		this.boardLike = boardLike;
	}
	public int getBoardBad() {
		return boardBad;
	}
	public void setBoardBad(int boardBad) {
		this.boardBad = boardBad;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}
	public int getSelectPoint() {
		return selectPoint;
	}
	public void setSelectPoint(int selectPoint) {
		this.selectPoint = selectPoint;
	}
	public String getB_boardname() {
		return b_boardname;
	}
	public void setB_boardname(String b_boardname) {
		this.b_boardname = b_boardname;
	}
	public int getTotal_board() {
		return total_board;
	}
	public void setTotal_board(int total_board) {
		this.total_board = total_board;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getViewing_count() {
		return viewing_count;
	}
	public void setViewing_count(int viewing_count) {
		this.viewing_count = viewing_count;
	}
	public String getSelected() {
		return selected;
	}
	public void setSelected(String selected) {
		this.selected = selected;
	}
	
	//영문 게시판 이름을 한글로 치환하는 메소드 원할 때 추가 하세요
	public static String changeword(String name) {
		String result="";
		System.out.println(name);
		if (name.equals("free_board")){
			result="자유게시판";
		}
		
		if (name.equals("tip_board")){
			result="팁게시판";
		}
		
		if (name.equals("nongsain")){
			result="농사in게시판";
		}
		
		
		
		
		return result;
	}
	
	//전체 게시판의 이름을 리스트로 돌려주는 메소드
	public List<String> allBoardList(){
		ArrayList<String> list = new ArrayList<String>();
		
		list.add(0, "free_board");
		list.add(1, "tip_board");
		list.add(2, "nongsain");
		list.add(3, "parcel_board");
		
		
		
		return list;
	}
	
	
}
	
	
	
