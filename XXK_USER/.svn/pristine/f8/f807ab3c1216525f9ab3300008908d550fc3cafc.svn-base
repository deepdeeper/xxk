// 选项卡切换
function show_list(str1, str2)
{
	document.getElementById("tab0").className = "out_li";
	document.getElementById("info0").style.display = "none";
	document.getElementById("tab1").className = "out_li";
	document.getElementById("info1").style.display = "none";
	document.getElementById("tab2").className = "out_li";
	document.getElementById("info2").style.display = "none";
	document.getElementById("tab3").className = "out_li";
	document.getElementById("info3").style.display = "none";
	document.getElementById("tab4").className = "out_li";
	document.getElementById("info4").style.display = "none";
	
	document.getElementById(str1).className = "over_li";
	document.getElementById(str2).style.display = "block";
}


//表格颜色切换
var highlightcolor='#d5f4fe';
var clickcolor='#51b2f6';
function  changeto(){
	source=event.srcElement;
	if  (source.tagName=="TR"||source.tagName=="TABLE")
		return;
	while(source.tagName!="TD")
		source=source.parentElement;
	source=source.parentElement;
	cs  =  source.children;
	if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
	for(i=0;i<cs.length;i++){
		cs[i].style.backgroundColor=highlightcolor;
	}
}
function  changeback(){
	if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
		return
	if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
		for(i=0;i<cs.length;i++){
			cs[i].style.backgroundColor="";
		}
}


// 国家省市切换
function area(radio,tb0,tb1, tb2,tb3)
{
	document.getElementById(radio).checked="checked";
	document.getElementById(tb0).style.display = "";
	document.getElementById(tb1).style.display = "none";
	document.getElementById(tb2).style.display = "none";
	document.getElementById(tb3).style.display = "none";
}

// 报表切换
function reform(radio,tr0,tr1)
{
	document.getElementById(radio).checked="checked";
	document.getElementById(tr0).style.display = "";
	document.getElementById(tr1).style.display = "none";
}

//打开关闭相关需求
function dislist(idstr){
	var name="tb"+idstr;
	var objectobj=document.all(name);	
	var picname="pic"+idstr;
	var objectpic=document.all(picname);
	var pic="../images/button";
		
	if(objectobj.style.display=="none"){
		objectobj.style.display="";
		pic=pic+"up.gif"
		objectpic.src=pic;
		objectpic.title="点击关闭相关需求";
	}
	else{
		objectobj.style.display="none";
		pic=pic+"down.gif"
		objectpic.src=pic;
		objectpic.title="点击打开相关需求";
	}
}


