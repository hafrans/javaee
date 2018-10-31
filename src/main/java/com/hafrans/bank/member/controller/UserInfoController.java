package com.hafrans.bank.member.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hafrans.bank.member.beans.domain.CInfo;
import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.beans.formatter.TimeStampFormatter;
import com.hafrans.bank.member.beans.vo.GenericResultVO;
import com.hafrans.bank.member.beans.vo.LoginResultVO;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

@Controller("memberUserInfo")
@RequestMapping("/Member/UserInfo")
@SessionAttributes({ SessionConstraints.LOGIN_STATUS, SessionConstraints.LOGIN_ENTITY,"update_entity_id"})
public class UserInfoController {
	
	
	@Autowired
	private YcMemberService ycMemberService;
	
	@Value("${defaultPageSize}")
	private int pageSize;
	
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
	public String index(@RequestParam(required=false,value="name")String name, @RequestParam(required=false) String id,@RequestParam(value="page",required=false,defaultValue="1") int page,Model model){
		if(page <= 0){
			page = 1;
		}
		List<YcMember> members = null;
		PageHelper.startPage(page,pageSize);
		if(name != null || id != null){
			members = ycMemberService.findbyInfo(name, id);
		}else{
			members = ycMemberService.listAllMember();
		}
		Page<YcMember> info = (Page<YcMember>) members;
		model.addAttribute("userlist",  members);
		model.addAttribute("total", info.getTotal());
		model.addAttribute("current", info.getPageNum());
		model.addAttribute("max", info.getPages());
		info.close();
			
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
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(String id,Model model){
		
		YcMember member = ycMemberService.findbyInfo(null, id).get(0);
		model.addAttribute("entity", member);
		model.addAttribute("update_entity_id", id);
		return "member/userinfo/update";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	@ResponseBody
	public GenericResultVO updateSumbit(YcMember member,@ModelAttribute("update_entity_id") String id){	
		if(id == null || member.getId() != Integer.valueOf(id)){
			return new GenericResultVO(0, "未知错误！",new Date());
		}
		try{
			if(ycMemberService.updateMember(member)){
				return new GenericResultVO(1, "用户修改成功！",new Date());
			}else{
				return new GenericResultVO(0, "修改失败！",new Date());
			}
		}catch(Exception e){
			e.printStackTrace(System.err);
			return new GenericResultVO(0, "添加失败！"+e.getClass().getSimpleName(),new Date());
		}
	}
	
	
}
