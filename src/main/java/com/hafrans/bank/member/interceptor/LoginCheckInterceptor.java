package com.hafrans.bank.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

/**
 * 拦截器
 * 检查是否在登陆状态
 * @author Plex
 *
 */
public class LoginCheckInterceptor implements HandlerInterceptor {
	
	@Autowired
	private YcMemberService service;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		
		HttpSession session = arg0.getSession();
		
		Object obj = session.getAttribute(SessionConstraints.LOGIN_ENTITY);
		
		if( obj == null){
			//转发
			arg1.sendRedirect(arg0.getContextPath()+"/Member/login");
			return false;
		}else{
			YcMember entity = (YcMember) session.getAttribute(SessionConstraints.LOGIN_ENTITY);
			service.updateLastTime(entity);
			return true;
		}
		
		
		
	}

}
