package com.hafrans.bank.test.mybatis;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hafrans.bank.member.beans.domain.CInfo;
import com.hafrans.bank.member.mapper.CInfoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/applicationContext.xml")
public class CInfoTest {
	
	
	@Autowired
	private CInfoMapper mapper;
	
	private final static boolean test = true;
	
	@Test
	public void findAllTest(){
		if(test){
			List<CInfo> list = mapper.findAll();
			for(CInfo client : list){
				System.out.println(client);
			}
		}
	}
	
	
	@SuppressWarnings("unused")
	@Test
	public void insertTest(){
		
		if(test && false){
			
			CInfo info = new CInfo();
			
			info.setSsn("12345678901324581");
			info.setBalance(100.2);
			info.setAdd("Nothing");
			info.setBusiness("No Business");
			info.setCmId(1);
			info.setName("Steaker");
			info.setSalary(15220.1);
			info.setTel("12344448888");
			info.setUnit("NO UNIT");
			
			mapper.insert(info);
			
			
		}
		
	}
	
	@Test
	public void updateTest(){
		
		if(test){
			
			
			CInfo info = mapper.findById(16);
			System.out.println(info);
			info.setName("Hafrans");
			mapper.update(info);
			
			CInfo info2 = mapper.findById(16);
			assertEquals(info.getName(), info2.getName());
			System.out.println(info2.getName());
			
		}
		
		
	}
	
}
