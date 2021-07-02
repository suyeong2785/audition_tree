package com.quantom.audition_tree.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quantom.audition_tree.dto.Member;
import com.quantom.audition_tree.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping("/usr/member/showList")
	public String showList(Model model) {
		
		List<Member> members =  memberService.getMembers();
		
		model.addAttribute("members",members);
		return "/home/main";
	}
	
	@RequestMapping("/usr/member/join")
	public String join(Model model) {
		
		return "member/join";
	}
	
	@RequestMapping("/usr/member/doJoin")
	public String doJoin(Model model,@RequestParam Map<String, Object> param) {
		
		int id = (int)memberService.doJoin(param);
		
		return "al";
	}
}
