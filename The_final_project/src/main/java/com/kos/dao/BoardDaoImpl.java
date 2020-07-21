package com.kos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public List<BoardVO> getBoardList() {
		
		
		return mybatis.selectList("getBoardList");
		// TODO Auto-generated method stub
		
		
	}
	

}
