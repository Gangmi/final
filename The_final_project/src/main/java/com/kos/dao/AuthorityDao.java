package com.kos.dao;

import java.util.List;

import com.kos.vo.AuthorityVO;

public interface AuthorityDao {
	public final static String ROLE_FARMER = "ROLE_FARMER";
	public final static String ROLE_SMART_FARMER = "ROLE_SMART_FARMER";
	public final static String ROLE_USER = "ROLE_USER";
	public final static String ROLE_ADMIN = "ROLE_ADMIN";
	public abstract int roleInsert(String id,String role);
	public abstract int roleDelete(String id,String role);
	public abstract List<AuthorityVO> roleSelect(String id);
}
