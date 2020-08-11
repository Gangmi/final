package com.kos.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.AuthorityVO;
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
	
	//관리자페이지 신청서 리스트
	public List<FarmerApplicationVO> farmerApplicationSelect(FarmerApplicationVO applicationVO, PagingVO pagingVO){
		HashMap map = new HashMap();
		map.put("application", applicationVO);
		map.put("paging",pagingVO);
		return mybatis.selectList("Aplication.FarmerSelectPage", map);
	}
	public int farmerApplicationCount(FarmerApplicationVO farmerApplicationVO) {
		return mybatis.selectOne("Aplication.farmerCountPage",farmerApplicationVO);
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

	public int farmerApplicationUpdate(FarmerApplicationVO applicationVO) {
		return mybatis.update("Aplication.FarmerUpdate",applicationVO);
	}
	
	public int farmerApplicationCancel(FarmerApplicationVO applicationVO) {
		return mybatis.update("Aplication.FarmerCancel",applicationVO);
	}

	public List<FarmerApplicationVO> FarmerChart(FarmerApplicationVO applicationVO) {
		return mybatis.selectList("Aplication.FarmerChart",applicationVO);
	}
	
	

}
