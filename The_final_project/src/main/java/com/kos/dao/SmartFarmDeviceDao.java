package com.kos.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.SmartFarmDeviceVO;

@Repository("SmartFarmDeviceDao")
public class SmartFarmDeviceDao {
	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<SmartFarmDeviceVO> selectDevice(SmartFarmDeviceVO smartFarmDeviceVo){
		return mybatis.selectList("SmartFarm.select",smartFarmDeviceVo);
	}
}
