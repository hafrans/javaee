package com.hafrans.bank.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hafrans.bank.member.beans.domain.CInfo;

/**
 * CInfo Mapper
 * 
 * @author Plex
 *
 */
public interface CInfoMapper {

	/**
	 * find all
	 * 
	 * @return
	 */
	public abstract List<CInfo> findAll();

	public abstract CInfo findById(int id);

	public abstract int update(CInfo info);

	public abstract int delete(int key);

	public abstract int insert(CInfo info);

	public abstract List<CInfo> findByInfo(@Param("cname") String name, @Param("cssn") String cssn,
			@Param("cmshowno") String cmshowno);

}
