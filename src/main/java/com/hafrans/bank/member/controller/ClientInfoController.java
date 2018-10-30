package com.hafrans.bank.member.controller;

import org.springframework.beans.factory.annotation.Autowired;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hafrans.bank.member.service.CInfoService;

@Controller("memberClientInfo")
@RequestMapping("/Member/ClientInfo")
public class ClientInfoController {
	
	@Autowired
	private CInfoService service;
	
	
	@RequestMapping(value={"/","/index"})
	public String index(Model model){
		model.addAttribute("list", service.findAll());
		return "member/clientinfo/index";
	}
	
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String updateShow(@RequestParam String id){
		
		
		
		
		return "member/client/update";
	}
	
	
	
}
