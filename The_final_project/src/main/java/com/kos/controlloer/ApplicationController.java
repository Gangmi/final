package com.kos.controlloer;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kos.service.ApplicationService;
import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.SmartFarmApplicationVO;

@Controller
public class ApplicationController {
	@Autowired
	ApplicationService service;
	@RequestMapping(value = "/farmerApplication.do", method = RequestMethod.POST)
	public String updatetest(FarmerApplicationVO vo,@RequestParam(value = "file1")MultipartFile file1,HttpServletRequest request,HttpSession session) {
		vo.setFilePath(request.getSession().getServletContext().getRealPath("/resources/farmer_certificate"));
		vo.setFile(file1);
		try {
			
			session.setAttribute("application", service.applyFarmer(vo));
		}catch (Exception e) {
			e.printStackTrace();
			return "500error";
		}
		return "farmer-application-success";
	}
	
	@RequestMapping(value = "/smart-farmApplication.do", method = RequestMethod.POST)
	public String updatetest(SmartFarmApplicationVO vo,HttpSession session) {
		System.out.println(vo.getId()+"asd");
		try {
			
			session.setAttribute("application", service.applySmartFarm(vo));
		}catch (Exception e) {
			e.printStackTrace();
			return "500error";
		}
		return "farmer-application-success";
	}
}
