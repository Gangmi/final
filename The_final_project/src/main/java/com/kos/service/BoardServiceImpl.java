package com.kos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.BoardDaoImpl;
import com.kos.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDaoImpl dao;

	@Override
	public BoardVO getBoardList() {
		// TODO Auto-generated method stub
		
		return null;
		
	}
	
	
	
}
