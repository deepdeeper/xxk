//监听enter事件
		if(document.addEventListener){//如果是Firefox
			document.addEventListener("keypress",fireFoxHandler, true);
		}else{
			document.attachEvent("onkeypress",ieHandler);
		}
		function fireFoxHandler(evt){
			if(evt.keyCode==13){
		 		validate();
			}
		}
		function ieHandler(evt){
			if(evt.keyCode==13){
			  validate();
			}
		}
		
	   	
	   	function G(a){
	   		return document.getElementById(a);
	   	}
	  	function refreash() {
	  		G('username').value='';
		  	G('username').focus();
		  	G('password').value='';
		  	G('validateCodeImg').src='login/loginImage.jsp?now=' + new Date();;
	  	} 
	   function validate(){
	   		var username = G("username").value;
  			var password = G("password").value;
 			var validateCode = G("validateCode").value;
 			
	 		if(isRegisterUserName(username) && isRegisterPassword(password) && isValidateCode(validateCode)){
	 			G("login").submit();
	 		}
	  		return false;
 		}
		function isRegisterUserName(u){
		   	 var patrn=/^([\w -_]){2,20}$/;   
			 if (!patrn.exec(u)){
			  	 G("username").value = "";
			  	 G("password").value = "";
				 alert("用户名格式不对");
				 return false;  
			  }
			 return true;  
		}
	   function isRegisterPassword(p){
	   	 var patrn=/^[\w!@#$%^&*]{6,20}$/;   
		 if (!patrn.exec(p)){
		 	 G("password").value = "";
		 	 alert("密码格式不对");
		 	 G("password").focus();
			 return false;  
		 }
		 return true;  
	   }
	    function isValidateCode(v){
	   	 var patrn=/^[a-zA-Z0-9]{4}$/;   
		 if (!patrn.exec(v)){
			alert("验证码格式不对");
			G("validateCode").focus();
			return false;  
		 }
		 	return true;  
	   }
	   
	   function init() {
	   		var username = G('username').value;
	   		if(username==""){
	   			G('username').value='';
	   			G('username').focus();
	   		}
	   		G("password").value="";
	   		G("validateCode").value="";
	  }
	  function init2(username,password){
	  	G('username').value=username;
	  	G('password').value=password;
	  	G("validateCode").focus();
	  }