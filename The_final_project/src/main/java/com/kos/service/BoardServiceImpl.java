package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kos.dao.BoardDaoImpl;
import com.kos.vo.BoardVO;
import com.kos.vo.PlantVO;
import com.kos.vo.UploadImageVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDaoImpl dao;

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

	
	
	
}
