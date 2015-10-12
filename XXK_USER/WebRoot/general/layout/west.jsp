<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style>
<!--
body {
	visibility: hidden;
	font-family: helvetica, tahoma, verdana, sans-serif;
	padding: 10px;
	font-size: 13px;
	margin: 0;
}

*{margin:0;padding:0;border:0;}
#nav {
 line-height: 27px;  list-style-type: none;text-align:left;
 left: -999em; width: 180px; position: absolute; margin-top: 5px;
}
#nav  li{
 float: left; width: 180px; margin-top: 5px;
}
#nav  a{
 display: block;width: 156px;text-align:left;padding-left:24px;
}
#nav  a:link  {
 	text-decoration:none;
}
#nav  a:visited  {
 	text-decoration:none;
}
#nav a:hover  {
 text-decoration:none;font-weight:normal;

}
#nav {
 left: auto;
}
#nav {
 left: auto;
}
#content {
 clear: left; 
}
-->
</style>
<script type="text/javascript" charset="utf-8">
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
<div class="easyui-accordion" data-options="fit:true,border:false">
  <!--    <a href="javascript:addTab('用户管理','general/user/listUser.jsp')" >测试用户管理</a>
 --> <input type="button" onclick="addTab('用户管理','/general/user/listUser.jsp')" value="1111111111111"> 
        
	<c:forEach var="item" items="${sessionInfo.menus}">
		<c:if test="${item.pid==null}">
			<div title="${item.cname}" data-options="iconCls:'${item.ciconcls}'">
				<ul id="nav">
		    	<c:forEach var="sitem" items="${sessionInfo.menus}">
					<c:if test="${item.cid==sitem.pid}">
						<li><a class="easyui-linkbutton" data-options="iconCls:'${sitem.ciconcls}'" plain="true" href="javascript:void(0);"  onclick="addTab('${sitem.cname}','${sitem.curl}','${sitem.ciconcls}')">${sitem.cname}</a></li>
					</c:if>
				</c:forEach>
				</ul>
			</div>
	    </c:if>
    </c:forEach>
</div>