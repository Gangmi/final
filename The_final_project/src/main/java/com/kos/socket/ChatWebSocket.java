package com.kos.socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value = "/chat/{userId}")
public class ChatWebSocket {
	 
	 private Logger logger = LoggerFactory.getLogger(this.getClass());
	    //왜 static 으로 만들었을까?
	    static HashMap<String, Session> messageUserList = new HashMap<String, Session>();
	    
	    //서버 접속시
	    @OnOpen
	    public void onOpen(Session session, @PathParam("userId") String userId) {
	        //@PathParam 은 웹소켓에서 사용하는 @PathVariables        
	        //1. userId 가 중복되는지 확인
	        if(messageUserList.get(userId) != null) {
	            logger.info("중복 발생");
//	            userId = "";
	            sendMsg(session,"사용중인 아이디 입니다.");
	        }else{//중복이 아닐 경우
	            logger.info("중복 아님");
	            
	            messageUserList.put(userId, session);
	            System.out.println(userId + "else USERID");
	            
	/*            String memberEmail = (String)httpSession.getAttribute("email");
	*/            broadCast(userId +"님이 입장 하셨습니다."  /* 현재 접속자 수 : +userList.size()*/ + "\n");
	        }    
	    }
	    //서버 종료시
	    @OnClose
	    public void onClose(Session session) {            
	        String val = session.getId();//종료한 sessionId 확인
	        
	        Set<String>keys =  messageUserList.keySet();
	        for(String key : keys) {        
	            if(val.equals(messageUserList.get(key).getId())) {
	                logger.info("종료하려는 userId : "+key);
	                messageUserList.remove(key, session);
	                logger.info("현재 접속자 : "+messageUserList.size());
	                broadCast(key+"님께서 나가셨습니다.");
	                try {
	                	session.close();
					} catch (Exception e) {
						// TODO: handle exception
					}
	                
	            }
	        }    
	        
	    }
	    
	    //메시지 수신시
	    @OnMessage
	    public void onMessage(String msg, Session session) {
	        broadCast(msg);
	    }
	    
	    //에러 발생시
	    @OnError
	    public void onError(Session session, Throwable e) {
	        logger.info("문제 세션 : "+ session);
	        System.out.println(e.toString());
	    }
	    
	    //메시지 전체 전송
	    private void broadCast(String text){
	        logger.info("전달 대상 : "+messageUserList.size());
	        Set<String>keys =  messageUserList.keySet();
	        try {            
	            for(String key : keys) {
	                logger.info("key : "+key);
	                Session session = messageUserList.get(key);    
	                session.getBasicRemote().sendText(text);
	                System.out.println(session.getId() + "ID!!!");
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    
	    //한명에게 메시지 전달
	    private void sendMsg(Session session, String msg) {
	        try {
	            session.getBasicRemote().sendText(msg);
	        } catch (IOException e) {    
	            e.printStackTrace();
	        }
	    }


}
