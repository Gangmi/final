package com.kos.service;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.kos.dao.BoardDao;

import com.kos.vo.BoardVO;
import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO;
import com.kos.vo.UploadImageVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		// TODO Auto-generated method stub

		return dao.getBoardList(vo);

	}

	@Override
	public void writeBoard(BoardVO vo) {
		// TODO Auto-generated method stub

		dao.writeBoard(vo);

	}

	@Override
	public BoardVO viewBoard(BoardVO vo) {

		return dao.viewBoard(vo);
	}

	@Override
	public void storeImage(UploadImageVO imgvo) {
		dao.storeImage(imgvo);

	}

	public void writeRepl(BoardVO vo) {
		dao.writeRepl(vo);

	}

	

	@Override
	public int updateBoard(BoardVO vo) {

		return dao.updateBoard(vo);
	}

	
	public void deleteBoard(BoardVO vo) {

		try {
			dao.deleteBoard(vo);
		} catch (Exception e) {			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void delRepl(BoardVO vo) {
		dao.delRepl(vo);
		
	}

	public void modifyRepl(BoardVO vo) {
		dao.modifyRepl(vo);
		
	}

	public BoardVO getRepl(BoardVO vo) {

		return dao.getRepl(vo);
	}
	
	
	
	public List<BoardVO> viewBoardRepl(BoardVO vo) {
		//댓글의 총 갯수를 가져온다.
		int replnum = dao.viewBoardReplCount(vo);
		//댓글 페이징할떄 필요한 값들을 넣어준다.
		
		PagingVO page = new PagingVO(replnum, vo.getNowpage(), vo.getViewing_replcount());
		//게시판 이름과 게시글번호 
		page.setB_boardname(vo.getB_boardname());
		page.setBoardno(vo.getBoardno());
		List<BoardVO> result = dao.viewBoardRepl(page);
		result.get(0).setNowpage(page.getLastPage());//페이징 버튼 만들 떄 필요
		return result;
	}
	

}
