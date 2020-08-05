package com.kos.vo;

public class PlantVO implements Plant {
	private int plantid;
	private String plantcate;
	private String planttitles;
	private String plantinfo; 
	 
	private int block;
  
	public int getBlock() {
		return block; 
	}

	public void setBlock(int block) {
		this.block = block;
	}

	//해당 게시판의 총게시물 수  
	private int total_plant;
		 
	//현재 페이지 기본 값 1  
	private int nowpage=1;  
		 
	//현재 보여지는 게시물수 기본값 30 
	private int viewing_count = 30; 

	// getter & setter    
	  
	public int getPlantid() {
		return plantid; 
	}

	public void setPlantid(int plantid) {
		this.plantid = plantid; 
	}

	public String getPlantcate() {
		return plantcate;
	}

	public void setPlantcate(String plantcate) {
		this.plantcate = plantcate;
	}

	public String getPlanttitles() {
		return planttitles;
	}

	public void setPlanttitles(String planttitles) {
		this.planttitles = planttitles;
	}

	public String getPlantinfo() {
		return plantinfo;
	} 

	public void setPlantinfo(String plantinfo) {
		this.plantinfo = plantinfo;
	}

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
	 
}
