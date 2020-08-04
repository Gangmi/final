package com.kos.service;

import java.util.List;

import com.kos.vo.BoardVO;
import com.kos.vo.UploadImageVO;

public interface BoardService {
	
	public List<BoardVO> getBoardList(BoardVO vo);
	public void writeBoard(BoardVO vo);
	BoardVO viewBoard(BoardVO vo);
	public void storeImage(UploadImageVO imgvo);
	public int updateBoard(BoardVO vo);
	public void deleteBoard(BoardVO vo);
	public boolean likeOrBad(BoardVO vo);

}
