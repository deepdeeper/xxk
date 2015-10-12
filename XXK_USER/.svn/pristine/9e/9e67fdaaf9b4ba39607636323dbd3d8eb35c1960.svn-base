package com.lzzyyy.xxk.user.web.struts2.action;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;



import com.lzzyyy.xxk.user.pojo.SysLog;
import com.lzzyyy.xxk.user.web.vo.SysLogVo;
import com.lzzyyy.xxk.user.web.vo.SysUserVo;
import com.opensymphony.xwork2.ActionSupport;


public class BaseAction extends ActionSupport implements ServletRequestAware,ServletResponseAware {
	private static final long serialVersionUID = 1L;
	public static Logger logger = Logger.getLogger(BaseAction.class); 
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;
	private SysUserVo currentUserVo;
	
	private int winType = 0;
	private String source = "";
	private String showMessage = "";
	private int time = 0;
	
	public static Logger getLogger() {
		return logger;
	}
	public static void setLogger(Logger logger) {
		BaseAction.logger = logger;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getShowMessage() {
		return showMessage;
	}
	public void setShowMessage(String showMessage) {
		this.showMessage = showMessage;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public int getWinType() {
		return winType;
	}
	public void setWinType(int winType) {
		this.winType = winType;
	}

	public void setServletRequest(HttpServletRequest arg0) {
		this.request = arg0;
		this.session = request.getSession();
		this.currentUserVo = (SysUserVo) getSession().getAttribute("sysUser");;
	}
	
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}
	public SysUserVo getCurrentUserVo() {
		return currentUserVo;
	}
	public void setCurrentUserVo(SysUserVo currentUserVo) {
		this.currentUserVo = currentUserVo;
	}
	
	
	
	
	public SysLogVo getLogVo(int type,String message){
		SysLogVo log = new SysLogVo();
		log.setLogIP(request.getRemoteHost());
		log.setLogPage(request.getRequestURI());
		log.setLogTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		if(type==1){
			log.setUserName(message);
			log.setOperationDetails(message+"成功登录系统"); 
			log.setLogType("登录日志");
		}else{
			SysUserVo currentUser = (SysUserVo) session.getAttribute("sysUser");
			if(currentUser!=null){
				log.setUserName(currentUser.getUserName());
				log.setRealName(currentUser.getRealName());
				log.setOperationDetails(message); 
				log.setLogType("操作日志");
			}
		}
		return log;
	}
	public SysLog getLog(int type,String message){
		SysLog log = new SysLog();
		log.setLogIP(request.getRemoteHost());
		log.setLogPage(request.getRequestURI());
		log.setLogTime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		if(type==1){
			log.setUserName(message);
			log.setOperationDetails(message+"成功登录系统"); 
			log.setLogType("登录日志");
		}else{
			SysUserVo currentUser = (SysUserVo) session.getAttribute("sysUser");
			if(currentUser!=null){
				log.setUserName(currentUser.getUserName());
				log.setRealName(currentUser.getRealName());
				if(message.length()>200){
					message = message.substring(0, 199);
				}
				log.setOperationDetails(message); 
				log.setLogType("操作日志");
			}
		}
		return log;
	}
	
	public String getBasePath(){
		String path = getRequest().getContextPath();
    	String basePath = getRequest().getScheme() + "://"+ getRequest().getServerName() + ":" + getRequest().getServerPort();
    	if("/".equalsIgnoreCase(path)) {
    		basePath += "/";
    	}else{
    		basePath += path + "/";
    	}
    	return basePath;
	}
	
	
	/**
	 *
	 * @author 向才鹏
	 * @param type -1为子弹出框 0为弹出框  1为页面
	 * @param source 跳转的页面
	 * @param message 信息
	 * @param time 关闭时间 -1是永不关闭
	 * Nov 12, 2010   11:49:21 AM
	 */
	public void showMessage(int type,String source,String message,int time){
		this.winType = type;
		this.source = source;
		this.showMessage = message;
		this.time = time;
	}
}