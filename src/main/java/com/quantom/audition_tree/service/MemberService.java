package com.quantom.audition_tree.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quantom.audition_tree.dao.MemberDao;
import com.quantom.audition_tree.dto.Member;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao; 
	
	public List<Member> getMembers() {
		return memberDao.getMembers();
	}

	public int doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
		
		return Integer.parseInt((String) param.get("id")); 
	}

}
