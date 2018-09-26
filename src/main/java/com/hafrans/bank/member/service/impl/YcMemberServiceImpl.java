package com.hafrans.bank.member.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.mapper.YcMemberMapper;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.toolkit.GenericToolkit;

@Service("ycMemberService")
public class YcMemberServiceImpl implements YcMemberService {

	
	@Autowired
	private YcMemberMapper ycMemberMapper;
	
	
	@Override
	public int checkLogin(String username, String password) {
		YcMember member = ycMemberMapper.findByName(username);
		
		if(member == null )
			return -2;
		if(!member.getIsEnable().contentEquals("T")){
			return -1;
		}else if(!password.contentEquals(member.getPassword())){
			return 0;
		}else{
			return 1;
		}
	}

	@Override
	public boolean addMember(YcMember member) throws DataIntegrityViolationException {
		
		try{
			return ycMemberMapper.create(member) == 1 ? true:false;
		}catch(DataIntegrityViolationException e){
			throw e;
		}
	}

	@Override
	public boolean updateMember(YcMember member) throws DataIntegrityViolationException{
		try{
			return ycMemberMapper.update(member) == 1 ;
		}catch(DataIntegrityViolationException e){
			throw e;
		}
	}

	@Override
	public boolean updateLastTime(YcMember member) {
		return ycMemberMapper.updateLastTimeByid(member.getId());
	}

	@Override
	public boolean deleteMember(YcMember member) {
		return ycMemberMapper.delete(member.getId()) == 1;
	}

	@Override
	public List<YcMember> listAllMember(int count, int page) {
		if(count == 0){
			count = 25;
		}
		if(page == 0){
			page = 1;
		}
		return ycMemberMapper.listPagedMember(GenericToolkit.PagedInfoMapBuilder((page - 1 )*count, count));
	}

	@Override
	public List<YcMember> listAllMember() {
		return ycMemberMapper.findAll();
	}

	@Override
	public int delete(List<Integer> ids) {
		return ycMemberMapper.deletePatch(ids);
	}
	
	@Override
	public boolean enable(int id) {
		return this.enable(Arrays.asList(new Integer[]{id})) == 1;
	}

	@Override
	public boolean disable(int id) {
		return this.disable(Arrays.asList(new Integer[]{id})) == 1;
	}

	@Override
	public int disable(List<Integer> ids) {
		return ycMemberMapper.disablePatch(ids);
	}

	@Override
	public int enable(List<Integer> ids) {
		return ycMemberMapper.enablePatch(ids);
	}
	
	
}
