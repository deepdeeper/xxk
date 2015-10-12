package com.lzzyyy.xxk.user.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lzzyyy.xxk.user.utils.PromptUtil;
import com.lzzyyy.xxk.user.utils.ValidateUtil;

public class SessionInalidateFilter implements Filter{

	private FilterConfig config;
	private long   inalidateTime   =   600000;//超时时长（毫秒）   

	public void init(FilterConfig config) throws ServletException {
		System.out.println("Session过期验证"); 
		this.config = config;
	}
	
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
		if("true".equalsIgnoreCase(config.getInitParameter("isValidate"))){
			System.out.println("验证SESSION");
			String inalidateTimeString=config.getInitParameter("inalidateTime");
			
			if(!ValidateUtil.valideIsEmpty(inalidateTimeString)){
				inalidateTime = Long.parseLong(inalidateTimeString);
			}
			
			HttpServletRequest request = (HttpServletRequest)req;
			HttpServletResponse response = (HttpServletResponse)res;
			HttpSession session  = request.getSession(false);
			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			if(session != null && System.currentTimeMillis()-session.getLastAccessedTime()>inalidateTime)   
			  {   
				session.invalidate();   
				String url = basePath+"login/login.jsp";
				PromptUtil.print2(response, "你太久没有操作了，Session过期了！！", url);
			  }   
		}
		chain.doFilter(req, res);
	}
	
	public void destroy() {
		this.config = null;
	}
}
