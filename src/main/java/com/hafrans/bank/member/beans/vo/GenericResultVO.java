package com.hafrans.bank.member.beans.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class GenericResultVO {
	
	public int status;
	public String msg;
	public String timeStamp;
	
	public GenericResultVO(int status,String msg,Date timeStamp){
		this.status = status;
		this.msg = msg;
		this.timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(timeStamp);
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
	public String getTimeStamp() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}


	@Override
	public String toString() {
		return "GenericResultVO [status=" + status + ", msg=" + msg + ", timeStamp=" + timeStamp + "]";
	}
	
	
	
	
}
