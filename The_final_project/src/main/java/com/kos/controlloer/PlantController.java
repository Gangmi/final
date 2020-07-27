package com.kos.controlloer;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.PlantService;
import com.kos.service.PlantServiceImpl;
import com.kos.vo.PlantVO;

@Controller
public class PlantController { 
	
	@Autowired 
	PlantServiceImpl service; 
	 
	@RequestMapping("plant.do")
	public ModelAndView PlantList(PlantVO vo) {
		ModelAndView mv = new ModelAndView();
		List<PlantVO> list = service.selectPlant(vo);
		mv.setViewName("plant");
		mv.addObject("list", list); 
		return mv; 

	} 
} 
 