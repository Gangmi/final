package com.kos.controlloer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.BoardServiceImpl;
import com.kos.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardServiceImpl service;
	
	//게시판 들어오면
	@RequestMapping("/general.do")
	public ModelAndView getBoardList(ModelAndView mv,BoardVO vo) {
		//게시판 글을 읽어오기 위한 코딩
		List<BoardVO> result=service.getBoardList(vo);
		if(result.size()==0) {
			System.out.println("없음#######################");
		}
		//다음에 갈 페이지 지정
		mv.setViewName("general");
		
		//다음 페이지로 넘길 값을 설정
		mv.addObject("boardlist",result); // 받아온 게시판 게시물
		mv.addObject("b_boardname",vo.getB_boardname()); //게시판이름
		return mv;
		
	}
	
	//글쓰기 페이지 요청이 들어왔을 때
	@RequestMapping("/writeboard.do")
	public ModelAndView callWritePage(ModelAndView mv, BoardVO vo) {
		//다음페이지 지정
		mv.setViewName("writeboard");
		//현재 게시판의 이름 전달
		mv.addObject("b_boardname",vo.getB_boardname());
		return mv;
	}
	
	
	//글쓸 때 
	@RequestMapping("/write.do")
	public ModelAndView writeBoard(ModelAndView mv,BoardVO vo) {
		System.out.println(vo.getB_title());
		System.out.println(vo.getB_contents());
		//임시로 아이디 지정 ->나중에 지우기
		vo.setM_id("testid");
		System.out.println(vo.getB_boardname());
		
		//사용자가 작성한 글 및 정보 전달
		service.writeBoard(vo);
		
		//넘기기
		mv.setViewName("redirect:/general.do?b_boardname="+vo.getB_boardname());
		return mv;
	}
	
	//글읽을 떄
	@RequestMapping("/viewboard.do")
	public ModelAndView viewBoard(ModelAndView mv ,BoardVO vo) {
		
		
		BoardVO result=service.viewBoard(vo);
		System.out.println(result.getB_title()+"######################");
		
		//다음 페이지 지정
		mv.setViewName("viewboard");
		mv.addObject("board",result);
		
		return mv;
		
	}

}
