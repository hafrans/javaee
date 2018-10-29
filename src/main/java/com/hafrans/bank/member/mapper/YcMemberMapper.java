package com.hafrans.bank.member.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hafrans.bank.member.beans.domain.YcMember;

/**
 * YC_MEMBER DATABASE ACCESS OBJECT
 * 
 * @author hafrans@163.com
 * @date Sep 23 2018
 */
public interface YcMemberMapper {

	// BASIC
	// R
	public abstract List<YcMember> findAll();
	
	public abstract YcMember findById(int id);
	
	public abstract YcMember findByName(String name);
	
	/**
	 * Find YcMembers by Info
	 * Supported Item as follows.
	 *  id:String  => int
	 *  name:String => String
	 * @param info
	 * @return
	 */
	public abstract List<YcMember> findbyInfo(Map<String,String> info);
	
	/**
	 * 分页
	 * @param hashmap
	 * 		K:start 开始offset
	 *      K:length 长度
	 * @return
	 */
	public abstract List<YcMember> listPagedMember(HashMap<String, Integer> hashmap);
	
	// U
	public abstract int update(YcMember member);
	// D
	public abstract int delete(int id);
	// C
	public abstract int create(YcMember member);

	public abstract boolean updateLastTimeByid(int id);
	
	
	public abstract int deletePatch(List<Integer> id);
	
	public abstract int enablePatch(List<Integer> id);
	
	public abstract int disablePatch(List<Integer> id);
	
	
	public abstract int resetPassword(List<Integer> id);
	


}
