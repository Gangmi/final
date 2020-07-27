package com.kos.vo;

public class UploadImageVO {
	private int boardno;
	private String boardname;
	private int writeno;
	private String imgName;
	private String istemp;
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getWriteno() {
		return writeno;
	}
	public void setWriteno(int writeno) {
		this.writeno = writeno;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getIstemp() {
		return istemp;
	}
	public void setIstemp(String istemp) {
		this.istemp = istemp;
	}
}
