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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ListenerThread  extends Thread{
	private static ListenerThread instance=null;
	private ServerSocket serversocket;
	private int connectedCount;
	private HashMap<String, Socket> mapSock;
	private List<String> listSockname;
	
	private ListenerThread() {
		super();
		connectedCount=0;
		mapSock=new HashMap<String, Socket>();
		listSockname=new ArrayList<String>();
		HeartbeatThread hbThread=new HeartbeatThread(listSockname, mapSock);
		hbThread.start();
		this.start();
	}
	
	public static ListenerThread getInstance() {
		if(instance==null) {
			instance=new ListenerThread();
		}
		return instance;
	}
	
	@Override
	public void run() {
		System.out.println("***************************************");
		System.out.println("Listenner Thread 실행...");
		System.out.println("***************************************");
		try {
			serversocket=new ServerSocket(60000);
			while(true) {
				Socket connectedClientSocket=serversocket.accept();
				connectedCount++;
				InetAddress ip = connectedClientSocket.getInetAddress();
				mapSock.put(ip.toString(), connectedClientSocket);
				listSockname.add(connectedClientSocket.getInetAddress().toString());
				ReceivedThread socketThread= new ReceivedThread(connectedClientSocket,listSockname);
				System.out.println(connectedClientSocket.getInetAddress().toString()+"\n접속 수"+connectedCount);
				socketThread.start();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				serversocket.close();
			}catch (Exception e) {}
		}
	}
	public HashMap<String, Socket> getMapSock(){return mapSock;}
	public int getConnectedCount() {return connectedCount;}
	
	//RasberryPi data를 txt 파일로 저장 
	public class ReceivedThread extends Thread{
		private Socket connectedClientSocket;
		private List<String> listSockname;
		private BufferedReader br;
		public ReceivedThread(Socket connectedClientSocket,List<String> listSockname) {
			this.connectedClientSocket=connectedClientSocket;
			this.listSockname=listSockname;
			try {
				br=new BufferedReader(new InputStreamReader(connectedClientSocket.getInputStream()));
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		@Override
		public void run() {
			String receivedData=null;
			String path = "/Users/myeongjin/Desktop/new";
			File directory = new File(path);
			
			if(!directory.exists()) {
				directory.mkdirs();
			}
			File file= new File(directory+"/test.txt");
			try {
				while(connectedClientSocket.isConnected() && !connectedClientSocket.isClosed()) {
					while ((receivedData=br.readLine())!=null) {
						FileWriter fw=new FileWriter(file,false);
						fw.write(receivedData);
						fw.close();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					br.close();
					System.out.println(connectedClientSocket.getInetAddress().toString()+" closed");
					mapSock.remove(connectedClientSocket.getInetAddress().toString());
					this.listSockname.remove(connectedClientSocket.getInetAddress().toString());
					connectedClientSocket.close();
					connectedCount--;
				} catch (Exception e2) {}
			} 
		}
	}
	
	//SOCKET PULSE
	public class HeartbeatThread extends Thread{ //10초마다 heart beat데이터를 보내고, ack시그널을 받지 못하면 재전송,
												 //1분동안 ack시그널을 받지못하면,socket timeout 걸리고 소켓이 닫힘.
		private List<String> listSockname;
		private HashMap<String, Socket> mapSock;
		private BufferedWriter bw;
		public HeartbeatThread(List<String> listSockname,HashMap<String, Socket> mapSock) {
			this.listSockname=listSockname;
			this.mapSock=mapSock;
		}
		
		public void run() {
			String sendData="/heartbeat\r\n";
			try {
				
				while(true) {
					for (String sockname: this.listSockname) {
						
						System.out.println(sockname);
						if(this.mapSock.containsKey(sockname))
							synchronized (this.mapSock.get(sockname)) {
								Socket tmpsock=this.mapSock.get(sockname);
								bw=new BufferedWriter(new OutputStreamWriter(tmpsock.getOutputStream()));
								bw.write(sendData);
								bw.flush();
							}	
					}
					//System.out.println("heartbeat");
					Thread.sleep(10000);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				this.run();
			}
		}
	}
}
 