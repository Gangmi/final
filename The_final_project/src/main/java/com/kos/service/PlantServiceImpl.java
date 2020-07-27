package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.PlantDaoImpl;
import com.kos.vo.PlantVO; 

@Service
public class PlantServiceImpl implements PlantService{

	@Autowired
	PlantDaoImpl dao;

	@Override
	public List<PlantVO> selectPlant(PlantVO vo) {
		return dao.selectPlant(vo);
	} 
 
} 
