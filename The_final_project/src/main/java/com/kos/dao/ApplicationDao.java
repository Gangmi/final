package com.kos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.SmartFarmApplicationVO;

@Repository("ApplicationDao")
public class ApplicationDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public int farmerApplicationInsert(FarmerApplicationVO applicationVO) {
		return mybatis.insert("Aplication.FarmerInsert", applicationVO);
	}
	
	public List<FarmerApplicationVO> farmerApplicationSelect(FarmerApplicationVO applicationVO){
		return mybatis.selectList("Aplication.FarmerSelect", applicationVO);
	}
	public int smartFarmApplicationInsert(SmartFarmApplicationVO applicationVO) {
		return mybatis.insert("Aplication.SmartFarmInsert", applicationVO);
	}
	
	public List<SmartFarmApplicationVO> smartFarmApplicationSelect(SmartFarmApplicationVO applicationVO){
		return mybatis.selectList("Aplication.SmartFarmSelect", applicationVO);
	}
	public int smartFarmApplicationSelectCount() {
		return mybatis.selectOne("Aplication.SmartFarmSelectTotalCount");
	}
}
