package com.kos.controlloer;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kos.service.PlantService;
import com.kos.service.PlantServiceImpl;
import com.kos.vo.PagingVO;
import com.kos.vo.PlantVO;

@Controller
public class PlantController {

	@Autowired
	PlantServiceImpl service;

	// DB에 저장되어있는 데이터를 가져와서 보여줌
	@RequestMapping("plant.do")
	public ModelAndView PlantList(ModelAndView mv, PagingVO vo) {
		System.out.println("plantlist 들어옴");
		System.out.println(vo);
		System.out.println("-------------");

		if(vo.getNowpage()==0) {   
			vo.setNowpage(1);   
		} 
		
		//검색어 검색이 있다면   
		if(!vo.getSearchword().equals("")) {
			System.out.println("검색어가 있다.");
			mv.addObject("searchword", vo.getSearchword());
		} 
		
		// 탭마다 카테고리가 null이 아니면 보여줌 
		if(vo.getPlantcate()!=null) {
			System.out.println("카테고리가 있다"); 
			mv.addObject("plantcate",vo.getPlantcate());
		}  
		
		List<PlantVO> list = (List<PlantVO>)service.selectPlant(vo);
		System.out.println("가져오냐?"); 
		System.out.println(list); 
		mv.setViewName("plant"); 	        
		    
		// 다음 페이지로 넘길 리스트가 제대로 받아와 졌는지 확인   
		if (list.size() > 0) {  
			mv.addObject("plantlist", list); // 받아온 게시판 게시물
			mv.addObject("confirm", 1); // 값이 제대로 넘어간것을 표현

			return mv;   
 
		} else {  
 
			// 제대로 들어오지 않았다면
			mv.addObject("confirm", 0); 
			return mv;
		}
	
	} 

	// DB에 저장되어있는 식물정보 데이터를 보여줌
	@RequestMapping("viewplant.do")
	public ModelAndView PlantInfo(PlantVO vo) {
		ModelAndView mv = new ModelAndView();
		PlantVO pvo = (PlantVO) service.getPlantInfo(vo);
		mv.addObject("plantinfo", pvo);
		mv.setViewName("viewplant"); // 식물상세정보 페이지로 넘김
		return mv;
	}

}


