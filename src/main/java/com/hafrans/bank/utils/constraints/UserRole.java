package com.hafrans.bank.utils.constraints;

public enum UserRole {
	ADMIN(1),
	MANAGER(2);
	
	private int code;
	
	private UserRole(int v){
		this.code = v;
	}

	public int getCode() {
		return code;
	}
	
}
