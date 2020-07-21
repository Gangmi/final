package com.kos.controlloer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.BoardServiceImpl;
import com.kos.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	
	@RequestMapping("/general.do")
	public ModelAndView getBoardList(ModelAndView mv) {
		//게시판 글을 읽어오기 위한 코딩
		List<BoardVO> result=service.getBoardList();
		if(result.size()==0) {
			System.out.println("없음#######################");
		}
		//model and view 에 받아온 결과 추가
		mv.setViewName("general");
		mv.addObject("boardlist","있음");
		
		return mv;
		
	}

}
