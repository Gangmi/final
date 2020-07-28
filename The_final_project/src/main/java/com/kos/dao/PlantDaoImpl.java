package com.kos.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.kos.vo.PlantVO;

@Repository("PlantDao")
public class PlantDaoImpl implements PlantDao {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<PlantVO> selectPlant(PlantVO vo) {
		System.out.println("===> Mybatis selectPlant() 호출");
		return mybatis.selectList("Plant.selectPlant", vo);
	}
}
   
