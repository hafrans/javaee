package com.hafrans.bank.member.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hafrans.bank.member.beans.domain.CmInfoWork;
import com.hafrans.bank.member.beans.vo.GenericResultVO;
import com.hafrans.bank.member.service.CmInfoWorkService;

@Controller("memberWorkMgr")
@RequestMapping("/Member/WorkMgr")
public class WorkMgrController {
	
	
	@Autowired
	private CmInfoWorkService service;
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.addCustomFormatter(new Formatter<java.sql.Date>() {
			
			private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			@Override
			public String print(Date arg0, Locale arg1) {
				return sdf.format(arg0);
			}

			@Override
			public Date parse(String arg0, Locale arg1) throws ParseException {
					return new java.sql.Date(sdf.parse(arg0).getTime());
			}
		});
	}
	
	
	@RequestMapping(value={"/index","/"})
	public String index(Model model){
		model.addAttribute("list",service.findAll());
		return "member/workmgr/index";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "member/workmgr/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public GenericResultVO add(CmInfoWork work){
		System.out.println(work);
		try{
			service.addOne(work);
		}catch(Exception e){
			e.printStackTrace();
			return new GenericResultVO(0, e.getMessage(), new java.util.Date());
		}
		return new GenericResultVO(1, work.toString(), new java.util.Date());
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(){
		return "member/workmgr/update";
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public GenericResultVO deleteBatch(@RequestParam("id[]") List<Integer> id){
		
		try{
			if(service.delete(id) == id.size()){
				return new GenericResultVO(1, "删除成功",new  java.util.Date());
			}else{
				return new GenericResultVO(0, "删除有部分失败",new  java.util.Date());
			}
			
		}catch(Exception e){
			return new GenericResultVO(0, e.getMessage(), new java.util.Date());
		}
		
		
	}
	
	
}
