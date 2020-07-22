package com.kos.vo;

public class AuthorityVO {
	private String id;
	private String role;
	public final static String ROLE_ADMIN="ROLE_ADMIN";
	public final static String ROLE_FARMER="ROLE_FARMER"; 
	public final static String ROLE_SMART_FARMER="ROLE_SMART_FARMER";
	public final static String ROLE_USER="ROLE_USER";
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
}
