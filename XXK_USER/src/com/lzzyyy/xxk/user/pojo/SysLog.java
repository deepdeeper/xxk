package com.lzzyyy.xxk.user.pojo;

import java.sql.Timestamp;
/**
 * 
 * @作者 yaxiu
 * 日志信息
 *@时间 2015-8-31
 */
public class SysLog {
	
	private String logId;
	
	private String logIP;
	
	private String userName;
	
	private String realName;
	
	private String logType;
	
	private Timestamp logTime;
	
	private String logPage;
	
	private String operationDetails;
	
	private String  remark;

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getLogIP() {
		return logIP;
	}

	public void setLogIP(String logIP) {
		this.logIP = logIP;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}

	public Timestamp getLogTime() {
		return logTime;
	}

	public void setLogTime(Timestamp logTime) {
		this.logTime = logTime;
	}

	public String getLogPage() {
		return logPage;
	}

	public void setLogPage(String logPage) {
		this.logPage = logPage;
	}

	public String getOperationDetails() {
		return operationDetails;
	}

	public void setOperationDetails(String operationDetails) {
		this.operationDetails = operationDetails;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
}

