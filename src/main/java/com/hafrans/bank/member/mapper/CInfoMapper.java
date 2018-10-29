package com.hafrans.bank.member.mapper;

import java.util.List;

import com.hafrans.bank.member.beans.domain.CInfo;

/**
 * CInfo Mapper
 * @author Plex
 *
 */
public interface CInfoMapper {
	
	/**
	 * find all
	 * @return
	 */
	public abstract List<CInfo> findAll();
	
	public abstract CInfo findById(int id);
	
	public abstract int update(CInfo info);
	
	public abstract int delete(int key);
	
	public abstract int insert(CInfo info);
	
	
}
