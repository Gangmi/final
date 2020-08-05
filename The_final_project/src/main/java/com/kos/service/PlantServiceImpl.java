package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kos.dao.PlantDaoImpl;
import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO; 
 
@Service("PlantService")
public class PlantServiceImpl implements PlantService{

	@Autowired  
	PlantDaoImpl dao; 
 
	@Override 
	public List<PlantVO> selectPlant(PagingVO vo) {
		
		//전체 갯수가 몇개인지 불러옴
		int total = dao.getPlantCount(vo);
		
		System.out.println("토탈갯수"+total);	//330
		PagingVO page = new PagingVO(total, vo.getNowpage(), vo.getCntPerPage());
		if(vo.getSearchword()!=null) {
			System.out.println("검색어로 조회 들어옴");
			page.setSearchword(vo.getSearchword()); 
			page.setPlantcate(vo.getPlantcate());
		}
//		System.out.println("들어옴");  
//		System.out.println(page.getNowpage()); //1
//		System.out.println("들어옴");  
		System.out.println(page.getStart()+"시작페이지~~~"); 
		System.out.println(page.getEnd()+"마지막페이지~~~~"); 
//		System.out.println("들어옴");     
		List<PlantVO> result = dao.selectPlant(page);  
 		System.out.println("가져오냐?"); 
		System.out.println(result);      
		// nowpage멤버변수를 이용해서 total page를 저장        
		if (result.size() > 0) {     
			result.get(0).setNowpage(page.getLastPage());
			result.get(0).setBlock(page.getNowblock()); 
		}  
		       
		return result;        
	} 
	 
	@Override
	public int getPlantCount(PagingVO vo) {
		return dao.getPlantCount(vo);
	}
    
	@Override
	public PlantVO getPlantInfo(PlantVO vo) {
		return dao.getPlantInfo(vo);
	}

}     
  
