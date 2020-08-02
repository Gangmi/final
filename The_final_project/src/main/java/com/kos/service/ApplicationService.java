package com.kos.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.ApplicationDao;
import com.kos.vo.FarmerApplicationVO;

@Service("ApplicationService")
public class ApplicationService {
	@Autowired
	ApplicationDao applicationDao;
	public int applyFarmer(FarmerApplicationVO applicationVO) {
		return applicationDao.farmerApplicationInsert(applicationVO);
	}
}
