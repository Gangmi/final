package com.kos.controlloer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.SignUpService;
import com.kos.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	SignUpService signUpService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@RequestMapping("signup_act.do")
	public ModelAndView signupAct(MemberVO memberVo)  {
		memberVo.setPassword(this.bCryptPasswordEncoder.encode(memberVo.getPassword()));
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:index.jsp");
		
		int result = 0;
		try {
			result = signUpService.signUp(memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result != -1) {
			view.setViewName("redirect:index.jsp");
		}else {
			view.setViewName("as");
		}
		return view;
	}
	

	
	
	@RequestMapping(value = "CheckID.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajax_checkID(MemberVO memberVo) {
		MemberVO searchMember = signUpService.checkID(memberVo);
		String msg="";
		if(memberVo.getId()!=null) {
			msg=(searchMember==null) ? "사용가능한 아이디입니다.":"사용중인 아이디입니다.";			
		}else if(memberVo.getNickname()!=null)
		{
			msg=(searchMember==null) ? "사용가능한 닉네임입니다.":"사용중인 닉네임입니다.";
		}
		return msg;
	}
}
