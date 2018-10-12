package com.hafrans.bank.test.mybatis;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hafrans.bank.member.beans.domain.CmInfoWork;
import com.hafrans.bank.member.mapper.CmInfoWorkMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml")
public class CmInfoWorkTest {
	
	@Autowired
	private CmInfoWorkMapper mapper;
	
	@Test
	public void testSelect(){
		List<CmInfoWork> list = mapper.findAll();
		System.out.println(list);
	}
	
}
