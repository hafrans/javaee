package com.hafrans.bank.member.mapper;

import java.util.List;
import java.util.Map;

import com.hafrans.bank.member.beans.domain.CmInfoWork;

/**
 * GZCRM_CMINFO_WORK DAO
 * @author Administrator
 *
 */
public interface CmInfoWorkMapper {
	
	
	public abstract List<CmInfoWork> findByInfo(Map<String,String> info);
	
	public abstract List<CmInfoWork> findAll();
	
	public abstract CmInfoWork findById(int id);
	
	public abstract List<CmInfoWork> findAllLimited(int id);
	
	public abstract List<CmInfoWork> findAllPaged(Map<String,Integer> pageCount);
	
	public abstract int add(CmInfoWork work);
	
	public abstract int update(CmInfoWork work );
	
	public abstract int deleteById(int id);
	
	public abstract int delete(List<Integer> ids);
	
}
