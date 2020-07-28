package com.kos.vo;

public class ReplNameVO {
	
	BoardVO vo;
	public ReplNameVO(BoardVO vo) {
		this.vo = vo;
		
	}
	
	public String changeName() {
		String result = "";
		if (vo.getB_boardname().equals("free_board")) {
			result = "free_repl";
		}
		if (vo.getB_boardname().equals("tip_board")) {
			result = "tip_repl";
		}
		if (vo.getB_boardname().equals("parcel_board")) {
			result = "parcel_repl";
		}
	}
}
