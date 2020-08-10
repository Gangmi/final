package com.kos.dao;

import java.util.List;

import com.kos.vo.FarmVO;

public interface FarmDao {
	public List<FarmVO> selectFarmList(FarmVO farmVo);
	public int insertFarm(FarmVO farmVO);
	public int deleteFarm(FarmVO farmVO);
	}
