package com.hafrans.bank.member.service;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;

import com.hafrans.bank.member.beans.domain.YcMember;

/**
 * YC_MEMBER 信息表
 * @author Plex
 *
 */
public interface YcMemberService {
	
	/**
	 * 登陆验证
	 * @param username
	 * @param password
	 * @return
	 */
	public int checkLogin(String username,String password);
	
	/**
	 * 增加用户
	 * @param member
	 * @return
	 * @throws DataIntegrityViolationException
	 */
	public boolean addMember(YcMember member) throws DataIntegrityViolationException ;
	
	/**
	 * 修改用户
	 * @param member
	 * @return
	 * @throws DataIntegrityViolationException
	 * @throws ReflectiveOperationException 
	 * @throws IllegalArgumentException 
	 */
	public boolean updateMember(YcMember member) throws DataIntegrityViolationException, IllegalArgumentException, ReflectiveOperationException ;
	
	/**
	 * 更新登陆时间
	 * @param member
	 * @return
	 */
	public boolean updateLastTime(YcMember member);
	
	/**
	 * 删除用户
	 * @param member
	 * @return
	 */
	public boolean deleteMember(YcMember member);
	
	public int delete(List<Integer> ids);

	public List<YcMember> listAllMember(int count,int page);                                      
	
	public List<YcMember> listAllMember();
	
	public boolean enable(int id);
	public boolean disable(int id);
	
	public int disable(List<Integer> ids);
	public int enable(List<Integer> ids);
	
	public int resetPassword(List<Integer> ids);
	
	
	public List<YcMember> findbyInfo(String name,String id);

	
	
	
}
