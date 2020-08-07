package com.kos.controlloer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kos.service.ApplicationService;
import com.kos.service.MemberService;
import com.kos.service.SmartFarmDeviceService;
import com.kos.vo.MemberVO;
import com.kos.vo.PagingVO;
import com.kos.vo.SmartFarmApplicationVO;
import com.kos.vo.SmartFarmDeviceVO;
import com.nexacro17.xapi.data.DataSet;
import com.nexacro17.xapi.data.DataTypes;
import com.nexacro17.xapi.data.PlatformData;
import com.nexacro17.xapi.data.datatype.DataType;
import com.nexacro17.xapi.tx.HttpPlatformResponse;
import com.nexacro17.xapi.tx.PlatformType;

@Controller
public class NexacroController {
	@Autowired
	ApplicationService appService;
	@Autowired
	MemberService memberService;
	@Autowired
	SmartFarmDeviceService smartDeviceService;
	/*
	 *  넥사크로 frmTop
	 *  좌측 상단 로그인 닉네임 표시
	 */
	@RequestMapping("/getLoginId.do")
	public void getLoginId(HttpServletResponse response,HttpSession session) {
		//현재 세션의 내정보 얻기.
		MemberVO my = (MemberVO)session.getAttribute("memberinfo");
		//*****************DataSet 설정**************************
		//넥사크로로 전송하기 위한 DataSet
		DataSet ds = new DataSet("loginId");
		//columnId : name, DataType : String, Size : 256
		ds.addColumn("name",DataTypes.STRING,256);
		//데이터 행 추가
		int row= ds.newRow();
		//데이터 셋팅
		ds.set(row,"name",/*my.getName()+*/"님 반갑습니다.");
		//*****************DataSet 설정 끝************************
		
		
		//*****************DataSet 전송**************************
		//전송객체 생성
		PlatformData pData = new PlatformData();
		//전송객체에 DataSet 적재
		pData.addDataSet(ds);
		//Response type 설정 및 문자 인코딩 설정
		HttpPlatformResponse res = new HttpPlatformResponse(response, PlatformType.CONTENT_TYPE_XML,"utf-8");
		//Response에 전송객체 적재
		res.setData(pData);
		try {
			//전송
			res.sendData();
		}catch (Exception e) {}
		//*****************DataSet 전송 끝************************
	}
	
