package com.lzzyyy.xxk.user.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lzzyyy.xxk.user.utils.Constant;
import com.lzzyyy.xxk.user.utils.PromptUtil;
import com.lzzyyy.xxk.user.utils.ValidateUtil;



  



public class SecurityValidateFilter implements Filter{
	
	private FilterConfig config = null;
	
	public void init(FilterConfig config) throws ServletException {
		System.out.println("初始化安全验证");
		this.config = config;
	}

	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException {
		
	
		if("true".equalsIgnoreCase(config.getInitParameter("isValidate"))){
			HttpServletRequest request = (HttpServletRequest)req;
			HttpServletResponse response = (HttpServletResponse)res;
			HttpSession session  = request.getSession();
			//sso验证
//			SysUserService sysUserService =(SysUserService) AppContext.getBean("sysUserService");
//			String Lgoingname=request.getRemoteUser();//
//			
//		if(!"".equals(Lgoingname) && null !=Lgoingname && null ==session.getAttribute("sysUser")){
//				try {
//					System.out.println(SysUtil.WEBSERVICEIP);
//					SysUserVo user = sysUserService.login(Lgoingname, "", request.getRemoteAddr()+"");
//					session.setAttribute("sysUser",user);
//				} catch (Exception e) {
//					response.sendRedirect(SysUtil.SSOURL+"/login");
//				    return;
//				}
//				
//			}
			//UsernamePasswordCredentials user = (UsernamePasswordCredentials)request.getAttribute("USER");
		//	String userName = user.getUserName();
			
			SessionCounter.put(request.getSession().getId()); 

			String path = request.getContextPath();
			String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
			if(ValidateUtil.valideIsEmpty(session.getAttribute(Constant.CURRENT_USER))){
				Cookie[] cks = request.getCookies();
				if(cks != null) {
					for(Cookie c : cks) { //huang 这个地方貌似有问题，并不能做cookie验证
						if(Constant.USER_NAME_IN_COOKIE.equalsIgnoreCase(c.getName())) {
							String url = basePath+"login/login.jsp";
							//String url = basePath+"toIndex1.action";
							PromptUtil.print2(response, "", url);
						}
					}
				}
				String url = basePath+"login/login.jsp";
				//String url = basePath+"toIndex1.action";
				
				PromptUtil.print2(response, "为了安全考虑，重新登录系统！！", url);
			}
		}
		chain.doFilter(req, res);
	}

	public void destroy() {
		System.out.println("SecurityValidate  destroy");
		config = null;
	}
}
