<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>信息提示</title>
		<base href="<%=basePath %>">
		<STYLE type="text/css">
			a						{ text-decoration: none; color: #002280 }
			a:hover					{ text-decoration: underline }
			body					{ font-size: 9pt; }
			table					{ font: 9pt Tahoma, Verdana; color: #000000 }
			.header					{ font: 9pt Tahoma, Verdana; color: #FFFFFF; font-weight: bold; background-color: #8AD0FE; }
			.header a				{ color: #FFFFFF }
			.tableborder			{ border: 1px solid #8AD0FE; width:400px;} 
		</STYLE>
	</head>
	<body>
		<table  border="0" align="center" cellpadding="3" cellspacing="1" class="tableborder">
			<tr class="header">
				<td height="25">
					<div align="center">
						信息提示<div id="prompt"></div>
					</div>
				</td>
			</tr>
			<tr bgcolor="#FFFFFF">
				<td style="min-height: 80px;">
					<div align="left" style="width: 400px;">
						<b>
							<%
								try {
									String temp = URLDecoder.decode(request.getParameter("showMessage"),"utf-8");
									out.print(temp);
								}catch(Exception e){}
							%>
						</b>
						<br />
						<br />
						<br/>
						<span id="auto"></span>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<SCRIPT language=javascript> 
	var type = Number("<s:property value='#parameters.type'/>");
	var secs=  Number("<s:property value='#parameters.time'/>");
	var gg = "<s:property value="#parameters.source"/>";
	if(type==0){
		var P = window.parent,D = P.loadinndlg();
		function closeWin(){
			if(gg==""){
				D.document.location.reload();
			}else{
				D.document.location.href="<%=basePath %>"+gg;
			}
			P.cancel();
		}
		if(secs!=-1){
			var prompt = document.getElementById('prompt');
			if(secs<1){
				secs = 1;
			}
			prompt.innerHTML=" (<font color='red'>"+secs+"自动关闭!</font>)";
			for(i=1;i<=secs;i++) { 
				window.setTimeout("update2(" + i + ")", i * 1000); 
			}
		
			function update2(num){
				if(secs-num>0){
					prompt.innerHTML=" (<font color='red'>"+(secs-num)+"自动返回!</font>)";
				} 
				if(num == secs){ 
					closeWin();
				}	 
			}		
		}else{
			document.getElementById('auto').innerHTML="<a href='javascript:void(0);' onclick='closeWin()'>如果您的浏览器没有自动跳转，请点击这里</a>";
		}
	}else{
		if(secs!=-1){
			var prompt = document.getElementById('prompt');
			if(secs<1){
				secs = 1;
			}
			prompt.innerHTML=" (<font color='red'>"+secs+"自动关闭!</font>)";
			for(i=1;i<=secs;i++) { 
				window.setTimeout("update(" + i + ")", i * 1000); 
			}
		
			function update(num){
				if(secs-num>0){
					prompt.innerHTML=" (<font color='red'>"+(secs-num)+"自动返回!</font>)";
				} 
				if(num == secs){ 
					if(gg==""){
						window.top.indexFrame.mainFrame.location.reload();
					}else{
						window.location.href="<%=basePath %>"+gg;
					}
				}	 
			}		
		}else{
			document.getElementById('auto').innerHTML="<a href='<%=basePath %><s:property value="#parameters.source"/>' onclick='closeWin()'>如果您的浏览器没有自动跳转，请点击这里</a>";
		}
	}
</SCRIPT>