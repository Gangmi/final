package com.kos.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@ServerEndpoint(value="/chatroom/{roomId}/{userId}")
public class WebSocketChatRoom {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
    //왜 static 으로 만들었을까?
    static HashMap<String, HashMap<String,Session>> roomList = new HashMap<String, HashMap<String,Session>>();
    //서버 접속시
    @OnOpen
    public void onOpen(Session session, @PathParam("roomId") String roomId, @PathParam("userId") String userId) {
        //@PathParam 은 웹소켓에서 사용하는 @PathVariables        
        //1. userId 가 중복되는지 확인
    	synchronized (roomList) {
    		if(roomList.get(roomId) == null) {
        		roomList.put(roomId, new HashMap<String, Session>());
        	}else {
        		logger.info("roomId 중복(에러아님)");
        	}
        	
        	if(roomList.containsKey(roomId)) {
        		if(roomList.get(roomId).get(userId)!= null) {
        			logger.info(roomId+" "+userId+"중복");
        		}else {
        			roomList.get(roomId).put(userId, session);
    			}
        	}else {
        		roomList.remove(roomId);
        	}
		}
    	
    }
    //서버 종료시
    @OnClose
    public void onClose(Session session,@PathParam("roomId")String roomId ) {            
        String val = session.getId();//종료한 sessionId 확인
        HashMap<String, Session> room=roomList.get(roomId);
        Set<String>keys =  room.keySet();
        for(String key : keys) {        
            if(val.equals(room.get(key).getId())) {
                logger.info("close userId : "+key);
                room.remove(key, session);
                logger.info("현재 접속자 : "+room.size());
                broadCast("{\"header\":{\"users\":[],\"cmd\":\"close\",\"sender\":\""+key+"\",\"roomid\":\""+roomId+"\"},\"body\":{\"msg\":\" "+key+"님이 종료하셨습니다.\"}}", roomId);
            }
        } 
        try {
        	session.close();
        	if(room.isEmpty()) {
        		roomList.remove(roomId);
        		System.out.println("room is empty");
        	}
        }
        catch (Exception e) {
		}
    }
    
    //메시지 수신시
    @OnMessage
    public void onMessage(String msg, Session session,@PathParam("roomId")String roomId) {
    	System.out.println(msg);
    	HashMap<String, Session> roomUserList=roomList.get(roomId);
    	JSONParser jsonParser = new JSONParser();
    	try {
    	JSONObject object = (JSONObject)jsonParser.parse(msg);
    	JSONObject header = (JSONObject) object.get("header");
    	JSONArray users = (JSONArray) header.get("users");
    	List userlist = new ArrayList();
    	for(int i = 0; i< users.size();i++) {
    		Session tmp = (Session) roomUserList.get(users.get(i));
    		tmp.getBasicRemote().sendText(msg);
    	}
      
        }catch (Exception e) {
        	e.printStackTrace();
        	//broadCast(msg);
            //System.out.println(msg);
		}
        
    }
    
    //에러 발생시
    @OnError
    public void onError(Session session, Throwable e) {
        logger.info("문제 세션 : "+ session);
        System.out.println(e.toString());
    }
    
    //메시지 전체 전송
    private void broadCast(String text,@PathParam("roomId")String roomId){
    	HashMap<String, Session> roomUserList=roomList.get(roomId);
        logger.info("to "+roomUserList.size()+" : "+text);
        Set<String>keys =  roomUserList.keySet();
        try {            
            for(String key : keys) {
                logger.info("key : "+key);
                Session session = roomUserList.get(key);    
                session.getBasicRemote().sendText(text);
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
