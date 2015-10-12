
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<div id="aa" class="easyui-accordion" style="width:700px;height:300px;">
		<div title="Title1" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
			<h3 style="color:#0099FF;">Accordion for jQuery</h3>
			<p>Accordion is a part of easyui framework for jQuery. It lets you define your accordion component on web page more easily.</p>
		</div>
		<div title="Title2" data-options="iconCls:'icon-search',selected:true,
				tools:[{
					iconCls:'icon-reload',
					handler:function(){
						$('#tt').datagrid('reload');
					}
				}]">
			<table id="tt" class="easyui-datagrid" 
					data-options="url:'datagrid_data2.json',border:false,fit:true,fitColumns:true,singleSelect:true">
				<thead>
					<tr>
						<th data-options="field:'itemid',width:80">Item ID</th>
						<th data-options="field:'productid',width:100">Product ID</th>
						<th data-options="field:'listprice',width:80,align:'right'">List Price</th>
						<th data-options="field:'unitcost',width:80,align:'right'">Unit Cost</th>
						<th data-options="field:'attr1',width:150">Attribute</th>
						<th data-options="field:'status',width:50,align:'center'">Status</th>
					</tr>
				</thead>
			</table>
		</div>
		<div title="Title3" style="padding:10px;">
			content3
		</div>
	</div>
</body>
</html>