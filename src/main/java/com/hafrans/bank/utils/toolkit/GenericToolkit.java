package com.hafrans.bank.utils.toolkit;

import java.util.HashMap;

public final class GenericToolkit {
	
	
	public static HashMap<String,Integer> PagedInfoMapBuilder(int start,int length){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("length", length);
		return map;
	}
	
}
