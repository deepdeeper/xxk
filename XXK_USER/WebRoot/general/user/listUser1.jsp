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

<script type="text/javascript">

$(function(){
console.log("111111111111111111");
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
					$('#btnsave').linkbutton('enable');
					$('#dlg').dialog('open').dialog('setTitle', '添加用户');
				
				
					}
				}]
  });
  
 

});



	var url;

	function newUser() {
		$('#dlg').dialog('open').dialog('setTitle', '添加用户');
		$('#fm').form('load','<%=basePath%>user/userInfo_toAddUser.action');
		
		url = '<%=basePath%>user/userInfo_addUser.action';
		
	}
	function editUser() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$('#dlg').dialog('open').dialog('setTitle', 'Edit User');
			$('#fm').form('load', row);
			url = 'update_user.php?id=' + row.id;
		}
	}
	function saveUser() {
		$('#fm').form('submit', {
			url : <%=basePath%>user/userInfo_addUser.action,
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.success) {
					$('#dlg').dialog('close'); // close the dialog
					$('#dg').datagrid('reload'); // reload the user data
				} else {
					$.messager.show({
						title : 'Error',
						msg : result.msg
					});
				}
			}
		});
	}
	function removeUser() {
		var row = $('#dg').datagrid('getSelected');
		if (row) {
			$.messager.confirm('Confirm',
					'Are you sure you want to remove this user?', function(r) {
						if (r) {
							$.post('remove_user.php', {
								id : row.id
							}, function(result) {
								if (result.success) {
									$('#dg').datagrid('reload'); // reload the user data
								} else {
									$.messager.show({ // show error message
										title : 'Error',
										msg : result.msg
									});
								}
							}, 'json');
						}
					});
		}
	}

</script>
<script type="text/javascript">
$.extend($.fn.validatebox.defaults.rules, { 
    //验证汉子
    CHS: {
        validator: function (value) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: "只能输入汉字"
    },
    //移下手机号码验证
    mobile: {//value值为文本框中的值
        validator: function (value) {
            var reg = /^1[3|4|5|8|9]\d{9}$/;
            return reg.test(value);
        },
        message: "输入手机号码格局不正确."
    },
    //国内邮编验证
    zipcode: {
        validator: function (value) {
            var reg = /^[1-9]\d{5}$/;
            return reg.test(value);
        },
        message: "邮编必须长短0开端的6位数字."
    },
    //用户账号验证（只能包含 _ 数字 字母） 
    account: {//param的值为[]中值
        validator: function (value, param){
            if (value.length < param[0] || value.length > param[1]) {
                $.fn.validatebox.defaults.rules.account.message = "用户名长度必须在" + param[0] + "至" + param[1] + "局限";
                return false;
            } else {
                if (!/^[\w]+$/.test(value)) {
                    $.fn.validatebox.defaults.rules.account.message = "用户名只能数字、字母、下划线构成.";
                    return false;
                } else {
                    return true;
                }
            }
        }, message: ""
    }
})

 
</script>
</head>
<body>

	<%-- 	<table id="userTbale" title="用户列表" class="easyui-datagrid"
		style="width:700px;height:250px"
		url="<%=basePath%>user/userInfo_listUser.action" toolbar="#toolbar"
		pagination="true" rownumbers="true" fitColumns="true"
		singleSelect="true">
		<thead>
			<tr>
				<th field="userName" width="50">账号</th>
				<th field="userRealName" width="50">真实姓名</th>
				<th field="teamName" width="50">小组</th>
				<th field="roleName" width="50">权限</th>
				<th field="addDate" width="50">注册时间</th>


			</tr>
		</thead>

	</table>
 --%>

	<table id="userTable">
	</table>

	<!-- 	<div id="toolbar">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
			onclick="newUser()">添加用户</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true" onclick="editUser()">编辑用户</a> <a
			href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true"
			onclick="removeUser()">删除用户r</a>
 -->
	</div>

	<div id="dlg" class="easyui-dialog"
		style="width:400px;height:400px;padding:10px 20px;top:60px;left:80px" closed="true"
		buttons="#dlg-buttons">
		<div class="ftitle">用户信息</div>
		<form id="fm" method="post" >
			<table>
				<tr>
					<div class="fitem">
						<label>用户账号:</label> <input name="user.userName"
							class="easyui-validatebox" required="true"
							missingMessage="用户名必须填写" validtype="length[6,12]"
							invalidMessage="有效长度6-12">
					</div>
				</tr>
				<tr>
					<div class="fitem">
						<label>用户真实姓名:</label> <input name="user.userRealName"
							class="easyui-validatebox" required="true" validtype="CHS"
							missingMessage="真实姓名必须填写">
					</div>
				</tr>
				<tr>
					<div class="fitem">
						<label>部门:</label> 
						<input id ="dept" name ="user.deptId" >
					</div>
					<div class="fitem">
						<label>备注:</label>
						<!-- <input name="email" class="easyui-validatebox"
					validType="email"> -->
					 <textarea name="message" style="height:60px;"></textarea>
					</div>
			</table>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="#" class="easyui-linkbutton" iconCls="icon-ok"
			onclick="saveUser()">保存</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消l</a>
	</div>


</body>
</html>