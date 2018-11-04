package com.hafrans.bank.member.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

/*
 * Copyright 2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.hafrans.bank.member.beans.vo.GenericResultVO;
import com.hafrans.bank.member.mapper.CmInfoMapper;
import com.hafrans.bank.member.service.CInfoService;
import com.hafrans.bank.utils.constraints.SessionConstraints;

@Controller("memberClientInfo")
@RequestMapping("/Member/ClientInfo")
@SessionAttributes({SessionConstraints.LOGIN_ENTITY})
public class ClientInfoController {
	
	@Autowired
	private CInfoService service;
	
	
	@Value("${defaultPageSize}")
	private int pageSize;
	
	@Autowired
	private CmInfoMapper mapper;
	
	
	
	@RequestMapping(value={"/","/index"})
	public String index(Model model,@RequestParam(value="page",required=false,defaultValue="1") int page){
		if(page <= 0){
			page = 1;
		}
		System.out.println("Hello!");
		PageHelper.startPage(page,pageSize);
		List<CInfo> list = service.findAll();
		Page<CInfo> info = (Page<CInfo>) list;
		model.addAttribute("list", list);
		model.addAttribute("total", info.getTotal());
		model.addAttribute("current", info.getPageNum());
		model.addAttribute("max", info.getPages());
		info.close();
		
		return "member/clientinfo/index";
	}
	
	
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(){
		return "member/clientinfo/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public GenericResultVO addClient(CInfo info,@ModelAttribute(SessionConstraints.LOGIN_ENTITY) YcMember me){
		
		try{	
			if(mapper.findById(me.getId()) == null){
				return new GenericResultVO(0, "您没有客户经理的权限！",new Date());
			}
			info.setCmId(me.getId());
			if(service.create(info) == 1){
				return new GenericResultVO(1, "用户添加成功！",new Date());
			}else{
				return new GenericResultVO(0, "添加失败！",new Date());
			}
		}catch(Exception e){
			e.printStackTrace();
			return new GenericResultVO(0, "添加失败！客户可能有重复",new Date());
		}
		
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String updateShow(@RequestParam String id,Model model){
		
		CInfo info = service.findByStringId(id);
		if(info == null){
			throw new IllegalArgumentException("can not find a id");
		}
		
		model.addAttribute("item", info);
		
		return "member/clientinfo/update";
	}
	
	
	
}
