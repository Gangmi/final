package com.kos.dao;

import java.util.List;

import com.kos.vo.MemberVO;

public interface MemberDao {
	public abstract int memberInsert(MemberVO memberVo);
	public abstract List<MemberVO> memberSelect(MemberVO memberVo);
	public abstract int memberUpdate(MemberVO memberVo);
	public abstract String memberProfileImg(MemberVO memberVO);
}
