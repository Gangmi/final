package com.kos.controlloer;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class SmartFarmController {
	@RequestMapping("/Smart-Farm.do")
	public String test() {
		return "/Smart-Farm/monitoringView";
	}
	
	
	@ResponseBody
	@RequestMapping("/requestData.do")
	public String sendSensorData() {
		StringBuffer msg = new StringBuffer();
		String path = "/Users/myeongjin/Desktop/new";
		File folder = new File(path);
		File sensordata = new File(path+"/sensor.data");
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
}
