package com.hafrans.bank.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Index")
public class IndexController {
	
	
	@RequestMapping("/index")
	public String index(){
		return "member/login";
	}
	
	
}
