<%@page contentType="text/html; charset=utf-8" %>
<%
	String path = request.getContextPath(); 
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort();
	//+ path + "/";
	if ("/".equalsIgnoreCase(path)) {
		basePath += "/";
	} else { 
		basePath += path + "/";
	}
	//if(session.getAttribute("sysUser") != null){
	//	response.sendRedirect(basePath+"jsp/frame/index.jsp");
	//}
%>
	
<html>
  <head>
  	<base href="<%=basePath%>"/>
    <title>泸州市中医院信息科</title>
    <meta http-equiv="refresh" content="1;url=<%=basePath%>login/login.jsp">
  </head>
  <body>
  </body>
</html>
