<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<base href="<%=basePath%>"/>
	<title>提示页面 - 泸州市电子政务内网用户管理平台</title>
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
	<table width="520" border="0" cellspacing="0" cellpadding="0"  align="center">
          <tr>
            <td colspan="3"><img src="images/error/P_top.gif" width="520" height="27" /></td>
          </tr>
          <tr>
            <td width="19" style="background-image:url(images/error/P_Left1.gif);"></td>
            <td width="482">
            <table width="90%" style="vertical-align:top;"><tr><td>
                 <div class="ts">
                 	<img src="images/error/P_ico2.gif" width="11" height="11" />
               		出错信息提示!
                 </div>
                <div class="hr" align="left"><hr width="300px" style="height:1px;border:0;border-bottom:1px solid #43566F;" align="left" /></div>
                <div class="info" style="color: red;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未找到你所请求的页面...</div>
                <div class="link"><a href="javascript:history.back()">&lt;&lt;&nbsp;返回上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="" href="index.jsp" target="_top">&lt;&lt;&nbsp;返回首页</a></div>                
            </td>
            <td>
            	<img src="images/error/Prongix.jpg" width="65" height="86" />
            </td></tr></table>
            </td>
            <td width="19" style="background-image:url(images/error/P_Right1.gif);"></td>
          </tr>
          <tr>
            <td colspan="3"><img style="vertical-align: top;" src="images/error/P_Bottom.gif" width="520" height="28" /></td>
          </tr>
          <tr>
            <td colspan="3"><img src="images/error/P_Shadow.gif" width="520" height="56" /></td>
          </tr>
	</table>
</body>
</html>