package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kos.dao.ApplicationDao;
import com.kos.dao.AuthorityDao;
import com.kos.dao.SmartFarmDeviceDao;
import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.PagingVO;
import com.kos.vo.SmartFarmApplicationVO;
import com.kos.vo.SmartFarmDeviceVO;

@Service("ApplicationService")
public class ApplicationService {
	@Autowired
	ApplicationDao applicationDao;
	@Autowired
	AuthorityDao authorityDao;
	@Autowired
	SmartFarmDeviceDao smartFarmDeviceDao;
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
	
	public int SmartFarApplicatingTotalCount(SmartFarmApplicationVO applicationVO) {
		return applicationDao.smartFarmApplicationSelectCount(applicationVO);
	}
	
	public List<SmartFarmApplicationVO> selectPageCertificate(SmartFarmApplicationVO applicationVO,PagingVO paging) {
		return applicationDao.smartFarmApplicationSelect(applicationVO, paging);
	}
	
	@Transactional
	public int applicationApprove(SmartFarmApplicationVO applicationVO,SmartFarmDeviceVO deviceVO) throws Exception {
		try {
			int result = applicationDao.smartFarmApplicationUpdate(applicationVO);
			System.out.println("result " +result);
			if(result<1) {
				throw new Exception();
			}else {
				int result1 = authorityDao.roleInsert(applicationVO.getId(), "ROLE_SMART_FARMER");
				if(result1<1) {
					throw new Exception();
				}else {
					int result2=smartFarmDeviceDao.approve(deviceVO);
					if(result2<1) {
						throw new Exception();
					}else {
						return 0;
					}
				}
			}
		}catch (Exception e) {e.printStackTrace();return -1;}
	}
	public List<SmartFarmApplicationVO> selectSmartFarmList(SmartFarmApplicationVO applicationVO) {
		return applicationDao.selectSmartFarmList(applicationVO);
		// TODO Auto-generated method stub
		
	}
}
