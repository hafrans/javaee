package com.hafrans.bank.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("memberWorkMgr")
@RequestMapping("/Member/WorkMgr")
public class WorkMgrController {
	
	
	
	
	@RequestMapping(value={"/index","/"})
	public String index(){
		return "member/workmgr/index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "member/workmgr/add";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(){
		return "member/workmgr/update";
	}
	
	
}
