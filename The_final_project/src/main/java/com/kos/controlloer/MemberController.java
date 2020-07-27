package com.kos.controlloer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kos.service.MemberService;
import com.kos.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	/*
	 * sign-up.jsp
	 * 회원가입정보 DB에 저장 
	 */
	@RequestMapping("signup_act.do")
	public ModelAndView signupAct(MemberVO memberVo)  {
		//jsp에서 받아온 pw를 bCrypt 해시암호화 저장 String length -> 60
		memberVo.setPassword(this.bCryptPasswordEncoder.encode(memberVo.getPassword()));
		ModelAndView view = new ModelAndView();
		view.setViewName("redirect:index.jsp");
		
		int result = 0;
		try {
			/*
			 * signUpService signUp 
			 * DB TABLE member 에 member Data 저장
			 * DB TABLE authority 에 ID, ROLE 저장
			 * TRANSACTION 처리로 둘 중 하나라도 실패하면 저장 안되고 exception 발생 
			 */
			result = memberService.signUp(memberVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result != -1) {
			view.setViewName("redirect:index.jsp");
		}else {
			view.setViewName("500페이지 이동");
		}
		return view;
	}
	
	/*
	 * Spring Security.xml
	 * Security 에서 로그인 성공시 동작
	 */
	@RequestMapping("login_act.do")
	public ModelAndView login(HttpServletRequest request,HttpSession session) {
		ModelAndView view = new ModelAndView();
		//SecurityContextHolder에 있는 인증정보(Authentication)를사용.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String id=null;
		view.setViewName("redirect:index.jsp");
		//로그인 성공시 인증정보가 있음.
		if(authentication !=null) {
			//Authentication getPrincipal에는 ROLE과 해시화된 USERPW 와 USERID 정보를 갖고있음UserDetails).
			UserDetails details =(UserDetails)authentication.getPrincipal();
			id = details.getUsername();
		}
		MemberVO memberVO= new MemberVO();
		memberVO.setId(id);
		/*
		 * signUpService checkID
		 * id, nick 의 정보를 갖고 있다면,member info를 DB에서 찾고
		 * member의 모든 info를 반
		 */
		memberVO = memberService.checkID(memberVO);
		request.removeAttribute("loginfail");
		//세션에 member info 저
		session.setAttribute("memberinfo", memberVO);
		return view; 
	}
	@RequestMapping("login_fail.do")
	public String loginFail(HttpServletRequest request) {
		
		request.setAttribute("loginfail","아이디,비밀번호를 다시 확인하세요.");
		return "login";
	}

	/*
	 * header.jsp 
	 * 로그아웃
	 * Security의 로그인 세션
	 * 세션에 있는 모든 정보를삭제.
	 */
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		//Authentication 에 있는 정보를 갖고, SecurityContextLogoutHandler을 통해 로그아웃.
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null){ 
			new SecurityContextLogoutHandler().logout(request, response, authentication); 
		}
		session.invalidate();
		
		return "redirect:index.jsp";
	}
	
	/*
	 *sign_up.jsp AJAX
	 *아이디 닉네임 중복체크 
	 */
	@RequestMapping(value = "CheckID.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajax_checkID(MemberVO memberVo) {
		MemberVO searchMember = memberService.checkID(memberVo);
		String msg="";
		if(memberVo.getId()!=null) {
			msg=(searchMember==null) ? "사용가능한 아이디입니다.":"사용중인 아이디입니다.";			
		}else if(memberVo.getNickname()!=null)
		{
			msg=(searchMember==null) ? "사용가능한 닉네임입니다.":"사용중인 닉네임입니다.";
		}
		return msg;
	}
	
	/*
	 * updateAccount.jsp
	 * DB에서 ID로 검색한 MemberInfo hashing password을 
	 * BCryptPasswordEncoder matchs와 현재 비밀번호가 같으면,
	 * update 실행후 수정 성공 페이지로 이동.
	 */
	@RequestMapping("updateAccount_act.do")
	public String updateAccount(MemberVO memberVo, 
			@RequestParam(value = "updatepassword",required = true)String updatePW) {
		MemberVO searchVo = memberService.checkID(memberVo);
		if(bCryptPasswordEncoder.matches(memberVo.getPassword(), searchVo.getPassword())) {
			memberVo.setPassword(this.bCryptPasswordEncoder.encode(updatePW));
			memberService.updateAccount(memberVo);
			return "successPage";
		}else
			return "failPage";
		
	}
}
