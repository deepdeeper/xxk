<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort();
	if ("/".equalsIgnoreCase(path)) {
		basePath += "/";
	} else {
		basePath += path + "/";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>泸州市电子政务内网用户管理平台------系统初始化页面</title>
		<link rel="stylesheet" href="css/style_main.css" type="text/css" />
		<script type="text/javascript" src="dwr/engine.js"></script>
		<script type="text/javascript" src="dwr/util.js"></script>
		<script type="text/javascript" src="dwr/interface/sysUserDwr.js"></script>
	</head>
	<body onload="init()">
		<div class="man_zone" id="man_zone"  style="display: none">
			<s:form id="form1" name="actionform" method="post" theme="simple">
				<table width="99%" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr>
						<td class="tit_list">
							系统初始化页面
						</td>
					</tr>
				</table>
				<div class="hei_per"></div>
				<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1">
					<tr>
						<td class="tit_list2" colspan="2">输入超级管理员基本信息</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_2">
							用户名称
						</td>
						<td width="82%">
							<input name="sysUserVo.userName" id="userName" type="text"  style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_1">
							用户密码
						</td>
						<td width="82%">
							<input name="sysUserVo.userPwd" id="userPwd" type="password"  value="" style="width: 200px;" />
						</td>
					</tr>
						<tr>
						<td width="18%" class="left_title_2">
							确认密码
						</td>
						<td width="82%">
							<input id="repPwd" type="password"  value="" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_1">
							用户姓名
						</td>
						<td width="82%">
							<input name="sysUserVo.realName" id="realName" type="text" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_2">
							办公电话
						</td>
						<td width="82%">
							<input name="sysUserVo.officeNum" id="officeNum" type="text" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_1">
							个人手机
						</td>
						<td width="82%">
							<input name="sysUserVo.phoneNum" id="phoneNum" type="text"  style="width: 200px;"/>
						</td>
					</tr>
					<tr>
						<td width="18%" class="left_title_2">
							电子邮箱
						</td>
						<td width="82%">
							<input name="sysUserVo.email" id="email" type="text" style="width: 200px;" />
						</td>
					</tr>
					<tr>
						<td class="left_title_1">
							用户备注
						</td>
						<td>
							<textarea name="sysUserVo.remark" id="remark"
								style="width: 400px; height:100px;font-size: 12px;"></textarea>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2">
							<input name="" type="button" value="开始" class="btn_all"
								onclick="initSystem()"
								style="width: 65px; height: 21px; border: none;" />
							&nbsp;
							<input name="" type="button" value="登录"
								onclick="toLoginPage()" class="btn_all"
								style="width: 65px; height: 21px; border: none;" />
						</td>
					</tr>
				</table>
			</s:form>
		</div>
	</body>
</html>
<script type="text/javascript">
	//验证新增用户表单数据
	function validateSysUserData(){
		var userName = G('userName').value;
		var userPwd = G('userPwd').value;
		var repPwd = G('repPwd').value;
		var realName = G('realName').value;
		
		var officeNum = G('officeNum').value;
		var phoneNum = G('phoneNum').value;
		var email = G('email').value;
		var remark = G('remark').value;
		
		var validate = true;
		
		
		var pattern1=/^[\w]{3,20}$/;   
		if(!pattern1.exec(userName)){
			alert('输入的用户名称名称不合法,应该是[3-20]位的字母,数字,或下划线!!');
			validate = false;
		}
		
		
		var pattern3=/^[\w]{6,20}$/;   
		if(!pattern3.exec(userPwd)){
			alert('输入的密码不合法,应该是[6-20]位的字母,数字,或下划线!!');
			validate = false;
		}else if(repPwd!=userPwd){
			G('userPwd').value="";
			G('repPwd').value="";
			alert('输入密码不一致!!');
			validate = false;
		}
		
		var pattern2=/^[\u4E00-\u9FA5]{2,10}$/;   
		if(!pattern2.exec(realName)){
			alert('输入的用户真实姓名不合法!!');
			validate = false;
		}
		
		
		var pattern4=/^[\d]{3,4}[-－][\d]{7,8}$/;   
		if(officeNum!="") {
			if(!pattern4.exec(officeNum)){
				alert('输入的办公室电话不合法，例:028-82772857');
				validate = false;
			}
		}
		
		var pattern5=/^[\d]{11}$/;   
		if(phoneNum!="") {
			if(!pattern5.exec(phoneNum)){
				alert('输入的联系手机不合法，例:15888888888');
				validate = false;
			}
		}
		
		var pattern6 = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		if(email!="") {
			if(!pattern6.exec(email)) {
				alert("输入的电子邮箱非法！！！");
			}
		}
		
		if(remark.length>=250){
			alert('输入的帐户描述过长!');	
			validate = false;	
		}
		
		return validate;	
	}
	
	//增加用户
	function initSystem(){
		if(validateSysUserData()){
			document.actionform.action="<%=basePath%>jsp/loginAction!initSystem.action";
			document.actionform.submit();
		}
	}
	
	function init(){
		sysUserDwr.getUserCount(initBack);
	}
	
	function initBack(num){
		if(num==0){
			G('man_zone').style.display='block';
		}else{
			document.location.href="<%=basePath%>login/login.jsp";
		}
	}
	
	function toLoginPage(){
		document.location.href="<%=basePath%>login/login.jsp";
	}
	
	//通用方法
	function G(a){
		return document.getElementById(a);
	}
</script>