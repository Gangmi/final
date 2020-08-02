package com.kos.vo;

import java.util.HashMap;
import java.util.List;

public class ImageDetectVO {
BoardVO vo;
	
	public ImageDetectVO(BoardVO vo) {
		this.vo=vo;
	}
	
	public HashMap detecting() {
		HashMap hs = new HashMap();
		//게시판 분기 나누기
		int boardno=0;
		if(vo.getB_boardname().equals("free_board")) {
			boardno=1;
		}
		if(vo.getB_boardname().equals("tip_board")) {
			boardno=2;
		}
		hs.put("boardno",boardno);
		
		
		//게시판 이름 가져오기
		hs.put("boardname", vo.getB_boardname());
		
		
		//글번호 가져오기
		
		hs.put("writeno", vo.getBoardno());
		
		return hs;
		
		
	}
}
