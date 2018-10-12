package com.hafrans.bank.member.service;

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
	
	public abstract boolean deleteOne(CmInfoWork work);
	
	public abstract boolean deleteOneById(int id);
	
	public abstract int delete(List<Integer> ids);
	
	public abstract boolean update(CmInfoWork work);
	
	
}
