package com.kos.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.kos.service.SignUpService;
import com.kos.vo.MemberVO;
@Component("loginSuccessHandler")
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	SignUpService service;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		UserDetails userDetails=(UserDetails)authentication.getPrincipal();
		MemberVO memberVo=new MemberVO();
		memberVo.setId(userDetails.getUsername());
		
		memberVo=service.checkID(memberVo);
		request.setAttribute("memberinfo", service.checkID(memberVo));
		request.removeAttribute("loginfail");
		request.getRequestDispatcher("/").forward(request, response);
	}

		

}
