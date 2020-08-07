package com.kos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.MemberVO;

@Repository("MemberDao")
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int memberInsert(MemberVO memberVo) {
		return mybatis.insert("Member.insert",memberVo);
	}

	@Override
	public List<MemberVO> memberSelect(MemberVO memberVo) {
		return mybatis.selectList("Member.select",memberVo);
	}

	@Override
	public int memberUpdate(MemberVO memberVo) {
		return mybatis.update("Member.update",memberVo);
	}
	public String memberProfileImg(MemberVO memberVO) {
		return mybatis.selectOne("Member.profile",memberVO);
	}

}
