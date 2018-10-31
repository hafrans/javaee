package com.hafrans.bank.member.mapper;

import java.util.List;

import com.hafrans.bank.member.beans.domain.CmInfo;

public interface CmInfoMapper {
	
	
	public abstract List<CmInfo> findAll();
	
	public abstract CmInfo findById(int id);
	
	public abstract int create(CmInfo info);
	
	public abstract int update(CmInfo info);
	
	public abstract int delete(int id);
	
	
}
