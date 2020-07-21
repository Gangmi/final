package com.kos.service;

import java.util.List;

import com.kos.vo.BoardVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList(BoardVO vo);
	public void writeBoard(BoardVO vo);
	BoardVO viewBoard(BoardVO vo);

}
