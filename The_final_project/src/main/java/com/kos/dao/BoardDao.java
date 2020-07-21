package com.kos.dao;

import java.util.List;


import com.kos.vo.BoardVO;

public interface BoardDao {

	public List<BoardVO> getBoardList(BoardVO vo);
	public void writeBoard(BoardVO vo);
	BoardVO viewBoard(BoardVO vo);
}
