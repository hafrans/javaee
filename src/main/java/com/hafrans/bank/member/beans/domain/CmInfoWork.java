package com.hafrans.bank.member.beans.domain;

import java.sql.Date;

/**
 * 对应 GZCRM_CMINFO_WORK 客户经理工作管理
 * @author Administrator
 *
 */
public class CmInfoWork {
	
	public static final String TABLE_PREFIX = "GZCRM";
	
	private int    key;
	private int id;
	private String management;
	private String product;
	private String loan;
	private String warning;
	private String issue;
	private String workProposal;
	private Date   date;
	
	////association
	private CmInfo cm;
	
	
	public CmInfo getCm() {
		return cm;
	}
	public void setCm(CmInfo cm) {
		this.cm = cm;
	}
	
	public int getKey() {
		return key;
	}
	public void setKey(int key) {
		this.key = key;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getManagement() {
		return management;
	}
	public void setManagement(String management) {
		this.management = management;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getLoan() {
		return loan;
	}
	public void setLoan(String loan) {
		this.loan = loan;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public String getIssue() {
		return issue;
	}
	public void setIssue(String issue) {
		this.issue = issue;
	}
	public String getWorkProposal() {
		return workProposal;
	}
	public void setWorkProposal(String workProposal) {
		this.workProposal = workProposal;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "CmInfoWork [key=" + key + ", id=" + id + ", management=" + management + ", product=" + product
				+ ", loan=" + loan + ", warning=" + warning + ", issue=" + issue + ", workProposal=" + workProposal
				+ ", date=" + date + "]";
	}
	
	
	
	
	
}
