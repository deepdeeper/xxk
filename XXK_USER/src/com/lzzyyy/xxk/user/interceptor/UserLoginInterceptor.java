package com.lzzyyy.xxk.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.service.UserService;
import com.lzzyyy.xxk.user.service.impl.UserServiceImpl;
import com.lzzyyy.xxk.user.utils.Constant;

/**
 * 用户登录的拦截器，判断用户是否登录
 * 
 * @作者 yaxiu
 * @时间 2015-9-10
 */

public class UserLoginInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {
		System.out.println("spring 用户登录验证开始");
		UserService userService = new UserServiceImpl();
		User user = new User();
		String userName = null;
		String userPwd = null;
		boolean isUserExist = false;// 用户是否存在

	

		if (null == request.getAttribute(Constant.CURRENT_USER)) { //判断用户是否已经登录
			/**
			 * 判断用户是否从cookie登录
			 */
			// 去拿cookies的用户名和密码
			Cookie[] cookies = request.getCookies();
			for (int i = 0; i < cookies.length; i++) {
				if (Constant.USER_NAME_IN_COOKIE.endsWith(cookies[i].getName())) {
					userName = cookies[i].getValue();
				}
				if (Constant.USER_PWD_IN_COOKIE.endsWith(cookies[i].getName())) {

					userPwd = cookies[i].getValue();
				}
				// 拿到用户名和密码后去后台查这个用户是否存在，若在则存入session，返回true
				if (null != userName && null != userPwd) {
					user.setUserName(userName);
					user.setUserPwd(userPwd);
					User findedUser = userService.frindByUserId(user);
					if (null != findedUser) {
						request.getSession().setAttribute(
								Constant.CURRENT_USER, findedUser);
						isUserExist = true;
					}else{
						return false;
					}

				} else { //cookie 里没有存userName、userPwd 直接返回false
					
					response.sendRedirect("jsp/user/login.jsp");
					return false;
				}

				/**
				 * 判断用户的权限
				 */

			}

		}

		return false;
	}

}
