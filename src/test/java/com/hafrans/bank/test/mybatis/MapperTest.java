package com.hafrans.bank.test.mybatis;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.mapper.YcMemberMapper;
import com.hafrans.bank.utils.toolkit.GenericToolkit;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:config/applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	YcMemberMapper ycMemberMapper;
	
	//@Test
	public void testYcMemberRetrive(){
		List<YcMember> members = ycMemberMapper.findAll();
		for(YcMember m : members){
			System.out.println(m);
		}
		System.out.println("=================================");
		System.out.println(ycMemberMapper.findById(1));
		
	}
	
	@Test
	public void testCreate(){
		
		YcMember member = new YcMember();
		member.setName("中国移动");
		member.setSex("F");
		member.setIsEnable("T");
		member.setBorn(new java.sql.Timestamp(System.currentTimeMillis()));
		member.setMail("hafrans@163.com");
		member.setPassword("666");
		member.setQuestion("Q");
		member.setAnswer("A");
		
		try{
			assertEquals(1, ycMemberMapper.create(member));
		}catch(DuplicateKeyException e){
			e.printStackTrace();
			assertEquals(true, e instanceof DataIntegrityViolationException);
		}
		
	}
	
	//@Test
	public void testUpdate(){
		YcMember member = ycMemberMapper.findById(1000);
		member.setName("中国联通");
		assertEquals(1, ycMemberMapper.update(member));
	}
	
	//@Test
	public void testDelete(){
		System.out.println(ycMemberMapper.delete(1001));
	}
	
	@Test
	public void testUpdateLastTime(){
		System.err.println(">>>update"+ycMemberMapper.updateLastTimeByid(1001));
	}
	
	@Test
	public void testPagedList(){
		
		List<YcMember> members = ycMemberMapper.listPagedMember(GenericToolkit.PagedInfoMapBuilder(0, 10));
		
		for(YcMember m : members){
			System.out.println(m);
		}
		
	}
	
	//@Test
	public void testDelete2(){
		
		System.out.println(ycMemberMapper.delete(1002));
		
		List<YcMember> members = ycMemberMapper.listPagedMember(GenericToolkit.PagedInfoMapBuilder(0, 10));
		
		for(YcMember m : members){
			System.out.println(m);
		}
	}
	
	
	
}
