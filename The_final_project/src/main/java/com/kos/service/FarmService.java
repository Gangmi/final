package com.kos.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.FarmDao;
import com.kos.vo.FarmVO;
import com.kos.vo.MemberVO;

@Service("FarmService")
public class FarmService {
	@Autowired
	FarmDao farmDao;
	
	
	public List<FarmVO> selectFarmList(FarmVO farmVo){
		return farmDao.selectFarmList(farmVo);
	}
}
