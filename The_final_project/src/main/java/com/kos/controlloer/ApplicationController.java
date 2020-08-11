package com.kos.controlloer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kos.dao.ApplicationDao;
import com.kos.dao.AuthorityDao;
import com.kos.service.ApplicationService;
import com.kos.vo.AuthorityVO;
import com.kos.vo.BoardVO;
import com.kos.vo.FarmerApplicationVO;
import com.kos.vo.MemberVO;

import com.kos.vo.PagingVO;

import com.kos.vo.SmartFarmApplicationVO;

@Controller
public class ApplicationController {
	@Autowired
	ApplicationService service;
	@Autowired
	ApplicationDao dao;
	@Autowired
	AuthorityDao authoritydao;
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



	@RequestMapping("/smartfarm-application.do")
	public ModelAndView SmartFarmApplicationVO(SmartFarmApplicationVO vo,ModelAndView mv,HttpSession session) {
		vo.setId(((MemberVO) session.getAttribute("memberinfo")).getId());
		System.out.println(vo.getId()+"asd");
		List<SmartFarmApplicationVO> result = (List<SmartFarmApplicationVO>)service.selectSmartFarmList(vo);
		mv.setViewName("smartfarm-application");
		mv.addObject("result",result);
		System.out.println(result+"스마트팜");
		return mv;
	}

	/*
	 * 농부 권한 관리자페이지
	 * farmer-application-manage.jsp
	 */
	@RequestMapping("/farmer-application-manage.do")
	public String pageview(
			@RequestParam(value = "nowpage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			FarmerApplicationVO applicationVO, Model mo,HttpSession session){
		if(applicationVO.equals("null")) {
			mo.addAttribute("isPDateNull", "&processingDate=null");
		}
		System.out.println(applicationVO.getProcessingDate());
		int total= dao.farmerApplicationCount(applicationVO);
		System.out.println(total);
		if (nowPage == null) {
			nowPage = "1";
		}
		mo.addAttribute("imgPath",session.getServletContext().getRealPath("/resources/farmer_certificate"));
		PagingVO pagingVO = new PagingVO(total, Integer.parseInt(nowPage), 20);
		System.out.println(pagingVO.getStartpage());
		System.out.println(pagingVO.getEndpage());
		System.out.println(pagingVO.getNowpage());
		System.out.println(pagingVO.getLastPage());
		List<FarmerApplicationVO> list = dao.farmerApplicationSelect(applicationVO, pagingVO);
		System.out.println("page size:"+list.size());
		mo.addAttribute("applicationlist", list);
		mo.addAttribute("paging", pagingVO);

		return"farmer-application-manage";
	}
	/*
	 * 농부허가관리(관리자 페이지)
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/farmer-approve-act.do" ,produces = "application/text; charset=utf8")
	public String farmerapprove(FarmerApplicationVO applicationVO) {
		JSONObject return_data= new JSONObject();
		try {
			int result = service.farmerApprove(applicationVO);
			if(result<0) {
				return_data.put("error","error");
			}else {
				FarmerApplicationVO return_applVO=dao.farmerApplicationSelect(applicationVO).get(0);
				String format_change = return_applVO.getProcessingDate();
				return_data.put("no",return_applVO.getNo());
				return_data.put("farmerName",return_applVO.getFarmerName());
				return_data.put("farmer_id",return_applVO.getFarmerId());
				return_data.put("farmlandAddress",return_applVO.getFarmlandAddress());
				return_data.put("farmlandCorporationName",return_applVO.getFarmlandCorporationName());
				return_data.put("farmlandTel",return_applVO.getFarmlandTel());
				return_data.put("farmlandCorporationNumber",return_applVO.getFarmlandCorporationNumber());
				return_data.put("applyDate",return_applVO.getApplyDate());
				try {
					return_data.put("processingDate",format_change.substring(0, 10));
				}catch (Exception e) {
					return_data.put("processingDate","");
				}

			}
		}catch (Exception e) {
			e.printStackTrace();
			return_data.put("error","error");
		}
		return return_data.toJSONString();
	}


	@ResponseBody
	@RequestMapping(value = "/farmer-cancel-act.do" ,produces = "application/text; charset=utf8")
	public String farmerCancel(FarmerApplicationVO applicationVO) {
		JSONObject return_data= new JSONObject();
		try {
			System.out.println("no:"+applicationVO.getNo());
			int result = service.farmerCancel(applicationVO);
			System.out.println(result);
			if(result<0) {
				return_data.put("error","error");
			}else {
				FarmerApplicationVO return_applVO=dao.farmerApplicationSelect(applicationVO).get(0);
				String format_change = return_applVO.getProcessingDate();
				return_data.put("no",return_applVO.getNo());
				return_data.put("farmerName",return_applVO.getFarmerName());
				return_data.put("farmer_id",return_applVO.getFarmerId());
				return_data.put("farmlandAddress",return_applVO.getFarmlandAddress());
				return_data.put("farmlandCorporationName",return_applVO.getFarmlandCorporationName());
				return_data.put("farmlandTel",return_applVO.getFarmlandTel());
				return_data.put("farmlandCorporationNumber",return_applVO.getFarmlandCorporationNumber());
				return_data.put("applyDate",return_applVO.getApplyDate());
				try {
					return_data.put("processingDate",format_change.substring(0, 10));
				}catch (Exception e) {
					return_data.put("processingDate","");
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			return_data.put("error","error");
		}
		return return_data.toJSONString();
	}

	//관리자페이지 스마트팜,농부신청 일별 신청 차트 
	@ResponseBody
	@RequestMapping(value ="/FarmerChart.do", method = RequestMethod.POST)
	public List<FarmerApplicationVO> FarmerChart(FarmerApplicationVO applicationVO){
		System.out.println("떳데이?"); 
		List<FarmerApplicationVO> result = service.FarmerChart(applicationVO);
		System.out.println(result+" !!!!!!!!!!!!!");
		return result; 
	} 
}
