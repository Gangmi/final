package com.kos.dao;

import java.util.List;

import com.kos.vo.PlantVO;

public interface PlantDao {

	public List<PlantVO> selectPlant(PlantVO vo);
 
}
