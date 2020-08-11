package com.kos.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.PagingVO;
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
	public List smartFarmApplicationSelect(SmartFarmApplicationVO applicationVO,PagingVO paging){
		HashMap hashMap = new HashMap();
		hashMap.put("applicate", applicationVO);
		hashMap.put("paging", paging);
		return mybatis.selectList("Aplication.SmartFarmSelectPage", hashMap);
	}
	public int smartFarmApplicationSelectCount(SmartFarmApplicationVO applicationVO) {
		return mybatis.selectOne("Aplication.SmartFarmSelectTotalCount",applicationVO);
	}
	
	public int smartFarmApplicationUpdate(SmartFarmApplicationVO applicationVO) {
		return mybatis.update("Aplication.SmartFarmUpdate",applicationVO);
	}
	
	public List<SmartFarmApplicationVO> selectSmartFarmList(SmartFarmApplicationVO applicationVO){
		System.out.println(applicationVO.getId());
		return mybatis.selectList("Aplication.SmartFarmSelect",applicationVO);
	}
}
