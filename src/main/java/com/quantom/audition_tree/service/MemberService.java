package com.quantom.audition_tree.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quantom.audition_tree.dao.MemberDao;
import com.quantom.audition_tree.dto.Member;
import com.quantom.audition_tree.util.Util;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao; 
	
	@Autowired
	GenFileService genFileService;
	
	public List<Member> getMembers() {
		return memberDao.getMembers();
	}

	public int doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
		
		int id = Util.getAsInt(param.get("id"), 0);

		genFileService.changeInputFileRelIds(param, id);
		
		return Util.getAsInt(param.get("id"),-1); 
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
		
	}

}
