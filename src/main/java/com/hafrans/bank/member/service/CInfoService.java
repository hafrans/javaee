package com.hafrans.bank.member.service;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;

import com.hafrans.bank.member.beans.domain.CInfo;

public interface CInfoService {
	
	public abstract List<CInfo> findAll();
	
	public abstract int update(CInfo info) throws DataIntegrityViolationException;
	
	public abstract int delete(int id);
	
	public abstract int create(CInfo info);
	
}