	/*
	 * 넥사크로 work01
	 * 시작페이지 필요 데이터 전송 
	 */
	@RequestMapping("/getStartData.do")
	public void getSmartCertificateTotalCount(HttpServletResponse response) {
		//***************DataSet 설정(paging)***********************************
		int total_certificate = appService.SmartFarApplicatingTotalCount(null);
		SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
		PagingVO pagingVO = new PagingVO(total_certificate,1,50);
		pagingVO.setCntPage(1);
		DataSet ds = new DataSet("pagingData");
		ds.addColumn("startpage",DataTypes.INT,256);
		ds.addColumn("nowpage",DataTypes.INT,256);
		ds.addColumn("endpage",DataTypes.INT,256);
		ds.addColumn("total",DataTypes.INT,256);
		ds.addColumn("cntPerPage",DataTypes.INT,256);
		ds.addColumn("lastPage",DataTypes.INT,256);
		ds.addColumn("start",DataTypes.INT,256);
		ds.addColumn("end",DataTypes.INT,256);
		ds.addColumn("cntPage",DataTypes.INT,256);
		int row = ds.newRow();
		ds.set(row,"startpage", pagingVO.getStartpage());
		ds.set(row,"nowpage", pagingVO.getNowpage());
		ds.set(row,"endpage", pagingVO.getEndpage());
		ds.set(row,"total", pagingVO.getTotal());
		ds.set(row,"cntPerPage", pagingVO.getCntPerPage());
		ds.set(row,"lastPage", pagingVO.getLastPage());
		ds.set(row,"end", pagingVO.getEnd());
		ds.set(row,"cntPage", pagingVO.getCntPage());
		//*********************************************************
		//***************DataSet 설정(certificate)***********************************
		
		SmartFarmApplicationVO applicationVO =null;
		DataSet ds1 = new DataSet("certificate");
		ds1.addColumn("NO",DataTypes.INT,256);
		ds1.addColumn("ID",DataTypes.STRING,256);
		ds1.addColumn("이름",DataTypes.STRING,256);
		ds1.addColumn("연락처",DataTypes.STRING,256);
		ds1.addColumn("스마트팜_장비ID",DataTypes.STRING,256);
		ds1.addColumn("신청일",DataTypes.DATE,256);
		ds1.addColumn("시작일",DataTypes.DATE,256);
		ds1.addColumn("종료일",DataTypes.DATE,256);
		ds1.addColumn("승인일",DataTypes.DATE,256);
		List<SmartFarmApplicationVO> list = appService.selectPageCertificate(applicationVO, pagingVO);
		for(SmartFarmApplicationVO tmp : list) {
			//신청서에 있는 맴버 정보를 가져온다.
			MemberVO memberVo = new MemberVO();
			memberVo.setId(tmp.getId());
			memberVo = memberService.checkID(memberVo);
			//---------------------------------------------------------
			//해당 맴버가 가지고 있는 device정보를 가지고온다.
			SmartFarmDeviceVO deviceVO = new SmartFarmDeviceVO();
			deviceVO.setId(deviceVO.getId());
			System.out.println(tmp.getApproveDate());
			System.out.println("reg:"+deviceVO.getRegdate());
			deviceVO.setRegdate(tmp.getApproveDate());
			List tmplist=smartDeviceService.seletDevice(deviceVO);
			if(tmplist.size()>0)
				deviceVO=(SmartFarmDeviceVO)tmplist.get(0);
			//----------------------------------------------------------
			int row1 = ds1.newRow();
			ds1.set(row1,"NO", tmp.getNo());
			ds1.set(row1,"ID", tmp.getId());
			ds1.set(row1,"이름", memberVo.getName());
			ds1.set(row1,"연락처", memberVo.getPhoneNumber());
			ds1.set(row1,"스마트팜_장비ID",deviceVO.getDevicekey());
			try {
			ds1.set(row1,"시작일",transFormat.parse(tmp.getStartDate()));
			ds1.set(row1,"신청일",transFormat.parse(tmp.getApplyDate()));
			ds1.set(row1,"종료일",transFormat.parse(tmp.getDueDate()));
			if(tmp.getApproveDate() !=null)
				ds1.set(row1,"승인일",transFormat.parse(tmp.getApproveDate()));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		//*********************************************************
		//*********************등록된 디바이스 리스트 DataSet**************
		List<SmartFarmDeviceVO> deviceList=smartDeviceService.seletDevice(null);
		
		DataSet ds2 = new DataSet("deviceID");
		ds2.addColumn("deviceId",DataTypes.STRING,256);
		for(SmartFarmDeviceVO device:deviceList) {
			int row1 = ds2.newRow();
			ds2.set(row1,"deviceId",device.getDevicekey());
		}
		//*********************************************************
		PlatformData pData = new PlatformData();
		pData.addDataSet(ds);
		pData.addDataSet(ds1);
		pData.addDataSet(ds2);
		HttpPlatformResponse res = new HttpPlatformResponse(response, PlatformType.CONTENT_TYPE_XML,"utf-8");
		res.setData(pData);
		try {
			res.sendData();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	@RequestMapping("/getSearchList.do")
	public void getSearchList(MemberVO memberVO, SmartFarmApplicationVO smartFarmApplicationVO,HttpServletResponse response) {
		System.out.println("memberVo id : "+memberVO.getId());
		System.out.println("application id : "+smartFarmApplicationVO.getId());
		System.out.println("application approve_date : "+smartFarmApplicationVO.getApproveDate());
		System.out.println(memberVO);
		
		//***************DataSet 설정(paging)***********************************
		int total_certificate = appService.SmartFarApplicatingTotalCount(smartFarmApplicationVO);
		SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
		PagingVO pagingVO = new PagingVO(total_certificate,1,50);
		pagingVO.setCntPage(1);
		DataSet ds = new DataSet("pagingData");
		ds.addColumn("startpage",DataTypes.INT,256);
		ds.addColumn("nowpage",DataTypes.INT,256);
		ds.addColumn("endpage",DataTypes.INT,256);
		ds.addColumn("total",DataTypes.INT,256);
		ds.addColumn("cntPerPage",DataTypes.INT,256);
		ds.addColumn("lastPage",DataTypes.INT,256);
		ds.addColumn("start",DataTypes.INT,256);
		ds.addColumn("end",DataTypes.INT,256);
		ds.addColumn("cntPage",DataTypes.INT,256);
		int row = ds.newRow();
		ds.set(row,"startpage", pagingVO.getStartpage());
		ds.set(row,"nowpage", pagingVO.getNowpage());
		ds.set(row,"endpage", pagingVO.getEndpage());
		ds.set(row,"total", pagingVO.getTotal());
		ds.set(row,"cntPerPage", pagingVO.getCntPerPage());
		ds.set(row,"lastPage", pagingVO.getLastPage());
		ds.set(row,"end", pagingVO.getEnd());
		ds.set(row,"cntPage", pagingVO.getCntPage());
		//*********************************************************
		//***************DataSet 설정(certificate)***********************************
				DataSet ds1 = new DataSet("certificate");
				ds1.addColumn("NO",DataTypes.INT,256);
				ds1.addColumn("ID",DataTypes.STRING,256);
				ds1.addColumn("이름",DataTypes.STRING,256);
				ds1.addColumn("연락처",DataTypes.STRING,256);
				ds1.addColumn("스마트팜_장비ID",DataTypes.STRING,256);
				ds1.addColumn("신청일",DataTypes.DATE,256);
				ds1.addColumn("시작일",DataTypes.DATE,256);
				ds1.addColumn("종료일",DataTypes.DATE,256);
				ds1.addColumn("승인일",DataTypes.DATE,256);
				List<SmartFarmApplicationVO> list = appService.selectPageCertificate(smartFarmApplicationVO, pagingVO);
				for(SmartFarmApplicationVO tmp : list) {
					//신청서에 있는 맴버 정보를 가져온다.
					MemberVO memberVo = new MemberVO();
					memberVo.setId(tmp.getId());
					memberVo = memberService.checkID(memberVo);
					//---------------------------------------------------------
					//해당 맴버가 가지고 있는 device정보를 가지고온다.
					SmartFarmDeviceVO deviceVO = new SmartFarmDeviceVO();
					deviceVO.setId(deviceVO.getId());
					deviceVO.setRegdate("app:"+tmp.getApproveDate());
					List tmplist=smartDeviceService.seletDevice(deviceVO);
					if(tmplist.size()>0)
						deviceVO=(SmartFarmDeviceVO)tmplist.get(0);
					//----------------------------------------------------------
					int row1 = ds1.newRow();
					ds1.set(row1,"NO", tmp.getNo());
					ds1.set(row1,"ID", tmp.getId());
					ds1.set(row1,"이름", memberVo.getName());
					ds1.set(row1,"연락처", memberVo.getPhoneNumber());
					ds1.set(row1,"스마트팜_장비ID",deviceVO.getDevicekey());
					try {
					ds1.set(row1,"시작일",transFormat.parse(tmp.getStartDate()));
					ds1.set(row1,"신청일",transFormat.parse(tmp.getApplyDate()));
					ds1.set(row1,"종료일",transFormat.parse(tmp.getDueDate()));
					if(tmp.getApproveDate() !=null)
						ds1.set(row1,"승인일",transFormat.parse(tmp.getApproveDate()));
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				//*********************************************************
		//*********************************************************
				PlatformData pData = new PlatformData();
				pData.addDataSet(ds);
				pData.addDataSet(ds1);
				
				HttpPlatformResponse res = new HttpPlatformResponse(response, PlatformType.CONTENT_TYPE_XML,"utf-8");
				res.setData(pData);
				try {
					res.sendData();
				} catch (Exception e) {
					// TODO: handle exception
				}
	}
	
	@RequestMapping("/smartApprove.do")
	public void smartApprove(SmartFarmDeviceVO deviceVO,SmartFarmApplicationVO applicationVO,HttpServletResponse response) {
		applicationVO.setApplyDate(ChangeDateType(applicationVO.getApplyDate()));
		applicationVO.setApproveDate(ChangeDateType(applicationVO.getApproveDate()));
		applicationVO.setDueDate(ChangeDateType(applicationVO.getDueDate()));
		applicationVO.setStartDate(ChangeDateType(applicationVO.getStartDate()));
		deviceVO.setRegdate(applicationVO.getApproveDate());
		
		System.out.println("device id : "+deviceVO.getId());
		System.out.println("device key : "+deviceVO.getDevicekey());
		System.out.println("device reg : "+deviceVO.getRegdate());
		System.out.println("applicationVO id : "+applicationVO.getId());
		System.out.println("applicationVO Approve : "+applicationVO.getApproveDate());
		System.out.println("applicationVO Apply : "+applicationVO.getApplyDate());
		System.out.println("applicationVO due : "+applicationVO.getDueDate());
		try {
			appService.applicationApprove(applicationVO, deviceVO);
		}catch (Exception e) {
			e.printStackTrace();
		}
		//************************************************************************
		//***************DataSet 설정(paging)***********************************
				int total_certificate = appService.SmartFarApplicatingTotalCount(null);
				SimpleDateFormat transFormat = new SimpleDateFormat("yy-MM-dd");
				PagingVO pagingVO = new PagingVO(total_certificate,1,50);
				pagingVO.setCntPage(1);
				DataSet ds = new DataSet("pagingData");
				ds.addColumn("startpage",DataTypes.INT,256);
				ds.addColumn("nowpage",DataTypes.INT,256);
				ds.addColumn("endpage",DataTypes.INT,256);
				ds.addColumn("total",DataTypes.INT,256);
				ds.addColumn("cntPerPage",DataTypes.INT,256);
				ds.addColumn("lastPage",DataTypes.INT,256);
				ds.addColumn("start",DataTypes.INT,256);
				ds.addColumn("end",DataTypes.INT,256);
				ds.addColumn("cntPage",DataTypes.INT,256);
				int row = ds.newRow();
				ds.set(row,"startpage", pagingVO.getStartpage());
				ds.set(row,"nowpage", pagingVO.getNowpage());
				ds.set(row,"endpage", pagingVO.getEndpage());
				ds.set(row,"total", pagingVO.getTotal());
				ds.set(row,"cntPerPage", pagingVO.getCntPerPage());
				ds.set(row,"lastPage", pagingVO.getLastPage());
				ds.set(row,"end", pagingVO.getEnd());
				ds.set(row,"cntPage", pagingVO.getCntPage());
				//*********************************************************
				//***************DataSet 설정(certificate)***********************************
				
				SmartFarmApplicationVO applicationVO1 =null;
				DataSet ds1 = new DataSet("certificate");
				ds1.addColumn("NO",DataTypes.INT,256);
				ds1.addColumn("ID",DataTypes.STRING,256);
				ds1.addColumn("이름",DataTypes.STRING,256);
				ds1.addColumn("연락처",DataTypes.STRING,256);
				ds1.addColumn("스마트팜_장비ID",DataTypes.STRING,256);
				ds1.addColumn("신청일",DataTypes.DATE,256);
				ds1.addColumn("시작일",DataTypes.DATE,256);
				ds1.addColumn("종료일",DataTypes.DATE,256);
				ds1.addColumn("승인일",DataTypes.DATE,256);
				List<SmartFarmApplicationVO> list = appService.selectPageCertificate(applicationVO1, pagingVO);
				for(SmartFarmApplicationVO tmp : list) {
					//신청서에 있는 맴버 정보를 가져온다.
					MemberVO memberVo = new MemberVO();
					memberVo.setId(tmp.getId());
					memberVo = memberService.checkID(memberVo);
					//---------------------------------------------------------
					//해당 맴버가 가지고 있는 device정보를 가지고온다.
					SmartFarmDeviceVO deviceVO1 = new SmartFarmDeviceVO();
					deviceVO1.setId(memberVo.getId());
			
					deviceVO1.setRegdate(tmp.getApproveDate());
					List tmplist=smartDeviceService.seletDevice(deviceVO1);
					if(tmplist.size()>0)
						deviceVO1=(SmartFarmDeviceVO)tmplist.get(0);
					//----------------------------------------------------------
					int row1 = ds1.newRow();
					ds1.set(row1,"NO", tmp.getNo());
					ds1.set(row1,"ID", tmp.getId());
					ds1.set(row1,"이름", memberVo.getName());
					ds1.set(row1,"연락처", memberVo.getPhoneNumber());
					ds1.set(row1,"스마트팜_장비ID",deviceVO.getDevicekey());
					try {
					ds1.set(row1,"시작일",transFormat.parse(tmp.getStartDate()));
					ds1.set(row1,"신청일",transFormat.parse(tmp.getApplyDate()));
					ds1.set(row1,"종료일",transFormat.parse(tmp.getDueDate()));
					if(tmp.getApproveDate() !=null)
						ds1.set(row1,"승인일",transFormat.parse(tmp.getApproveDate()));
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				//*********************************************************
				PlatformData pData = new PlatformData();
				pData.addDataSet(ds);
				pData.addDataSet(ds1);
				
				HttpPlatformResponse res = new HttpPlatformResponse(response, PlatformType.CONTENT_TYPE_XML,"utf-8");
				res.setData(pData);
				try {
					res.sendData();
				} catch (Exception e) {
					// TODO: handle exception
				}
		
	}
	
	public String ChangeDateType(String date) {
		try {
			return date.substring(0, 4)+"-"+date.substring(4, 6)+"-"+date.substring(6, 8);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
