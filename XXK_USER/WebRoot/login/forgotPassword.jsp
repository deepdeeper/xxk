<%@ page language="java"  pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>泸州市机要局--电子政务协同应用系统－－找回密码</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main/style-content.css"></link>
	<script type="text/javascript" src="<%=basePath%>dwr/engine.js"></script>
	<script type="text/javascript" src="<%=basePath%>dwr/util.js"></script>
	<script type="text/javascript" src="<%=basePath%>dwr/interface/sysUserDwr.js"></script>
</head>
<body>
		<div class="content" style="width: 50%;">
		<form id="actionform" name="actionform" method="post">
  			<table id="tab1" class="oldTable" border="0" cellspacing="0" cellpadding="0">
		    	<tr>
		    		<td class="oldBg" colspan="2">&nbsp;</td>
		    	</tr>
				<tr>
					<td class="tdBg">
						用户名称
					</td>
					<td>
						<input name="sysUserVo.userName" id="userName" type="text"  style="width: 200px;" onchange="getPwdQue()"/>
					</td>
				</tr>
				<tr>
					<td class="tdBg">
						密保答案
					</td>
					<td>
						<select name="findPwdQue" id="findPwdQue" style="width: 205px;" >
		         			<option value="" >请选择一个问题</option>
					        <option value="我就读的第一所学校的名称？" >我就读的第一所学校的名称？</option>
					        <option value="我最喜欢的休闲运动是什么？" >我最喜欢的休闲运动是什么？</option>
					        <option value="我最喜欢的运动员是谁？" >我最喜欢的运动员是谁？</option>
					        <option value="我最喜欢的物品的名称？" >我最喜欢的物品的名称？</option>
					        <option value="我最喜欢的歌曲？" >我最喜欢的歌曲？</option>
					        <option value="我最喜欢的食物？" >我最喜欢的食物？</option>
					        <option value="我最爱的人的名字？" >我最爱的人的名字？</option>
					        <option value="我最爱的电影？" >我最爱的电影？</option>
					        <option value="我妈妈的生日？" >我妈妈的生日？</option>
					        <option value="我的初恋日期？" >我的初恋日期？</option>
	         			</select>
					</td>
				</tr>
				<tr>
		        	<td class="tdBg">
		         		密保问题答案
		        	</td>
		         	<td  style="text-align: left">
		           		<input name="findPwdQueAnswer" id="findPwdQueAnswer" type="text"  value="${sessionScope.sysUser.findPwdQueAnswer }" style="width: 200px;" maxlength="20"/>
					</td>
		     	</tr>
				<tr>
					<td align="left" colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="" type="button" value="开始" class="btn_all"
							onclick="forgetPassord()"
							style="width: 65px; height: 21px; border: none;" />
						&nbsp;
						<input name="" type="button" value="返回"
							onclick="toLoginpage()" class="btn_all"
							style="width: 65px; height: 21px; border: none;" />
					</td>
				</tr>
			</table>
			
			<table id="tab2" class="oldTable" border="0" cellspacing="0" cellpadding="0"  style="display: none;">
				<tr>
					<td class="oldBg" colspan="2">输入新密码</td>
				</tr>
		    	<tr>
		    		<td class="tdBg">新帐户密码</td>
		      		<td>
		      			<input name="sysUserVo.userPwd" id="newUserPwd"  type="password" style="width: 200px;" />
		      			<br/>
		      			<font color="red">要求：应该是大于6位的字母、数字、特殊字符组合,如test123</font>
		      		</td>
		    	</tr>
		    	<tr>
		    		<td class="tdBg">确认新密码</td>
		      		<td>
		      			<input name="repeatPwd" id="repeatPwd" type="password"   style="width: 200px;" />
		      		</td>
		    	</tr>
		    	<tr>
					<td align="left" colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="" type="button" value="开始" class="btn_all"
							onclick="updatePassword()"
							style="width: 65px; height: 21px; border: none;" />
						&nbsp;
						<input name="" type="button" value="返回"
							onclick="toLoginpage()" class="btn_all"
							style="width: 65px; height: 21px; border: none;" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
	//增加用户
	function updatePassword(){
		var userName = G('userName').value;
		var newUserPwd = G('newUserPwd');
		var repeatPwd = G('repeatPwd');
			
		if(userName==""){
			window.location.reload(); 
			return ;
		}
		
		
		var pattern2=/^.{8,20}$/;   
		if (!pattern2.exec(newUserPwd.value)){
			 alert("输入新账户密码应该是[8-20]位字符组合!!");
			 newUserPwd.focus();
			 return ;
		}else{
			var p0 = (newUserPwd.value.search(/[A-Za-z]/)!=-1) ? 1:0;
			var p1 = (newUserPwd.value.search(/[0-9]/)!=-1) ? 1:0;
			var p2 = (newUserPwd.value.search(/[_~!@#$%^&*()-+|]/)!=-1) ? 1:0;
			var pa= p0+p1+p2;
			if(pa<2)
			{
			   alert("口令至少须包含字母、数字、特殊字符等任意二种字符组合");
			   newUserPwd.focus();
			   return;
			}
							
		}
			 
		if(newUserPwd.value != repeatPwd.value){
			alert('输入的两次密码不一致!!');
			repeatPwd.value="";
			repeatPwd.focus();
			return;
		}
		document.actionform.action="<%=basePath%>loginAction!updatePassword.action";
		document.actionform.submit();
	}
	
	function toLoginpage(){
		document.location.href="<%=basePath%>login/login.jsp"
	}
	
	function getPwdQue(){
		
	}
	
	function forgetPassord(){
		var userName = G('userName').value;
		var findPwdQueObj = G('findPwdQue');
		var findPwdQueValue = findPwdQueObj.options[findPwdQueObj.selectedIndex].value;
		var findPwdQueAnswer = G('findPwdQueAnswer').value;
		
		var pattern1=/^[\w]{3,20}$/;   
		if(!pattern1.exec(userName)){
			alert('输入的用户名称名称不合法,应该是[3-20]位的字母,数字,或下划线!!');
			G('userName').value="";
			G('userName').focus();
			return;
		}
		
		if(findPwdQueValue==""){
			alert("请选择密保问题!!");
			G('findPwdQue').focus();
			return;
		}
		
		if(findPwdQueAnswer==""){
			alert("请输入密保答案!!");
			G('findPwdQueAnswer').focus();
			return;
		}
		
		sysUserDwr.forgetPassword(userName,findPwdQueValue,findPwdQueAnswer,forgetPassordBack);
	}
	
	function forgetPassordBack(num){
		if(num==-1){
			alert("没有找到此用户，请重新输入!!");
			G('userName').value="";
			G('userName').focus();
		}else if(num==0){
			alert("你的帐号没有设置密保，你只有联系管理员!!");
		}else if(num==1){
			alert("你的密保问题有错，请重新选择!!");
			G('findPwdQue').options[0].selected="selected";
			G('findPwdQue').focus();
		}else if(num==2){
			alert("你的密保答案有错，请重新输入!!");
			G('findPwdQueAnswer').value="";
			G('findPwdQueAnswer').focus();
		}else if(num==3){
			G('tab1').style.display="none";
			G('tab2').style.display="block";
		}
	}
	
	//通用方法
	function G(a){
		return document.getElementById(a);
	}
</script>