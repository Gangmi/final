package com.kos.controlloer;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kos.service.ApplicationService;
import com.kos.vo.FarmerApplicationVO;

@Controller
public class ApplicationController {
	@Autowired
	ApplicationService service;
	@RequestMapping(value = "/test.do", method = RequestMethod.POST)
	public String updatetest(FarmerApplicationVO vo,@RequestParam(value = "file1")MultipartFile file1,HttpServletRequest request) {
		vo.setFilePath(request.getSession().getServletContext().getRealPath("/resources/farmer_certificate"));
		vo.setFile(file1);
		service.applyFarmer(vo);
		
		return "application_view";
	}
}
