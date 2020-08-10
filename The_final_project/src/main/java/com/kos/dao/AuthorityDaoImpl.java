package com.kos.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.AuthorityVO;

@Repository("AuthorityDao")
public class AuthorityDaoImpl implements AuthorityDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int roleInsert(String id,String role) {
		AuthorityVO authorityVO= new AuthorityVO();
		authorityVO.setId(id);
		authorityVO.setRole(role);
		return mybatis.insert("Role.insert",authorityVO );
	}

	public int roleDelete(String id, String role) {
		AuthorityVO authorityVO= new AuthorityVO();
		authorityVO.setId(id);
		authorityVO.setRole(role);
		return mybatis.delete("Role.delete", authorityVO);
	}
	public List<AuthorityVO> roleSelect(String id) {
		return mybatis.selectList("Role.select",id);
	}
}
