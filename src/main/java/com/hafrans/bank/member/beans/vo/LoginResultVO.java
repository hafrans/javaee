package com.hafrans.bank.member.beans.vo;

/**
 * Login Result VO
 * @author Plex
 *
 */
public class LoginResultVO {
	
	private int status;
	private String msg;
	private String redirectURI;
	
	public LoginResultVO(){
		
	}
	
	public LoginResultVO(int status,String msg,String redirectURI){
		this.msg = msg;
		this.status = status;
		this.redirectURI = redirectURI;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getRedirectURI() {
		return redirectURI;
	}
	public void setRedirectURI(String redirectURI) {
		this.redirectURI = redirectURI;
	}
	
	
	
}
