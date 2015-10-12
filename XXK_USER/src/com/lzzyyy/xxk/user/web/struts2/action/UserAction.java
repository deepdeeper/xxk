package com.lzzyyy.xxk.user.web.struts2.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.login.LoginException;
import javax.servlet.http.Cookie;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import com.lzzyyy.xxk.user.pojo.User;
import com.lzzyyy.xxk.user.pojo.UserTeam;
import com.lzzyyy.xxk.user.service.UserService;
import com.lzzyyy.xxk.user.service.UserTeamService;
import com.lzzyyy.xxk.user.utils.Constant;
import com.lzzyyy.xxk.user.utils.PageBean;
import com.lzzyyy.xxk.user.utils.PromptUtil;
import com.lzzyyy.xxk.user.web.vo.SysUserVo;
import com.lzzyyy.xxk.user.web.vo.UserTeamVo;

public class UserAction extends BaseAction {
	private UserService userService;
	private UserTeamService teamService;
	private User user;
	private UserTeam team;
	private String teamName;
	private List<UserTeam> teams;
	private SysUserVo userVo; // 用户的页面信息bean，用于存放页面信息
	private PageBean pageBean = new PageBean();

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public SysUserVo getUserVo() {
		return userVo;
	}

	public void setUserVo(SysUserVo userVo) {
		this.userVo = userVo;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public UserTeam getTeam() {
		return team;
	}

	public void setTeam(UserTeam team) {
		this.team = team;
	}

	public List<UserTeam> getTeams() {
		return teams;
	}

	public void setTeams(List<UserTeam> teams) {
		this.teams = teams;
	}

	public UserTeamService getTeamService() {
		return teamService;
	}

	public void setTeamService(UserTeamService teamService) {
		this.teamService = teamService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 
	 * 
	 * @Title: toAddUser
	 * 
	 * @Description: TODO
	 * 
	 * @param @throws IOException
	 * 
	 * @return void 返回team的json格式
	 * 
	 * @throws
	 */
	public String toAddUser() throws IOException {
		
		System.out.println("to add user ...");
		/*
		 * User user =
		 * (User)getRequest().getSession().getAttribute(Constant.CURRENT_USER);
		 * //测试数据 User u = new User(); u.setUserId("1"); user
		 * =userService.frindByUserId(u); if(null!=user){//必须获取到当前用户信息后才去执行下去
		 * //List<UserTeam> teams = this.frindAllTeam(); List<UserTeam> teams =
		 * teamService.findTeamByUser(user); List<UserTeamVo> teamVos = new
		 * ArrayList<UserTeamVo>(); for (UserTeam userTeam : teams) { UserTeamVo
		 * teamVo =new UserTeamVo(); teamVo.setTeamId(userTeam.getTeamId());
		 * teamVo.setTeamName(userTeam.getTeamName()); teamVos.add(teamVo); }
		 * JSONArray teamsJson = JSONArray.fromObject(teamVos);
		 * getResponse().setCharacterEncoding("UTF-8");
		 * getResponse().getWriter().print(teamsJson.toString()); }else{ //todo
		 * 弹出自定义exception “请先登录” System.out.println("todo exception"); }
		 * 
		 */
		return "toAddUser";
	}

	/**
	 * 生成对话框并跳转到设定的URL
	 * 
	 * @param message
	 * @param url
	 */
	public void print(String message, String url) {
		try {
			PromptUtil.print(getResponse(), message, url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String deleteUser() {

		return "";
	}

	public String login() throws Exception {
		// 先去cookie找用户
		/*
		 * Cookie[] c=getRequest().getCookies(); for (int i = 0; i < c.length;
		 * i++) { if( c[i].getName().equals("userNmae")){
		 * user.setUserName(c[i].getName()); } if(
		 * c[i].getName().equals("userPwd")){ user.setUserPwd(c[i].getName()); }
		 * }
		 */
		User u = userService.frindByUserId(user);
		String vCodeInSession = (String) getSession().getAttribute(
				"validateCode");// 画出验证码的同时验证码被存入session
		String vCodeInPageSubmit = getRequest().getParameter("validateCode");// 用户提交的验证码
System.out.println("1111111111111111111");
		if (null != vCodeInSession && vCodeInSession.equals(vCodeInPageSubmit)) {

			if (null != u) {

				// 如果用户点击了“记住我”添加用户信息到cookie中
				String isRemember = getRequest().getParameter("remember");
				if (null != isRemember && !"".equals(isRemember)) {
					Cookie cookie = new Cookie(Constant.USER_NAME_IN_COOKIE,
							user.getUserName());
					getResponse().addCookie(cookie);

					Cookie ctype = new Cookie(Constant.USER_PWD_IN_COOKIE,
							user.getUserPwd());
					getResponse().addCookie(ctype);
                    SysUserVo userVo = new SysUserVo();
                    userVo.setUserName(user.getUserName());
                    userVo.setUserId(user.getUserId());
					getSession().setAttribute(Constant.CURRENT_USER, userVo);
				}
				return "loginSuccess";
			} else {

				throw new LoginException("登陆出错，用户或密码错误");
			}

		} else {

			throw new LoginException("验证码错误");
		}

	}

	/**
	 * 查到所有的用户分组
	 * 
	 * @return
	 */
	public List<UserTeam> frindAllTeam() {

		return teamService.findAllTeam();
	}

	public UserTeam findTeam() {
		UserTeam ut = teamService.findTime(this.getTeamName());
		return ut;
	}
   
	

	/**
	 * 添加一个用户
	 * 
	 * @return
	 */
	public void addUser() {
		System.out.println("i'm here");
		JSONObject job = (JSONObject) getRequest().getAttribute("");

	}

	/**
	 * 
	 * 
	 * @Title: toListUser
	 * 
	 * @Description: TODO 查找出user的分页信息，跳转到list页面
	 * 
	 * @param @return
	 * 
	 * @return
	 * 
	 * @throws
	 */
	public String toListUser() {
		/*
		 * pageBean.setAllRow(userService.findCount(user));
		 * pageBean.setTotalPage(pageBean.countTotalPage(pageBean.getAllRow()));
		 * List<User> users = userService.findUserByPageBean(pageBean, user);
		 */
		return "listUser";
	}

	/**
	 * @throws IOException
	 * 
	 * 
	 * @Title: listUser
	 * 
	 * @Description: 查找用户
	 * 
	 * @param
	 * 
	 * @return void 用joson返回页面
	 * 
	 * @throws
	 */
	public void listUser() throws IOException {

		System.out.println("use111111111r =");

		if (null == user) { // 不带条件的全部查询

			user = new User();

		}

		pageBean.setAllRow(userService.findCount(user)); // 这里其实只用找出全部人和人数就可以，但是先不改也行以后分页会用到
		pageBean.setTotalPage(pageBean.countTotalPage(pageBean.getAllRow()));
		List<User> users = userService.findUserByPageBean(pageBean, user);
		System.out.println("user =" + users.size());

		if (users.size() == 0) {
			users = new ArrayList<User>();// 如果为空也需要添加一个，不然json会报错

		}

		/*
		 * JSONObject reslut = new JSONObject();
		 * reslut.put(Constant.EASYUI_TOTAL, pageBean.getAllRow());
		 * reslut.put(Constant.EASYUI_ROWS, users);
		 */
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		List<SysUserVo> userVos = new ArrayList<SysUserVo>();
		for (User user : users) {
			SysUserVo userVo = new SysUserVo();
			userVo = userService.changUser2Vo(user);
			userVos.add(userVo);
		}
		jsonMap.put(Constant.EASYUI_TOTAL, pageBean.getAllRow());
		jsonMap.put(Constant.EASYUI_ROWS, userVos);

		JSONObject reslut = JSONObject.fromObject(jsonMap);// 格式化result
															// 一定要是JSONObjec
															// 这地方直接用user会因为session已经关闭了还去找user关联的其他类而报错

		getResponse().setCharacterEncoding("UTF-8");
		getResponse().getWriter().print(reslut.toString());

	}

	public String loginWithSession() {
		SysUserVo userVo = (SysUserVo)getSession().getAttribute(Constant.CURRENT_USER);
		if(null!=userVo){
			return "index";
			
		}else{

			return "login";
		}
		/*SessionInfo sessionInfo = (SessionInfo) httpSession.getAttribute("sessionInfo");
		if (sessionInfo != null) {
			return "doNotNeedAuth_index";
		} else {
			return "login";*/
		
		}

}
