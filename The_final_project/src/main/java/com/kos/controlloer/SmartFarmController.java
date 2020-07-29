package com.kos.controlloer;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String test() {
		return "/Smart-Farm/monitoringView";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/requestData.do",produces = "application/text; charset=utf8")
	public String sendSensorData(HttpSession session) {
		StringBuffer msg = new StringBuffer();
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
		deviceVO.setId(memberVo.getId());
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		String path = "/Users/myeongjin/Desktop/new";
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
	
	@ResponseBody
	@RequestMapping(value = "/givewater.do",produces = "application/text; charset=utf8")
	public String giveWater(HttpSession session) {
		MemberVO memberVo=(MemberVO) session.getAttribute("memberinfo");
		SmartFarmDeviceVO deviceVO=new SmartFarmDeviceVO();
		deviceVO.setId(memberVo.getId());
		deviceVO=smartFarmDeviceService.seletDevice(deviceVO, 0);
		OutputStream temp;
		try {
			temp = ListenerThread.getInstance().getMapSock().get(deviceVO.getDevicekey()).getOutputStream();
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(temp));
			bw.write("/give water \r\n");
			bw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return "물준다";
	}
}
