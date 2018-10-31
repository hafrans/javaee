package com.hafrans.bank.test.mybatis;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hafrans.bank.member.beans.domain.CmInfo;
import com.hafrans.bank.member.mapper.CmInfoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:config/applicationContext.xml")
public class CmInfoTest {
	
	
	private final static boolean test = true;
	
	@Autowired
	private CmInfoMapper mapper;
	
	
	@Test
	public void findTest(){
		
		if(test){
			List<CmInfo> l = mapper.findAll();
			for (CmInfo item : l){
				System.out.println(item);
			}
			
			assertEquals("Tom",mapper.findById(2).getName());
		}
		
		
	}
	
	
	@Test
	public void updateTest(){
		
		if(test){
			
			CmInfo info = mapper.findById(2);
			System.out.println(info);
			long mills = System.currentTimeMillis();
			info.setSsn(String.valueOf(System.currentTimeMillis()));
			
			mapper.update(info);
			
			assertEquals(String.valueOf(mills), mapper.findById(2).getSsn());
		}
		
	}
	
}
