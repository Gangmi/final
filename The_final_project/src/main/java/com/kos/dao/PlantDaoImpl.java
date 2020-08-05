package com.kos.dao;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO;

@Repository("PlantDao")
public class PlantDaoImpl implements PlantDao {
  
	@Autowired
	private SqlSessionTemplate mybatis; 
 
	@Override  
	public List<PlantVO> selectPlant(PagingVO vo) {
		System.out.println("===> Mybatis selectPlant() 호출");
//		List<PlantVO>ok = mybatis.selectList("Plant.selectPlant", vo);
//		System.out.println(ok.get(1).getPlantcate());	
//		System.out.println(ok.get(1).getPlanttitles()); 
//		return ok;  
		System.out.println("찍히냐?");
		System.out.println(vo);
		System.out.println(vo.getPlanttitles());
		System.out.println(vo.getPlantcate());
		return mybatis.selectList("plant.selectPlant", vo);
	}        
              
	@Override      
	public int getPlantCount(PagingVO vo) { 
		System.out.println("===> Mybatis getPlantCount() 호출");
		return mybatis.selectOne("getPlantCount", vo);
	}
	 
	@Override
	public PlantVO getPlantInfo(PlantVO vo) { 
		System.out.println("===> Mybatis getPlantInfo() 호출");
		return mybatis.selectOne("plant.getPlantInfo",vo);
	}
   
}                 
	      
   
    
