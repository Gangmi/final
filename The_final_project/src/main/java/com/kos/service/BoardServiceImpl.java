package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kos.dao.BoardDao;

import com.kos.vo.BoardVO;
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

	public List<BoardVO> viewBoardRepl(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.viewBoardRepl(vo);
	}

	@Override
	public int updateBoard(BoardVO vo) {

		return dao.updateBoard(vo);
	}

	public void deleteBoard(BoardVO vo) {

		try {
			dao.deleteBoard(vo);
		} catch (Exception e) { // TODO Auto-generated catch block
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
		System.out.println("service");
		return dao.getRepl(vo);
	}

	// 좋아요싫어요를 올리는 곳
	
	public boolean likeOrBad(BoardVO vo) {
		String rawBoardName=vo.getB_boardname();
		// 먼저 좋아요 싫어요를 누른적이 있는지 검사
		int result = dao.detectLikeOrBad(vo);
		System.out.println("좋아요 싫어요 클릭한 적이 있음?" + result);

		// 누른적이 없다면 db업데이트를 시작
		if (result == 0) {
			//원래의 boardname으로 설정
			vo.setB_boardname(rawBoardName);
			
			try {
				//vo를 dao로 전달
				int updatedone=dao.updateLikeBad(vo);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		//누른적이 있다면,
		}else {
			return false;
		}
		//정상적으로 다 됐다면
		return true;

	}
}
