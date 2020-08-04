package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kos.dao.ApplicationDao;
import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.SmartFarmApplicationVO;

@Service("ApplicationService")
public class ApplicationService {
	@Autowired
	ApplicationDao applicationDao;
	
	@Transactional
	public FarmerApplicationVO applyFarmer(FarmerApplicationVO applicationVO) throws Exception {
		
		int result = applicationDao.farmerApplicationInsert(applicationVO);
		if (result<1)
		{
			throw new Exception();
		}else {
			
			applicationVO= applicationDao.farmerApplicationSelect(applicationVO).get(0);
		}
		return applicationVO;
	}
	@Transactional
	public SmartFarmApplicationVO applySmartFarm(SmartFarmApplicationVO applicationVO) throws Exception {
		
		int result = applicationDao.smartFarmApplicationInsert(applicationVO);
		if (result<1)
		{
			throw new Exception();
		}else {
			
			applicationVO= applicationDao.smartFarmApplicationSelect(applicationVO).get(0);
		}
		return applicationVO;
	}
	
	public int SmartFarApplicatingTotalCount() {
		return applicationDao.smartFarmApplicationSelectCount();
	}
}
