package com.kos.service;

import java.util.List;

import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO;

public interface PlantService {
	 
	public List<PlantVO> selectPlant(PagingVO vo); 
}    
       