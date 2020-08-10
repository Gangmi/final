package com.kos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.FarmVO;
@Repository("FarmDao")
public class FarmDaoImpl implements FarmDao {
	@Autowired
	SqlSessionTemplate mybatis;
	@Override
	public List<FarmVO> selectFarmList(FarmVO farmVO) {
		return mybatis.selectList("Farm.select",farmVO);
	}

	public int insertFarm(FarmVO farmVO) {
		return mybatis.insert("Farm.insert",farmVO);
	}
	public int deleteFarm(FarmVO farmVO) {
		return mybatis.delete("Farm.delete", farmVO);
	}
}
