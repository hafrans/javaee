package com.hafrans.bank.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbsIndex")
@RequestMapping("/bbs")
public class IndexController {
	
	@RequestMapping(value={"/","/index"})
	public String index(){
		return "bbs/index";
	}
	
	
}
