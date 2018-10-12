package com.hafrans.bank.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hafrans.bank.member.beans.domain.CmInfoWork;
import com.hafrans.bank.member.mapper.CmInfoWorkMapper;
import com.hafrans.bank.member.service.CmInfoWorkService;


@Service("cmInfoWorkService")
public class CmInfoWorkServiceImpl implements CmInfoWorkService {

	@Autowired
	private CmInfoWorkMapper mapper;
		
	@Override
	public boolean addOne(CmInfoWork work) throws Exception {
		//检查
		boolean result = false;
		if(work.getDate() == null){
			throw new Exception("日期为空");
		}
		if(work.getProduct() == null){
			throw new Exception("产品为空");
		}
		
		//入库操作
		try{
			result = mapper.add(work) == 1;
		}catch(Exception e){
			result = false;
			throw e;
		}
		return result;
	}

	@Override
	public List<CmInfoWork> findAll() {
		return mapper.findAll();
	}

	@Override
	public boolean deleteOne(CmInfoWork work) {
		
		return mapper.deleteById(work.getKey()) == 1;
	}

	@Override
	public boolean deleteOneById(int id) {
		return mapper.deleteById(id) == 1;
	}

	@Override
	public int delete(List<Integer> ids) {
		
		return mapper.delete(ids);
	}

	@Override
	public boolean update(CmInfoWork work) {
		return mapper.update(work) == 1;
	}

}
