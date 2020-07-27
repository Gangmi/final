package com.kos.dao;

import java.util.HashMap;
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
	public List<BoardVO> getBoardList(BoardVO vo) {
		
		//전체 페이지수 구하기(vo board name)
		
		//해당 게시판 전체 게시물 갯수 구하기
		int total_board_count=mybatis.selectOne("board.getBoardCount",vo);
		System.out.println(total_board_count+"############# 전체카운트");
		//전체 카운트에서 현재 보이는 페이지를 나눈 나머지가 1보다 크면 나눈값에 1을 더함
		int temppage=total_board_count/vo.getViewing_count();
		int addpage=total_board_count%vo.getViewing_count();
		int totalpage=0;
		
		//나머지가있으면
		if(addpage>0) {
			totalpage=(temppage+1);
		
		//없으면
		}else {
			totalpage=temppage;
		}
		System.out.println(totalpage);
	
		
		//현재페이지와 보여지는 갯수에따른 게시물 검색(hashmap)
		
		int end = vo.getNowpage() * vo.getViewing_count();
	
		
		int start = end - (vo.getViewing_count() - 1);
		
		//hashmap에 담기
		HashMap hs = new HashMap();
		
		hs.put("startrow", start);
		hs.put("endrow",end);
		hs.put("b_boardname",vo.getB_boardname());
		List<BoardVO> result=mybatis.selectList("board.getBoardList",hs);
		
		//nowpage멤버변수를 이용해서 total page를 저장
		if(result.size()>0) {
		result.get(0).setNowpage(totalpage);
		}
		
		return result;
	
		
		
	}


	@Override
	public void writeBoard(BoardVO vo) {
		//글저장하기
		mybatis.insert("board.writeboard",vo);
		
	}

	@Override
	public BoardVO viewBoard(BoardVO vo) {
		//조회수올리기
		mybatis.update("board.upviewcount",vo);
		BoardVO result=mybatis.selectOne("board.viewboard",vo);
		result.getBoardView();
		
		return result;
	}
	

}
