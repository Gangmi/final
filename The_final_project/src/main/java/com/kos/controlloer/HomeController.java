package com.kos.controlloer;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.Marshaller.Listener;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kos.socket.ListenerThread;
import com.kos.dao.Testdaoimpl;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private Testdaoimpl td;
	@RequestMapping("/{step}.do")
	public String forwardPage(@PathVariable String step, ModelAndView mo) {
		
		return step;
	}
	
	@RequestMapping("/chatroom.do")
	public ModelAndView mainPage( ModelAndView mo,
							HttpServletRequest request,
							@RequestParam(value = "chatHeader") String header) {
		JSONParser jsonParser = new JSONParser();
		JSONObject receive_header;
		JSONArray jsonUserList = null;
		String cmd="" , host="";
		ArrayList userList = new ArrayList();
		try {
			receive_header = (JSONObject)jsonParser.parse(header);
			cmd = (String)receive_header.get("cmd");
			host = (String)receive_header.get("host");
			jsonUserList = (JSONArray)receive_header.get("user");
			if(jsonUserList!=null) {
				jsonUserList.add(host);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject users = new JSONObject();
		users.put("users", jsonUserList);
		System.out.println(users.toString());
		mo.setViewName("chatroom");
		mo.addObject("users",users);
		return mo;
	}
}
