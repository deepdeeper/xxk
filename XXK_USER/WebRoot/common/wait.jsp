<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//这样也可以实现页面刷新
	//response.setHeader("refresh","1;URL=toIndex1.action");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>提示页面 -泸州市电子政务内网支撑平台</title>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">  
		<meta http-equiv="refresh" content="1;url=toIndex1.action"/>  
		<style type="text/css">
		body table td div{
			font-size:12px;}
			.ts
			{
				margin-top:20px;
				margin-left:20px;
				color:#CC0000;
				font-weight:bold;
				font-size:14px;
			}
			.hr{
				margin-left:15px;
				text-align:left;
			}
			.info{
				margin-left:15px;
				margin-top:10px;
			}
			.link
			{
				margin-bottom:5px;
				margin-top:30px;
				text-align:center;
			}
			a{
				text-decoration:none;
				color:#000000;}
			a:hover{
				text-decoration:underline;
				color:#000000;}
			
		</style>
</head>

<body style="text-align: center;padding: 40px 0px;"> 
	<br/>
	<br/>
	<br/>          
	<table width="520" border="0" cellspacing="0" cellpadding="0"  align="center">
          <tr>
            <td colspan="3"><img src="<%=basePath%>images/error/P_top.gif" width="520" height="27" /></td>
          </tr>
          <tr>
            <td width="19" style="background-image:url(<%=basePath%>images/error/P_Left1.gif);"></td>
            <td width="482">
            <table width="90%" style="vertical-align:top;"><tr><td>
                 <div class="ts">
                 	请稍等，服务器正在处理数据。。。。。。
                 </div>
            </td>
            <td>
            	<img src="<%=basePath%>images/error/Prongix.jpg" width="65" height="86" />
            </td></tr></table>
            </td>
            <td width="19" style="background-image:url(<%=basePath%>images/error/P_Right1.gif);"></td>
          </tr>
          <tr>
            <td colspan="3"><img src="<%=basePath%>images/error/P_Bottom.gif" width="520" height="28" /></td>
          </tr>
          <tr>
            <td colspan="3"><img src="<%=basePath%>images/error/P_Shadow.gif" width="520" height="56" /></td>
          </tr>
	</table>
</body>
</html>