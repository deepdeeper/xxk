<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String skinStr = "silver";
	if (skinStr != null)
		skinStr = "skins/" + skinStr + "/"; //basePath +  constant relative skin path + skinName
	pageContext.setAttribute("skin", skinStr);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>泸州市中医医院</title>
<link rel="stylesheet" type="text/css" href="css/main/style-content.css"></link>
<script type="text/javascript" src="dwr/engine.js">
	
</script>
<script type="text/javascript" src="dwr/util.js">
	
</script>

<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js"
	defer="defer">
	
</script>
<script type="text/javascript" src="<%=basePath%>js/jquery.js">
	
</script>
<script type="text/javascript"
	src="<%=basePath%>js/lhgdialog/lhgdialog.js">
	
</script>
<script type="text/javascript" src="<%=basePath%>js/updateSoft.js">
	
</script>

</head>

<body>

	

	<div class="position">当前位置：人员管理 &gt;&gt; 添加人员</div>
	<div class="content">

		<form action="user/userInfo_addUser.action" onsubmit="return send();" method="post"
			name="actionform">


			<div class="btnBox">


				<input class="btnAll" name="" type="submit" value="新增" />


			</div>


			<table cellspacing="0" cellpadding="0" class="borderTable2"
				style="width: 512px;">


				<%
					Timestamp t = new Timestamp(new java.util.Date().getTime());
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String tt = format.format(t);
					String initDate = (String) request.getParameter("date");
					if (null != initDate) {
						tt = initDate;
					}
				%>
				<tr style="width: 512px;">
					<td class="tdBg2" width="30%">账号</td>


					<td width="70%"><input type="text" name="user.userName"
						id="userName" class="shortInput"
						value="<s:property value="user.userName"/>" />
					</td>


				</tr>

				<tr>
					<td class="tdBg2">真实姓名</td>

					<td><input type="text" name="user.userRealName" id="realName"
						class="shortInput" value="<s:property value="user.userRealName"/>" />

					</td>
				</tr>
				<tr>
					<td class="tdBg2">密码</td>

					<td><input type="text" name="user.userPwd" id="pwd"
						class="shortInput" value="<s:property value="user.userPwd"/>" />

					</td>
				</tr>
				<tr>
					<td class="tdBg2">分组</td>
					<td><s:select list="#request.teams" name="teamName" headerKey=""
							headerValue="--请选择--"  id="teamName" theme="simple"  listKey="teamName" listValue="teamName"
							value="teamName">
						</s:select></td>
				</tr>

				<tr>
					<td class="tdBg2">备注</td>

					<td><input type="text" name="user.remark" id="remark"
						class="area" value="<s:property value="user.remark"/>" />
					</td>
				</tr>



				<tr>
					<td colspan="2"></td>
				</tr>
			</table>
		</form>








	</div>
</body>
</html>
<script type="text/javascript">
	function showTypeBack(t) {
		$("#showType").find(":radio").attr("checked", "");
		if (t == true) {
			G('showType').style.display = "block";
			v = true;
		} else {
			G('showType').style.display = "none";
			v = false;
		}
	}

	function hide(id) {

		document.getElementById(id).style.display = "none";

	}
	
	function send(){
	var userName = document.getElementById("userName").value;
	var realName = document.getElementById("realName").value;
	var teamName = document.getElementById("teamName").value;

    
	if(""!=userName){
	  return true;
	}else{ alert("账号不能为空");  return false;  document.getElementById("userName").focus();}
	if(""!=realName){
	  return true;
	}else{ alert("用户姓名不能为空");return false;document.getElementById("realName").focus();}
	if("--请选择--"!=teamName){
	  return true;
	}else{ alert("用户组不能为空");return false;document.getElementById("teamName").focus();}
	
	}

	
</script>