package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.SmartFarmDeviceDao;
import com.kos.vo.SmartFarmDeviceVO;

@Service("SmartFarmDeviceService")
public class SmartFarmDeviceService {
	@Autowired
	SmartFarmDeviceDao smartFarmDeviceDao;
	
	public SmartFarmDeviceVO seletDevice(SmartFarmDeviceVO smartFarmDeviceVo,int index) {
		return smartFarmDeviceDao.selectDevice(smartFarmDeviceVo).get(index);
	}
	public List seletDevice(SmartFarmDeviceVO smartFarmDeviceVo) {
		return smartFarmDeviceDao.selectDevice(smartFarmDeviceVo);
	}
}
