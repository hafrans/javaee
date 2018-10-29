package com.hafrans.bank.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.hafrans.bank.member.beans.domain.CInfo;
import com.hafrans.bank.member.mapper.CInfoMapper;
import com.hafrans.bank.member.service.CInfoService;

@Service
public class CInfoServiceImpl implements CInfoService {

	@Autowired
	private CInfoMapper mapper;
	
	
	@Override
	public List<CInfo> findAll() {
		return mapper.findAll();
	}

	@Override
	public int update(CInfo info) throws DataIntegrityViolationException {
		
		if(info.getKey() == 0){
			return 0;
		}
		
		return mapper.update(info);
	}

	@Override
	public int delete(int id) {
		return mapper.delete(id);
	}

	@Override
	public int create(CInfo info) {
		return mapper.insert(info);
	}

}
