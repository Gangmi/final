package com.kos.controlloer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.BoardServiceImpl;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	@RequestMapping("/general.do")
	public ModelAndView getBoardList(ModelAndView mv) {
		 
		mv.addObject("boardlist",service.getBoardList());
		
		return mv;
		
	}

}
