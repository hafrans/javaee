package com.hafrans.bank.member.service;

import java.sql.Date;
import java.util.List;

import com.hafrans.bank.member.beans.domain.CmInfoWork;

/**
 * CmInfoWorkService Interface
 * @author Administrator
 *
 */
public interface CmInfoWorkService {
	
	
	public abstract boolean addOne(CmInfoWork work) throws Exception;
	
	public abstract List<CmInfoWork> findAll();
	
	public abstract List<CmInfoWork> findByInfo(String id,Date date);
	
	public abstract List<CmInfoWork> findByLimited(int limit);
	
	public abstract List<CmInfoWork> findByInfoLimited(String id,Date date,String limit);
	
	public abstract CmInfoWork find(int id);
	
	public abstract boolean deleteOne(CmInfoWork work);
	
	public abstract boolean deleteOneById(int id);
	
	public abstract int delete(List<Integer> ids);
	
	public abstract boolean update(CmInfoWork work);
	
	
}
