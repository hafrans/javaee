package com.hafrans.bank.member.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.hafrans.bank.member.beans.domain.YcMember;
import com.hafrans.bank.member.mapper.YcMemberMapper;
import com.hafrans.bank.member.service.YcMemberService;
import com.hafrans.bank.utils.toolkit.BeansToolkit;
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
	public boolean updateMember(YcMember member) throws DataIntegrityViolationException,IllegalArgumentException, ReflectiveOperationException{
		//first poplulate
		if(member == null){
			throw new IllegalArgumentException("member 信息注入失败！");
		}
		YcMember origin =  this.findbyInfo(null, String.valueOf(member.getId())).get(0);
		YcMember newMember = BeansToolkit.populate(member, origin);
		try{
			return ycMemberMapper.update(newMember) == 1 ;
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
		if(ids == null || ids.size() == 0){
			return 0;
		}
		return ycMemberMapper.disablePatch(ids);
	}

	@Override
	public int enable(List<Integer> ids) {
		if(ids == null || ids.size() == 0){
			return 0;
		}
		return ycMemberMapper.enablePatch(ids);
	}

	@Override
	public int resetPassword(List<Integer> ids) {
		if(ids == null || ids.size() == 0){
			return 0;
		}
		return ycMemberMapper.resetPassword(ids);
	}

	@Override
	public List<YcMember> findbyInfo(String name, String id) {
		
		String processId = null;
		
		if(name == null || "".equals(name)){
			name = null;
		}
		
		try{
			if(id != null && ! "".equals(id)){
				processId = String.valueOf(Integer.valueOf(id));
			}
		}catch(Exception e){
			processId = null;
			//do nothing. let it go.
		}
		
		Map<String,String> map = new HashMap<>();
		map.put("id", processId);
		map.put("name",name);
		
		return ycMemberMapper.findbyInfo(map);
	}
	
	
}
