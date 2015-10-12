
 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>  


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="http://www.w3cschool.cc/try/jeasyui/demo/demo.css">
	
	<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
function addTab(title, href){  
    var tt = $('#main-center');  
    if (tt.tabs('exists', title)){  
    tt.tabs('select', title);  
    } else {  
    if (href){  
    var content = '<iframe scrolling="no" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';  
    } else {  
    var content = '未实现';  
    }  
    tt.tabs('add',{  
    title:title,  
    closable:true,  
    content:content  
    });  
    }  
}  

</script>	

</head>
<body class="easyui-layout">  
<div region="north" style="background:#fafafa;color:#2d5593;height:40px;">  
    <div style="font-size:16px;font-weight:bold;width:400px;padding:10px 0 0 10px;">信息科管理系统</div>  
</div>  
<div region="west" title="导航菜单" split="true" style="width:150px;">  
    <div class="easyui-accordion" fit="true" border="false">  
        <div title="业务操作" selected="true" style="overflow:auto;">  
            <div class="nav-item">  
                <a href="javascript:addTab('用户管理','listUser.jsp')"  class="easyui-linkbutton"  plain="true">  
                      <img src="<%=basePath%>images/userPicImages/addUser.png" width="60px" height="60px" ></img><br/> 
                    <span>用户管理</span>  
                </a>  
            </div>  
        </div>  
        <div title="数据设置" style="overflow:auto;">  
            <div class="nav-item">  
                <a href="javascript:addTab('区域设置')">  
                    <img src="images/package.png"></img><br/>  
                    <span>区域设置</span>  
                </a>  
            </div>  
            <div class="nav-item">  
                <a href="javascript:addTab('设备类别')">  
                    <img src="images/kontact.png"></img><br/>  
                    <span>设备类别</span>  
                </a>  
            </div>  
        </div>  
    </div>  
</div>  
<div region="center">  
    <div id="main-center" class="easyui-tabs" fit="true" border="false">  
        <div title="首页" style="padding:20px;">  
          
        </div>  
    </div>  
</div>  
  </body>  
</html>