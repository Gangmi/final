package com.kos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.annotation.Transactional;

import com.kos.dao.AuthorityDao;
import com.kos.dao.MemberDao;
import com.kos.vo.AuthorityVO;
import com.kos.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao;
	@Autowired
	AuthorityDao authorityDao;
	@Transactional
	public Integer signUp(MemberVO memberVo) throws Exception{
		int result;
		result = memberDao.memberInsert(memberVo);
		
		if (result<1) {
			throw new Exception();
		}else {
			result=authorityDao.roleInsert( memberVo.getId(), AuthorityVO.ROLE_USER);
			if (result<1) {
				throw new Exception();
			}else {
				result = 1;
			}
	
		}
		return result;
	}
	
	public MemberVO checkID(MemberVO memberVo) {
		List<MemberVO> idList=memberDao.memberSelect(memberVo);
		if(idList.isEmpty())
			return null;
		else
			return idList.get(0);
	}
	
	public Integer updateAccount(MemberVO memberVo) {
		return memberDao.memberUpdate(memberVo);
	}
}
