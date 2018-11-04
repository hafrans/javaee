package com.hafrans.bank.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataIntegrityViolationException;

import com.hafrans.bank.member.beans.domain.CInfo;

public interface CInfoService {
	
	public abstract List<CInfo> findAll();
	
	public abstract CInfo findByStringId(String id);
	
	public abstract List<CInfo> findByInfo(String cmshowno,String cssn, String cname);
	
	public abstract int update(CInfo info) throws DataIntegrityViolationException, ReflectiveOperationException;
	
	public abstract int delete(int id);
	
	public abstract int create(CInfo info);
	
}
