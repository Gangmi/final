package com.kos.socket;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.JSONStreamAware;
import org.json.simple.parser.JSONParser;


public class ListenerThread extends Thread {
	private static ListenerThread instance = null;
	private ServerSocket serversocket;
	private int connectedCount;
	private HashMap<String, Socket> mapSock;
	private List<String> listSockname;

	private ListenerThread() {
		super();
		connectedCount = 0;
		mapSock = new HashMap<String, Socket>();
		listSockname = new ArrayList<String>();
		HeartbeatThread hbThread = HeartbeatThread.getInstance(listSockname, mapSock);
		hbThread.start();
		this.start();
	}

	public List<String> getListSockname() {
		return listSockname;
	}

	public static ListenerThread getInstance() {
		if (instance == null) {
			instance = new ListenerThread();
		}
		return instance;
	}

	@Override
	public void run() {
		System.out.println("***************************************");
		System.out.println("Listenner Thread 실행...");
		System.out.println("***************************************");
		try {
			serversocket = new ServerSocket(60000);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject;
			while (true) {
				String receivedData;
				String deviceName = null;
				Socket connectedClientSocket = serversocket.accept();
				BufferedReader br = new BufferedReader(new InputStreamReader(connectedClientSocket.getInputStream()));
				if ((receivedData = br.readLine()) != null) {
					jsonObject = (JSONObject)jsonParser.parse(receivedData);
					deviceName=(String)jsonObject.get("name");
					if(listSockname.contains(deviceName)) {
						mapSock.get(deviceName).close();
						mapSock.remove(deviceName);
						listSockname.remove(deviceName);
						System.out.println("중복 삭제");
					}else {
						connectedCount++;
					}
				}
				InetAddress ip = connectedClientSocket.getInetAddress();
				mapSock.put(deviceName, connectedClientSocket);
				listSockname.add(deviceName);
				ReceivedThread socketThread = new ReceivedThread(connectedClientSocket, listSockname);
				System.out.println(deviceName + "\n접속 수" + connectedCount);
				socketThread.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				serversocket.close();
			} catch (Exception e) {
			}
		}
	}

	public HashMap<String, Socket> getMapSock() {
		return mapSock;
	}

	public int getConnectedCount() {
		return connectedCount;
	}

	// RasberryPi data를 txt 파일로 저장
	public class ReceivedThread extends Thread {
		private Socket connectedClientSocket;
		private List<String> listSockname;
		private BufferedReader br;

		public ReceivedThread(Socket connectedClientSocket, List<String> listSockname) {
			this.connectedClientSocket = connectedClientSocket;
			this.listSockname = listSockname;
			try {
				br = new BufferedReader(new InputStreamReader(connectedClientSocket.getInputStream()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		@Override
		public void run() {
			String receivedData = null;
			String path = "/Users/myeongjin/Desktop/new";
			File directory = new File(path);
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = null;
			
			
			if (!directory.exists()) {
				directory.mkdirs();
			}
			
			try {
				while (connectedClientSocket.isConnected() && !connectedClientSocket.isClosed()) {
					while ((receivedData = br.readLine()) != null) {
						jsonObject = (JSONObject)jsonParser.parse(receivedData);
						FileWriter fw = new FileWriter(new File(directory + "/sensor"+jsonObject.get("name")+".txt"), false);
						fw.write(receivedData);
						System.out.println(receivedData);
						fw.close();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					br.close();
					System.out.println(connectedClientSocket.getInetAddress().toString()+" " + jsonObject.get("name")+" closed");
					mapSock.remove((String)jsonObject.get("name"));
					this.listSockname.remove((String)jsonObject.get("name"));
					connectedClientSocket.close();
					connectedCount--;
				} catch (Exception e2) {
				}
			}
		}
	}

}

//SOCKET PULSE
class HeartbeatThread extends Thread { // 10초마다 heart beat데이터를 보내고, ack시그널을 받지 못하면 재전송,
	private static HeartbeatThread instance = null; // 1분동안 ack시그널을 받지못하면,socket timeout 걸리고 소켓이 닫힘.
	private List<String> listSockname;
	private HashMap<String, Socket> mapSock;
	private BufferedWriter bw;
	
	public  static HeartbeatThread getInstance(List<String> listSockname, HashMap<String, Socket> mapSock) {
		if (instance == null) {
			instance = new HeartbeatThread(listSockname,mapSock);
		}
		return instance;
	}
	private HeartbeatThread(List<String> listSockname, HashMap<String, Socket> mapSock) {
		this.listSockname = listSockname;
		this.mapSock = mapSock;
	}

	public void run() {
		String sendData = "/heartbeat \r\n";

		try {

			while (true) {
				for (String sockname : this.listSockname) {
					if (this.mapSock.containsKey(sockname))
						synchronized (this.mapSock.get(sockname)) {
							Socket tmpsock = this.mapSock.get(sockname);
							bw = new BufferedWriter(new OutputStreamWriter(tmpsock.getOutputStream()));
							bw.write(sendData);
							try {
								bw.flush();
							} catch (SocketException e) {
								this.listSockname.remove(sockname);
								this.mapSock.get(sockname).close();
								this.mapSock.remove(sockname);
								break;
							}
						}
				}
				//System.out.println("heartbeat");
				Thread.sleep(10000);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// this.run();
		}
	}
}
