package com.kos.controlloer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.dao.FarmDao;
import com.kos.vo.FarmVO;

@Controller
public class FarmMapController {
	@Autowired
	FarmDao farmDao;
	
	@RequestMapping("/farm-map.do")
	public String farmMap(FarmVO farmVo,Model model) {
		List<FarmVO> list = farmDao.selectFarmList(farmVo);
		model.addAttribute("farmlist",list );
		
		return "farm-map";
	}
}
