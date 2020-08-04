package com.kos.dao;

import java.util.List;

import com.kos.vo.BoardVO;
import com.kos.vo.PagingVO;
import com.kos.vo.UploadImageVO;

public interface BoardDao {

	public List<BoardVO> getBoardList(BoardVO vo);

	public void writeBoard(BoardVO vo);

	public BoardVO viewBoard(BoardVO vo);

	public void storeImage(UploadImageVO imgvo);

	public int updateBoard(BoardVO vo);

	public void deleteBoard(BoardVO vo)throws Exception;

	public void writeRepl(BoardVO vo);

	public List<BoardVO> viewBoardRepl(PagingVO page);

	public void delRepl(BoardVO vo);

	public void modifyRepl(BoardVO vo);

	public BoardVO getRepl(BoardVO vo);

	public int viewBoardReplCount(BoardVO vo);
}
