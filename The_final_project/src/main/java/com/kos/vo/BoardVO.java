package com.kos.vo;

public class BoardVO {
	
	private String b_num;
	private String b_title;
	private String b_contents;
	private String b_date;
	private String m_id;
	private int b_like;
	private int b_bad;
	private int b_view;
	
	
	//어떤 게시판인지 구분하는 변수 맵퍼에서 사용
	private String b_boardname;
	
	//해당 게시판의 총게시물 수
	private int total_board;
	
	//현재 페이지 기본 값 1 
	private int nowpage=1;
	
	//현재 보여지는 게시물수 기본값 30
	private int viewing_count=30;

	//농상인 게시판에서 추가로 사용하는 멤버 변수
	private String b_select;
	private String b_seldate;
	private int b_point;
	
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getTotal_board() {
		return total_board;
	}
	public void setTotal_board(int total_board) {
		this.total_board = total_board;
	}
	public int getViewing_count() {
		return viewing_count;
	}
	public void setViewing_count(int viewing_count) {
		this.viewing_count = viewing_count;
	}
	public String getB_boardname() {
		return b_boardname;
	}
	public void setB_boardname(String b_boardname) {
		this.b_boardname = b_boardname;
	}
	public String getB_num() {
		return b_num;
	}
	public void setB_num(String b_num) {
		this.b_num = b_num;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_contents() {
		return b_contents;
	}
	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_bad() {
		return b_bad;
	}
	public void setB_bad(int b_bad) {
		this.b_bad = b_bad;
	}
	public int getB_view() {
		return b_view;
	}
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}
	public String getB_select() {
		return b_select;
	}
	public void setB_select(String b_select) {
		this.b_select = b_select;
	}
	public String getB_seldate() {
		return b_seldate;
	}
	public void setB_seldate(String b_seldate) {
		this.b_seldate = b_seldate;
	}
	public int getB_point() {
		return b_point;
	}
	public void setB_point(int b_point) {
		this.b_point = b_point;
	}
	
	

}
