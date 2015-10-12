<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'opinionlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main/style-list.css"></link>
	<script type="text/javascript" src="<%=basePath%>js/date/WdatePicker.js" defer="defer"></script>
	<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/lhgdialog/lhgdialog.js"></script>
	
	
	
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form  action="<%=basePath%>yjjy/airReport_toList.action?pageBean.currentPage=1" method="post" name="weiboForm">
    <s:hidden id="currentPage" name="pageBean.currentPage"></s:hidden>
  <div style="text-align:left;"> 
				天气日报状态${type}：<label><s:select name="airQualityReport.state" list="#{'等待审核':'等待审核','已发布':'已发布'}" headerValue="全部" headerKey="">
				                      
				                 </s:select></label>
				日期：<label>
				<s:textfield name="airQualityReport.addDate" id="post_date" cssClass="searchBg" cssStyle="width:70px;" onfocus="WdatePicker({isShowClear:false,dateFmt:'yyyy-MM-dd',lang:'auto',skin:'whyGreen'})"></s:textfield>
				</label> 
				检测地点：<label>
				<s:select list="#request.loactions" name="airQualityReport.location"
								headerKey="" headerValue="----请选择----" id="location" theme="simple" value="airQualityReport.location">
							</s:select>
				   
				</label>
	            <label>
					<input class="btnAll"  type="submit" value="搜索" />
					<input class="btnAll"  type="reset" value="清空"  />
				</label>	
			</div>
         <div class="btnBg2">
					<label><input name="" value="删 除"  type="button" class="btnAll2"  onclick="del()"/></label>
					<label><input name="" value="增加"  type="button" class="btnAll2"  onclick="toAdd()"/></label>
					<label><input name="" value="查看今天"  type="button" class="btnAll2"  onclick="showToday()"/></label>
				</div>
				<table class="borderTable" border="0" cellpadding="0" cellspacing="0" >
					<tr class="theadBg">
						<td  style="width:1%;">
							<input id="all" type="checkbox" onclick="SelectAll()" style="cursor: pointer;"/>
						</td>
						<td  style="width:12%;">
							检测地点
						</td>
						
						 
						<td style="width:12%;">
							空气质量指数
						</td>
						
						<td style="width:12%;">
							首要污染物
						</td>
						
						<td style="width:12%;">
							空气质量状况
						</td>
						<td style="width:12%;">
								空气质量级别
						</td>
						<td style="width:12%;">
								创建日期
						</td>
						
						<td style="width:12%;">
							操  作
						</td>
						<s:if test="#request.reports.size()<1">
						  
						 <tr><td colspan="8" align="center"><font color="red">今天还没有添加数据</font> </td></tr>
						</s:if>
						</tr>
							<s:iterator  value="#request.reports" status="l" id="g">
							   <tr>
							        <td><input id="${g.id}" value="${g.id}" type="checkbox" name="checkbox1" style="cursor: pointer;"/></td>
							   		<td>${g.location}</td>
							   		
							   		
							   		
							   		<td>${g.qualityIndex}</td>
							   	 
							   		
							   		<td>${g.primaryPollutant}</td>
							   		<td>${g.qualityStatus}</td>
							   		<td>${g.airQulityLevel}</td>
							   		<td><s:date name="addDate" format="yyyy-MM-dd"/></td>
							   		
							   		<td>
							   		 <s:if test="#g.state.equals('等待审核')">
							   		  
							   		   <input type="button" onclick="publish('${g.id}')" class="btnTxt" value="发布" />
							   		</s:if>
							   		
							   	        
							   		 <s:if test="#g.state.equals('已发布')">
								<input type="button" onclick="cancelPublish('${g.id}')" class="btnTxt" value="取消发布" />
								</s:if>
									 <input type="button" onclick="toUpdate('${g.id}')" class="btnTxt" value="修改" />
							   		 </td>
							   		
							   </tr>
							</s:iterator>
						</table>
						<s:if test="#request.reports.size>14">
						 	<div class="pageDiv">
					<label class="pageContent">
		               	共<b><s:property value="pageBean.allRow" /></b>条记录 | 
		               	分<b><s:property value="pageBean.totalPage" /></b>页 | 
		               	每页<b><s:property value="pageBean.pageSize" /></b>条 | 
		               	当前第<b><s:property value="pageBean.currentPage" /></b>页
		               	<s:hidden id="pageCounct" name="pageBean.totalPage"></s:hidden>
		            
	               </label>
	              
	               <s:textfield id="jumpTo" name="pageBean.currentPage"
							theme="simple"
							cssStyle="width: 22px; height: 14px; font-size: 12px;text-align:center;"
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onkeydown="if(event.keyCode==13){SeparatePage('jumpTo');}" >
				 	</s:textfield>
	                <label><input type="button" onclick="SeparatePage('jumpTo')" value="跳转" class="pageBtn" /></label>
	                <label><input type="button" onclick="SeparatePage('first')" value="首页" class="pageBtn" /></label>
	                <label><input type="button" onclick="SeparatePage('previous')" value="上一页" class="pageBtn" /></label>
	                <label><input type="button" onclick="SeparatePage('next')" value="下一页" class="pageBtn" /></label>
	                <label><input type="button" onclick="SeparatePage('last')" value="尾页" class="pageBtn" /></label>
				</div>
		     </s:if>
		</form>
		<script type="text/javascript">
		
		
		function yjhf(infoId){
		  if(infoId!=''){
			var dlg = new $.dialog({
				id:'audioFaillQustion',
				title:'回复内容',
				page:'<%=basePath%>jsp/opinion/auditFailReason.jsp?infoId='+infoId,
				width:550,
				height:330,
				rang:true,
				cover:true
			}).ShowDialog();
		}
	}
	
		 //全选
	function SelectAll()
	{
	   var all = document.getElementById('all');
		var b = document.getElementsByName("checkbox1");
	   	if(all.checked){
	   		for(i=0;i<b.length;i++){
	   			b[i].checked=true;
	   		}
	   	}else{
	   		for(i=0;i<b.length;i++){
	   			b[i].checked=false;
	   		}
	   	} 
	}
	//反选
	function TurnOver()
	{
	  
	  var b = document.getElementsByName("checkbox1");
	  for(i=0;i<b.length;i++){
	   		b[i].checked = !b[i].checked;
	   }
	}
	
	
		//分类组件实现
	function SeparatePage(o){
	    
		var currentPage = document.getElementById("currentPage").value;
		
		var pageCount = document.getElementById("pageCounct").value;

		var iPage = Number(currentPage);
		
		var mPage = Number(pageCount);
		if(o == 'next'){
			iPage++;
		}
		if(o =='previous'){
			iPage--;
		}
		if(o == 'first'){
		    iPage = 1;
		} 
		if(o == 'last'){
		    iPage = Number(pageCount);
		}
		if(o == 'jumpTo'){
			if(isNaN(document.getElementById("jumpTo").value) ||
			   !(document.getElementById("jumpTo").value.match(/^\d+$/)) || 
			   document.getElementById("jumpTo").value==0)
			{ 
			    iPage = 1;
			}else{
			     iPage=document.getElementById("jumpTo").value;
				 if(iPage>mPage){
				 	iPage=Number(pageCount);
				 }
			}
       }
	   if(iPage > mPage){	
		    iPage = Number(pageCount);
	   }
	   if(iPage < 1){
		      iPage = 1;
	   }
	   document.getElementById("currentPage").value = iPage;
	  
	   document.getElementById("jumpTo").value = iPage;
     
	   document.weiboForm.action="<%=basePath%>yjjy/airReport_toList.action";
	   document.weiboForm.submit();
	}
	
	
	function del(){
	     if(confirm("确实要删除吗?")){
			var b = document.getElementsByName("checkbox1");
			var statValue='';
			var coutstat=0;
			for(i=0;i<b.length;i++){
			  if(b[i].checked==true){
			     if(coutstat==0){
			        statValue+=b[i].value;
			     }else{
			       statValue+=','+b[i].value;
			     }			 		   
			     coutstat++
			   }
			}
	    if(coutstat==0){
				alert("请选择要删除的项");
				return false;
			}
	    window.location.href="<%=basePath%>yjjy/airReport_del.action?id="+statValue;
			}
	}
	function publish(id){
		if(confirm("确认发布吗？")){
			document.weiboForm.action="<%=basePath%>yjjy/airReport_update.action?method=publish&id="+id;
			document.weiboForm.submit(); 
		}
	}
	
	function toUpdate(id){
		document.weiboForm.action="<%=basePath%>yjjy/airReport_toUpdate.action?id="+id; 
		document.weiboForm.submit(); 
	}
	
	function cancelPublish(id){
			if(confirm("确认取消发布吗？")){
		
			document.weiboForm.action="<%=basePath%>yjjy/airReport_update.action?method=cancelPublish&id="+id;
			document.weiboForm.submit(); 
		}
	}
	function toAdd(){
		window.location.href="<%=basePath%>yjjy/airReport_toAdd.action";
	}
	function showToday(){
			window.location.href="<%=basePath%>yjjy/airReport_findTodayReport.action";
	}
	
		</script>		
  </body>
</html>
