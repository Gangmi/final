package com.kos.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Testdao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void test2() {
		String result=sqlSession.selectOne("testmap.test2");
		System.out.println(result);
	}
}
