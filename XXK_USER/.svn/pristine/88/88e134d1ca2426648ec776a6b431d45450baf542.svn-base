<%@page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort();
	//+ path + "/";
	if ("/".equalsIgnoreCase(path)) {
		basePath += "/";
	} else {
		basePath += path + "/";
	}
%>
<html>
	<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>提示页面 - 泸州市电子政务内网用户管理平台ϵͳ</title>
	</head>
		 <%
		 	Cookie cookie = new Cookie("egssUserName", null);
			cookie.setMaxAge(0);
			cookie.setPath("/");
			response.addCookie(cookie); 
			
			Cookie ctype = new Cookie("egssPwd",null);
			ctype.setPath("/");
			ctype.setMaxAge(0);
			response.addCookie(ctype);
		  %>
		 <s:if test="#session['sysUser'] != null">
		 	<%
		 		session.removeAttribute("sysUser");
				session.invalidate();  
		 	 %>
		 </s:if>
		  <script type="text/javascript">
				window.top.location.href="<%=basePath%>login/login.jsp";
		 </script>
	<body>
	</body>
</html>