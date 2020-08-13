package com.kos.controlloer;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kos.service.SmartFarmDeviceService;
import com.kos.socket.ListenerThread;
import com.kos.vo.MemberVO;
import com.kos.vo.SmartFarmDeviceVO;
@Controller
@RequestMapping("/smartfarmer")
public class SmartFarmController {
	@Autowired
	SmartFarmDeviceService smartFarmDeviceService;
	@RequestMapping("/monitoringView.do")
	public String test(HttpSession session,Model model) {
		StringBuffer msg = new StringBuffer();
		//로그인에서 생성된 memberinfo session을 참조하여 id값을 DeviceVO에 저장 
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
	
		deviceVO.setId(memberVo.getId());
		//아이디를 통해 연결되있는 디바이스 키를 찾는다.
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		System.out.println(deviceVO.getDevicekey());
		try {
			
			System.out.println(ListenerThread.getInstance().getMapSock().get(deviceVO.getDevicekey()).getInetAddress().toString());
			model.addAttribute("deviceIp", "http:/"+ListenerThread.getInstance().getMapSock().get(deviceVO.getDevicekey()).getInetAddress().toString()+":8090/?action=stream");
		}catch (Exception e) {
			model.addAttribute("deviceIp", "/resources/img/test.jpg");
		}
		return "/Smart-Farm/monitoringView";
	}
	
	/*
	 * monitoringView.jsp
	 * 웹 브라우저 AJAX 자바스크립트로 1초단위로 서버에 센서 데이터 파일 내용(json) 수신
	 *
	 */
	@ResponseBody
	@RequestMapping(value = "/requestData.do",produces = "application/text; charset=utf8")
	public String sendSensorData(HttpSession session,HttpServletRequest request,Model model) {
		StringBuffer msg = new StringBuffer();
		//로그인에서 생성된 memberinfo session을 참조하여 id값을 DeviceVO에 저장 
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
		
		deviceVO.setId(memberVo.getId());
		//아이디를 통해 연결되있는 디바이스 키를 찾는다.
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		try {
			//System.out.println(ListenerThread.getInstance().getMapSock().get(deviceVO.getDevicekey()).getInetAddress().toString());
		}catch (Exception e) {
		
		}
		String path = request.getSession().getServletContext().getRealPath("/new");
		File folder = new File(path);
		File sensordata = new File(path+"/sensor"+deviceVO.getDevicekey()+".txt");
		if (!folder.exists()) {
			try {
				folder.mkdir();
				sensordata.createNewFile();
			}catch (Exception e) {
				e.getStackTrace();
			}
		}
		//파일 읽어, json	형식의 데이터를 반한다.
		try(FileReader fileReader =new FileReader(sensordata);){
			int readByte=0;
			while((readByte = fileReader.read())!=-1){
				msg.append((char)readByte);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return msg.toString();
	}
	
	
	/*
	 * monitoringView.jsp
	 * 물주기 버튼을 누를시 라즈베리파이의 워터펌프를 동작하게 함.
	 */
	@ResponseBody
	@RequestMapping(value = "/givewater.do",produces = "application/text; charset=utf8")
	public String giveWater(HttpSession session,HttpServletRequest request) {
		//member 에 해당하는 devicekey를 가져온다.
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
		deviceVO.setId(memberVo.getId());
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		//물을 주는 명령어를 전송한다.
		OutputStream temp;
		try {
			//map 에 저장되어있는 소켓을 deviceke로 찾아 데이터를 전송한다.
			temp = ListenerThread.getInstance(request.getSession().getServletContext().getRealPath("/new")).getMapSock().get(deviceVO.getDevicekey()).getOutputStream();
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(temp));
			bw.write("/give water \r\n");
			bw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return "물준다";
	}
	
	@ResponseBody
	@RequestMapping(value = "/givelight.do",produces = "application/text; charset=utf8")
	public String giveLight(HttpSession session,HttpServletRequest request) {
		//member 에 해당하는 devicekey를 가져온다.
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
		deviceVO.setId(memberVo.getId());
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		//물을 주는 명령어를 전송한다.
		OutputStream temp;
		try {
			//map 에 저장되어있는 소켓을 deviceke로 찾아 데이터를 전송한다.
			temp = ListenerThread.getInstance(request.getSession().getServletContext().getRealPath("/new")).getMapSock().get(deviceVO.getDevicekey()).getOutputStream();
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(temp));
			bw.write("/give light \r\n");
			bw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return "light";
	}
}
