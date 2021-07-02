package com.quantom.audition_tree.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

	@ResponseBody
	@RequestMapping("/usr/home/main")
	public String showHome() {
		
		return "HI!!!!";
	}
}
