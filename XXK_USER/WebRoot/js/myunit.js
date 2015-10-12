/*1.填写表单禁止自动后退*/

//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外   
function banBackSpace(e){      
	var ev = e || window.event;//获取event对象      
	var obj = ev.target || ev.srcElement;//获取事件源      
   
	var t = obj.type || obj.getAttribute('type');//获取事件源类型     
   
	//获取作为判断条件的事件类型   
	var vReadOnly = obj.getAttribute('readonly');   
	var vEnabled = obj.getAttribute('enabled');   
	//处理null值情况   
	vReadOnly = (vReadOnly == null) ? false : vReadOnly;   
	vEnabled = (vEnabled == null) ? true : vEnabled;   
   
	//当敲Backspace键时，事件源类型为密码或单行、多行文本的，   
	//并且readonly属性为true或enabled属性为false的，则退格键失效   
	var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")    
            && (vReadOnly==true || vEnabled!=true))?true:false;   
  
	//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效   
	var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")   
            ?true:false;           
   
	//判断   
	if(flag2 || flag1){
		 if(confirm("确定要离开此页面吗？确定后该页面上的内容将不会保存.")){
			return true;
		}else{
			return false;   
		}
	}   
}   
//禁止后退键 作用于Firefox、Opera   
document.onkeypress=banBackSpace;   
//禁止后退键  作用于IE、Chrome   
document.onkeydown=banBackSpace;   




/*2.replaceAll实现*/
//参数 attributes 是一个可选的字符串，包含属性 "g"、"i" 和 "m"，分别用于指定全局匹配、区分大小写的匹配和多行匹配。
String.prototype.replaceAll = function(s1,s2){    
	return this.replace(new RegExp(s1,"gm"),s2);    
} 

/*3.startWith的实现*/
String.prototype.startWith= function(oString){
	var reg = new RegExp("^"+oString);
	return reg.test(this); 
}

/*4.endWith的实现*/
String.prototype.endWith=function(oString){  
	var   reg=new RegExp(oString+"$");  
	return reg.test(this);     
} 