<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	System.out.println(basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>提示页面 - 泸州市电子政务内网支撑平台</title>
		<script type="text/javascript">
			function turningToLoginPage(){
				window.parent.parent.location.href="<%=basePath%>login/login.jsp";
			}
		</script>
	</head>
	<body onload="turningToLoginPage()">
	</body>
</html>