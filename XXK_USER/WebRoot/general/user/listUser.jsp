<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息科</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jquery-easyui-1.4.3/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="http://www.w3cschool.cc/try/jeasyui/demo/demo.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
#fm {
	margin: 0;
	padding: 10px 30px;
}

.ftitle {
	font-size: 14px;
	font-weight: bold;
	color: #666;
	padding: 5px 0;
	margin-bottom: 10px;
	border-bottom: 1px solid #ccc;
}

.fitem {
	margin-bottom: 5px;
}

.fitem label {
	display: inline-block;
	width: 80px;
}
</style>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>



<title>Insert title here</title>
</head>
<body>
<table id="userTable">
	</table>

</body>
<script type="text/javascript">
$(function(){
$('#userTable').datagrid({

     rownumbers:true,
     pagination:true,
      url:'<%=basePath%>user/userInfo_listUser.action',
      columns:[[
        {field:'userName',title:'用户姓名',width:100},
        {field:'userRealName',title:'真实姓名',width:100},
        {field:'teamName',title:'小组',width:100,align:'right'},
        {field:'addDate',title:'注册时间',width:100,align:'right'},
        {field:'raloName',title:'权限',width:100,align:'right'}     
    ]] ,
   toolbar:[{  //顶部的按钮
					id:'btnadd',
					text:'添加用户',
					iconCls:'icon-add',
					handler:function(){
				/* 	$('#btnsave').linkbutton('enable');
					$('#dlg').dialog('open').dialog('setTitle', '添加用户'); */
				append();
				
					}
				}]
  });
  
 

});
//添加用户
function append() {
		var p = parent.dj.dialog({
			title : '添加用户',
			href : '<%=basePath%>user/userInfo_toAddUser.action',  //跳转页面
			width : 440,
			height : 200,
			sortName : 'userName',
			sortOrder : 'desc',
			buttons : [ {
				text : '添加',
				handler : function() {
					var f = p.find('form');
					f.form('submit', {
						url : '${pageContext.request.contextPath}/user!add.do',   //提交表单的action指向
						success : function(d) {
							var json = $.parseJSON(d);
							if (json.success) {
								datagrid.datagrid('reload');
								p.dialog('close');
							}
							parent.dj.messagerShow({
								msg : json.msg,
								title : '提示'
							});
						}
					});
				}
			} ],
			onLoad : function() {  //加载前的操作
				var f = p.find('form');
				var roleIds = f.find('input[name=roleIds]');
				var roleIdsCombobox = roleIds.combobox({
					url : '${pageContext.request.contextPath}/role!doNotNeedSession_combobox.do', //加载角色
					valueField : 'cid',
					textField : 'cname',
					multiple : true,
					editable : false,
					panelHeight : 'auto'
				});
				var deptId = f.find('input[name=deptId]');
				var deptIdComboboxTree = deptId.combotree({
					url : '${pageContext.request.contextPath}/dept!doNotNeedSession_treeRecursive.do', //加载部门
					multiple : false,
					editable : false,
					panelHeight : 'auto'
				});
			}
		});
	}


</script>
</html>