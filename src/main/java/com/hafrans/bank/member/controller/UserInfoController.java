package com.hafrans.bank.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

@Controller("memberUserInfo")
@RequestMapping("/Member/UserInfo")
@SessionAttributes({ SessionConstraints.LOGIN_STATUS, SessionConstraints.LOGIN_ENTITY})
public class UserInfoController {
	
	
	@Autowired
	private YcMemberService ycMemberService;
	
	
	@RequestMapping(value={"","/index"})
	public String index(@RequestParam(value="page",defaultValue="1") int page, @RequestParam(value="page",defaultValue="25") int count,Model model){
		
		List<YcMember> members = ycMemberService.listAllMember(count, page);
		model.addAttribute("userlist",  members);
			
		return "member/userinfo/index";
	}
	
}
