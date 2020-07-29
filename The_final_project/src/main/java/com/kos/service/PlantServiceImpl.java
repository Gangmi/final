package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.PlantDaoImpl;
import com.kos.vo.BoardVO;
import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO; 

@Service
public class PlantServiceImpl implements PlantService{

	@Autowired 
	PlantDaoImpl dao;

	@Override
	public List<PlantVO> selectPlant(PagingVO vo) {
		
		int total = dao.getPlantCount(vo);
		System.out.println(total);	//330
		PagingVO page = new PagingVO(total, vo.getNowpage(), vo.getCntPerPage());
		System.out.println(page.getStart());	//-19 
		System.out.println(page.getEnd());		// 0
		System.out.println(page.getLastPage());  //17 
		System.out.println(page.getNowpage());   // 1
		List<PlantVO> result = dao.selectPlant(page);  
		// nowpage멤버변수를 이용해서 total page를 저장
		if (result.size() > 0) {  
			result.get(0).setNowpage(page.getLastPage());
		}  
   
		return result; 
	}
 
} 
 
