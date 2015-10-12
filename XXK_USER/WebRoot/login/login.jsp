<%@page contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	if (session.getAttribute("sysUser") != null) {
		response.sendRedirect(basePath + "jsp/frame/index.jsp");
	} else {
		Cookie[] cks = request.getCookies();
		if (cks != null) {
			for (Cookie c : cks) {
				if ("egssUsername".equalsIgnoreCase(c.getName())) {
					for (Cookie c2 : cks) {
						if ("egssPwd".equalsIgnoreCase(c2.getName())) {
							response
									.sendRedirect(basePath
											+ "loginAction!loginByCookie.action?username="
											+ c.getValue()
											+ "&password="
											+ c2.getValue());
							break;
						}
					}
				}
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<base href="<%=basePath%>" />
<title>泸州市中医医院院  信息科</title>

<link rel="stylesheet" href="./bootstrap/css/bootstrap.css"
	type="text/css"></link>
<link rel="stylesheet" href="./bootstrap/css/bootstrap-responsive.css"
	type="text/css"></link>
<link rel="stylesheet" href="./css/style.css" type="text/css"></link>
<link rel="stylesheet" href="./css/login.css" type="text/css"></link>

<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/view_js/Login.js"></script>
<script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script>
</head>
<script>
	$(function() {

		var winhei = $(document).height();

		$("body").css("height", winhei);
		var bgdiv = (winhei - 555) / 2;
		$(".login_bgdiv").css("padding-top", bgdiv);
	})
</script>
<body onload="init()">

	<div class="login_bgdiv">
		<div class="login_Logo">
			<img src="./images/login/ZYY_Logo.png" style="height:80px;" />
		</div>
		<div class="hei20"></div>
		<div class="login_bg">
			<div class="login_context">
				<div class="login_con">
					<div style="text-align:center">
						<div class="hei20"></div>
						<img src="./images/login/Yy_icon.png" style="width:60px;" />&nbsp;&nbsp;&nbsp;&nbsp;<span
							class="login_text" style="line-height:50px">登录</span>&nbsp;&nbsp;<span
							style="font-size:20px;">Login</span>
					</div>
					<div class="hei30"></div>
					<form action="user/userInfo_login.action" id="login" method="post"
						onsubmit="return validate()">


						<table class="login_tb" cellpadding="0" cellspacing="0">
							<tr>
								<td>用户名：</td>
								<td><input name="user.userName" id="username"
									type="text" maxlength="20" /></td>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp; <!--[if IE 6]>&nbsp;&nbsp;<![endif]--> <!--[if IE 7]>&nbsp;&nbsp;<![endif]-->
									<!--[if IE 8]>&nbsp;&nbsp;<![endif]--> 码：</td>
								<td><input name="user.userPwd" id="password"
									type="password" maxlength="20" /></td>
							</tr>
							<tr>
								<td>验证码：</td>
								<td><input name="validateCode" id="validateCode"
									type="text" style="width: 46px;" maxlength="4"
									onkeyup="this.value=this.value.replace(/\D/g,'')"
									onafterpaste="this.value=this.value.replace(/\D/g,'')" /> <img
									src="login/loginImage.jsp" id="validateCodeImg" class="mini"
									width="78" height="21" style="vertical-align: middle" /></td>
							</tr>

							<tr>
								<td><input type="checkbox" name="remember" value="1"
									checked="checked" /> <font color="#000" size="2">记住密码</font></td>
								<td></td>
							</tr>
							<tr style="height:45px;">
								<td colspan="2"><input name=""
									class="btn btn-primary btn-block" type="button"
									onclick="validate()" value="登 录" /></td>
							</tr>
							<tr style="height:45px;">
								<td colspan="2"><input name=""
									class="btn btn-danger btn-block" type="button"
									onclick="refreash()" value="重 置" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="login_con_bg"></div>
			</div>
			<img class="bg" src="./images/login/login_bg.png " />
		</div>


		<!-- 
		<table border="0" cellpadding="0" cellspacing="0" style="text-align: center; width: 100%;">
			<tr>
				<td>
					<a href="javascript:init2('admin1','xcp12300')">超级管理员</a>&nbsp;&nbsp;
					<a href="javascript:init2('510502','test123')">区说管理员</a>&nbsp;&nbsp;
					<a href="javascript:init2('lzswjyj','test123')">单位管理员</a>&nbsp;&nbsp;
					<a href="javascript:init2('lzswjyj-zhk','test123')">部门管理员</a>&nbsp;&nbsp;
					<a href="javascript:init2('xianyf','test123')">个人用户</a>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		 -->

	</div>
</body>


</html>