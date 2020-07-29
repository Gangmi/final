package com.kos.vo;

public class PlantVO implements Plant {
	private int plantId;
	private String plantCate;
	private String plantTitles;
	private String plantInfo;
	 
	
	//해당 게시판의 총게시물 수
	private int total_plant;
		
	//현재 페이지 기본 값 1  
	private int nowpage=1; 
		 
	//현재 보여지는 게시물수 기본값 30 
	private int viewing_count=30;
 
	  
	public int getTotal_plant() {
		return total_plant;
	}
	public void setTotal_plant(int total_plant) {
		this.total_plant = total_plant;
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
	public int getPlantId() {
		return plantId;
	}
	public void setPlantId(int plantId) {
		this.plantId = plantId;
	}
	public String getPlantCate() { 
		return plantCate;
	}
	public void setPlantCate(String plantCate) {
		this.plantCate = plantCate;
	}
	public String getPlantTitles() {
		return plantTitles;
	}
	public void setPlantTitles(String plantTitles) {
		this.plantTitles = plantTitles;
	}
	public String getPlantInfo() {
		return plantInfo; 
	}
	public void setPlantInfo(String plantInfo) {
		this.plantInfo = plantInfo;
	} 
	
}
