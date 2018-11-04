package com.hafrans.bank.member.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import com.hafrans.bank.member.beans.domain.CInfo;
import com.hafrans.bank.member.mapper.CInfoMapper;
import com.hafrans.bank.member.service.CInfoService;
import com.hafrans.bank.utils.toolkit.BeansToolkit;

@Service
public class CInfoServiceImpl implements CInfoService {

	@Autowired
	private CInfoMapper mapper;
	
	
	@Override
	public List<CInfo> findAll() {
		return mapper.findAll();
	}

	@Override
	public int update(CInfo info) throws DataIntegrityViolationException, ReflectiveOperationException {
		
		if(info.getKey() == 0){
			return 0;
		}
		
		//populate beans
		
		CInfo origin  = mapper.findById(info.getKey());
		System.out.println(origin);
		origin = BeansToolkit.<CInfo>populate(info, origin);
		System.out.println(info);
		System.out.println(origin);
		return mapper.update(origin);
	}

	@Override
	public int delete(int id) {
		return mapper.delete(id);
	}

	@Override
	public int create(CInfo info) {
		return mapper.insert(info);
	}

	@Override
	public CInfo findByStringId(String id) {
		if(id == null || "".contentEquals(id) ){
			return null;
		}
		return mapper.findById(Integer.valueOf(id));
	}

	@Override
	public List<CInfo> findByInfo(String cmshowno, String cssn, String cname) {
		
		//filter 
		
		Map<String,String> info = new HashMap<String, String>();
		
		info.put("cmshowno",cmshowno.contentEquals("")? null : cmshowno);
		info.put("cssn","".equals(cssn) ? null : cssn);
		info.put("cname","".contentEquals(cname) ? null : cname);
		
		return mapper.findByInfo(cname, cssn, cmshowno);
	}

	@Override
	public int delete(List<Integer> id) {
		return mapper.deleteBatch(id);
	}
	
	



}
