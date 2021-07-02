package com.quantom.audition_tree.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quantom.audition_tree.dto.Member;
import com.quantom.audition_tree.dto.ResultData;
import com.quantom.audition_tree.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping("/usr/member/showList")
	public String showList(Model model) {

		List<Member> members = memberService.getMembers();

		model.addAttribute("members", members);
		return "/home/main";
	}

	@RequestMapping("/usr/member/join")
	public String join(Model model) {

		return "member/join";
	}

	@ResponseBody
	@RequestMapping("/usr/member/doJoin")
	public String doJoin(Model model, @RequestParam Map<String, Object> param) {

		int id = (int) memberService.doJoin(param);

		return "<script>alert('회원가입되셨습니다.'); location.replace('../home/main'); </script>";
	}
	@ResponseBody
	@GetMapping("/usr/member/checkLoginIdDupAjax")
	public ResultData checkLoginIdDupAjax(String loginId) {

		Member member = memberService.getMemberByLoginId(loginId);
		if (member == null) {
			return new ResultData("S-1", "사용가능한 아이디입니다.");
		}
		return new ResultData("F-1", "이미 사용중인 아이디입니다.");

	}
}
