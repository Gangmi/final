package com.kos.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FarmerApplicationVO {
	private int no;
	private String farmerName;
	private String farmerId;
	private String farmlandAddress;
	private String farmlandCorporationName;
	private String farmlandTel;
	private String farmlandCorporationNumber;
	private String certificateImageUrl;
	private String filePath;
	private MultipartFile file;
	private String applyDate;
	private String processingDate;
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getProcessingDate() {
		return processingDate;
	}
	public void setProcessingDate(String processingDate) {
		this.processingDate = processingDate;
	}
	public FarmerApplicationVO() {
		
	}
	public FarmerApplicationVO(String filePath) {
		this.filePath=filePath;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFarmerName() {
		return farmerName;
	}
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}
	public String getFarmerId() {
		return farmerId;
	}
	public void setFarmerId(String farmerId) {
		this.farmerId = farmerId;
	}
	public String getFarmlandAddress() {
		return farmlandAddress;
	}
	public void setFarmlandAddress(String farmlandAddress) {
		this.farmlandAddress = farmlandAddress;
	}
	public String getFarmlandCorporationName() {
		return farmlandCorporationName;
	}
	public void setFarmlandCorporationName(String farmlandCorporationName) {
		this.farmlandCorporationName = farmlandCorporationName;
	}
	public String getFarmlandTel() {
		return farmlandTel;
	}
	public void setFarmlandTel(String farmlandTel) {
		this.farmlandTel = farmlandTel;
	}
	public String getFarmlandCorporationNumber() {
		return farmlandCorporationNumber;
	}
	public void setFarmlandCorporationNumber(String farmlandCorporationNumber) {
		this.farmlandCorporationNumber = farmlandCorporationNumber;
	}
	public String getcertificateImageUrl() {
		return certificateImageUrl;
	}
	public void setcertificateImageUrl(String certificateImageUrl) {
		this.certificateImageUrl = certificateImageUrl;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		if(!file.isEmpty()) {
			//MultipartFile에서 파일명과 크기만 얻어오기 >>DB에 입력하기 위해서
			 int pos = file.getOriginalFilename().lastIndexOf( "." );
				String ext = file.getOriginalFilename().substring( pos + 1 );
			this.certificateImageUrl = this.farmerId+"님_farmer."+ext; //파일명
			this.file = file;// 디레토리가 없다면 생성 
            File dir = new File(filePath); 
            if (!dir.isDirectory()) { 
                dir.mkdirs(); 
            }
           
			File f= new File(filePath+"/" + certificateImageUrl); //괄호 안에 진짜경로
			try {
				file.transferTo(f);
			} catch (IOException e) {
				System.out.println("파일전송실패" + e.getMessage());
				e.printStackTrace();
			}
		}
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
}
