package com.hafrans.bank.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hafrans.bank.member.beans.vo.LoginResultVO;
import com.hafrans.bank.member.mapper.YcMemberMapper;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

/**
 * 用户区控制器
 * 
 * @author Plex
 *
 */
@Controller("memberIndex")
@RequestMapping("/Member")
@SessionAttributes({ SessionConstraints.LOGIN_STATUS, SessionConstraints.LOGIN_ENTITY})
public class IndexController {

	@Autowired
	public SqlSession SqlSessionTemplate;

	@Autowired
	private YcMemberService ycMemberService;

	@Autowired
	private YcMemberMapper ycMemberMapper;

	@RequestMapping(value = { "/index", "/" })
	public String index() {

		return "member/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(String action,HttpSession session) {
		
		if("logout".equals(action)){
			session.invalidate();//退出登陆
		}
		
		return "member/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public LoginResultVO loginPost(@RequestParam("username") String usr, @RequestParam("password") String psw,
			Model model, HttpServletRequest res,HttpServletResponse resp) {
			
		switch (ycMemberService.checkLogin(usr, psw)) { //登陆状态判定
		case -2:
			return new LoginResultVO(-2, "用户不存在", "");
		case -1:
			return new LoginResultVO(-1, "该账号已被封禁，请联系管理员", res.getContextPath() + "/Member/index");
		case 0:
			return new LoginResultVO(0, "登陆失败，请检查您的用户口令", res.getContextPath() + "/Member/index");
		case 1:
			// 添加登陆信息
			model.addAttribute(SessionConstraints.LOGIN_ENTITY, ycMemberMapper.findByName(usr));
			model.addAttribute(SessionConstraints.LOGIN_STATUS, true);
			//记住密码
			Cookie cookieu = new Cookie("usr", usr);
			Cookie cookiep = new Cookie("pwd", psw);
			cookieu.setMaxAge(86400);
			cookiep.setMaxAge(86400);
			resp.addCookie(cookieu);
			resp.addCookie(cookiep);
			return new LoginResultVO(1, "登陆成功", res.getContextPath() + "/Member/index");
		case 2:
			return new LoginResultVO(1, "登陆成功", res.getContextPath() + "/Member/index");
		default:
			return new LoginResultVO(9, "未知错误", "");
		}
	}
	
	@RequestMapping("/resource")
	public String resource(String resourceName){
		String url = "common/404";
		switch(resourceName){
		case "left":
			url = "member/left";
			break;
		case "index":
			url = "member/index";
			break;
		case "top":
			url = "member/top";
			break;
		}
		return url;
	}

}
