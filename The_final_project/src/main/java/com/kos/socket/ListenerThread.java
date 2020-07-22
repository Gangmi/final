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
			while (true) {
				Socket connectedClientSocket = serversocket.accept();
				connectedCount++;
				InetAddress ip = connectedClientSocket.getInetAddress();
				mapSock.put(ip.toString(), connectedClientSocket);
				listSockname.add(connectedClientSocket.getInetAddress().toString());
				ReceivedThread socketThread = new ReceivedThread(connectedClientSocket, listSockname);
				System.out.println(connectedClientSocket.getInetAddress().toString() + "\n접속 수" + connectedCount);
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
			JSONObject jsonObject;
			
			
			if (!directory.exists()) {
				directory.mkdirs();
			}
			
			try {
				while (connectedClientSocket.isConnected() && !connectedClientSocket.isClosed()) {
					while ((receivedData = br.readLine()) != null) {
						jsonObject = (JSONObject)jsonParser.parse(receivedData);
						FileWriter fw = new FileWriter(new File(directory + "/sensor"+jsonObject.get("name")+".txt"), false);
						fw.write(receivedData);
						System.out.println(jsonObject.get("name"));
						fw.close();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					br.close();
					System.out.println(connectedClientSocket.getInetAddress().toString() + " closed");
					mapSock.remove(connectedClientSocket.getInetAddress().toString());
					this.listSockname.remove(connectedClientSocket.getInetAddress().toString());
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

					System.out.println(sockname);
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
				System.out.println("heartbeat");
				Thread.sleep(10000);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// this.run();
		}
	}
}
