package com.kos.controlloer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
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
	
	@RequestMapping("login_act.do")
	public ModelAndView login(HttpServletRequest request,HttpSession session) {
		ModelAndView view = new ModelAndView();
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id=null;
		view.setViewName("redirect:index.jsp");
		if(authentication !=null) {
			UserDetails details =(UserDetails)authentication.getPrincipal();
			id = details.getUsername();
		}
		MemberVO memberVO= new MemberVO();
		memberVO.setId(id);
		memberVO = signUpService.checkID(memberVO);
		request.removeAttribute("loginfail");
		session.setAttribute("memberinfo", memberVO);
		return view; 
	}
	@RequestMapping("login_fail.do")
	public String loginFail(HttpServletRequest request) {
		
		request.setAttribute("loginfail","아이디,비밀번호를 다시 확인하세요.");
		return "login";
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null){ 
			new SecurityContextLogoutHandler().logout(request, response, authentication); 
		}
		session.invalidate();
		
		return "redirect:index.jsp";
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
