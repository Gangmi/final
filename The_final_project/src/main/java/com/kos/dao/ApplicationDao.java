package com.kos.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.FarmerApplicationVO;

@Repository("ApplicationDao")
public class ApplicationDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public int farmerApplicationInsert(FarmerApplicationVO applicationVO) {
		return mybatis.insert("Aplication.FarmerInsert", applicationVO);
	}
}