package com.quantom.audition_tree.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.quantom.audition_tree.dao.MemberDao;
import com.quantom.audition_tree.dto.Member;
import com.quantom.audition_tree.util.Util;

@Service
public class MemberService {
	@Autowired
	MemberDao memberDao; 
	
	@Autowired
	MailService mailService;
	
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
	@Value("${custom.siteName}")
	private String siteName;
	
	@Autowired
	GenFileService genFileService;
	
	public List<Member> getMembers() {
		return memberDao.getMembers();
	}

	public int doJoin(Map<String, Object> param) {
		memberDao.doJoin(param);
		
		int id = Util.getAsInt(param.get("id"), 0);

		genFileService.changeInputFileRelIds(param, id);
		
		sendJoinCompleteMail((String) param.get("email"));
		
		return Util.getAsInt(param.get("id"),-1); 
	}

	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
		
	}
	
	private void sendJoinCompleteMail(String email) {
		String mailTitle = String.format("[%s] 가입이 완료되었습니다.", siteName);

		StringBuilder mailBodySb = new StringBuilder();
		mailBodySb.append("<h1>가입이 완료되었습니다.</h1>");
		mailBodySb.append(String.format("<p><a href=\"%s\" target=\"_blank\">%s</a>로 이동</p>", siteMainUri, siteName));

		mailService.send(email, mailTitle, mailBodySb.toString());
	}

}
