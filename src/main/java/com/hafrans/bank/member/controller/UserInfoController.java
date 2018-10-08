package com.hafrans.bank.member.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.beans.formatter.TimeStampFormatter;
import com.hafrans.bank.member.beans.vo.GenericResultVO;
import com.hafrans.bank.member.beans.vo.LoginResultVO;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

@Controller("memberUserInfo")
@RequestMapping("/Member/UserInfo")
@SessionAttributes({ SessionConstraints.LOGIN_STATUS, SessionConstraints.LOGIN_ENTITY})
public class UserInfoController {
	
	
	@Autowired
	private YcMemberService ycMemberService;
	
	
	@Autowired
	private TimeStampFormatter timeStampformatter;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		System.out.println("processing webdatabinder");
		binder.addCustomFormatter(timeStampformatter);
	}
	
	
	/**
	 * 主页
	 * @param page
	 * @param count
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"","/index"})
	public String index(@RequestParam(value="page",defaultValue="1") int page, @RequestParam(value="page",defaultValue="25") int count,Model model){
		
		List<YcMember> members = ycMemberService.listAllMember(count, page);
		model.addAttribute("userlist",  members);
			
		return "member/userinfo/index";
	}
	
	/**
	 * 禁用
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/disable",method=RequestMethod.POST)
	@ResponseBody
	public LoginResultVO disable(@RequestParam("id[]") List<Integer> id){
		
		if(id.size() == ycMemberService.disable(id)){
			return new LoginResultVO(1,"账号关闭成功","");
		}else{
			return new LoginResultVO(0,"账号关闭失败","");
		}
		
	}
	
	/**
	 * 启用
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/enable",method=RequestMethod.POST)
	@ResponseBody
	public LoginResultVO enable(@RequestParam("id[]") List<Integer> id){
		if(id.size() == ycMemberService.enable(id)){
			return new LoginResultVO(1,"账号开启成功","");
		}else{
			return new LoginResultVO(0,"账号开启失败","");
		}
	}
	
	/**
	 * 重置密码为123456
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	@ResponseBody
	public LoginResultVO resetPassword(@RequestParam("id[]") List<Integer> id){
		if(id.size() == ycMemberService.enable(id)){
			return new LoginResultVO(1,"账号密码均重置为123456","");
		}else{
			return new LoginResultVO(0,"账号密码重置失败","");
		}
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "member/userinfo/add";
	}
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public GenericResultVO addMember(YcMember member){
		System.out.println(member.getBorn());
		try{
			if(ycMemberService.addMember(member)){
				return new GenericResultVO(1, "用户添加成功！",new Date());
			}else{
				return new GenericResultVO(0, "添加失败！",new Date());
			}
		}catch(Exception e){
			e.printStackTrace();
			return new GenericResultVO(0, "添加失败！用户名可能有重复",new Date());
		}
		
	}
	
}
