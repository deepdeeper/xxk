var saveLeft,saveTop,saveWidth,saveHeight;
	var theBody;
	var eventType;   
	var div;
	function setDiv(div1,title)
	{
		if (div)
		{
			return;
		}
		
		var newLeft,newTop,newWidth,newHeight;
		theBody = document.body;
		
		div = document.createElement("div");	
        div.id="panelDiv";	
		div.style.position = "absolute";
		div.style.backgroundColor = "#E5E5E5"
		div.style.padding = "2px 5px 5px 2px";
		div.style.overflow = "hidden";
		div.style.zIndex = 1;
		
	
		Function()
		{
			var openType = document.getElementById("radio1").checked ? 0 : 1;
			if (openType == 0)   
			{
				newWidth = "500px";
				newHeight = "100px";
				newLeft = (theBody.clientWidth - parseInt(newWidth)) / 2 + "px";
				newTop = (theBody.clientHeight - parseInt(newHeight)) / 2 + "px";
			}
			else	
			{
				newWidth = saveWidth ? saveWidth : "500px";
				newHeight = saveHeight ? saveHeight : "100px";
				newLeft = saveLeft ? saveLeft : (theBody.clientWidth - parseInt(newWidth)+100) / 2 + "px";
				newTop = saveTop ? saveTop : (theBody.clientHeight - parseInt(newHeight)) / 2 + "px";
			}
			div.style.width = newWidth;
			div.style.height = newHeight;
			div.style.left = newLeft;
			div.style.top = newTop;
		}
		
		div = setChild(div,div1,title);
		theBody.appendChild(div);
		
		var ipt = document.getElementsByTagName("input");
		for(var i = 0; i < ipt.length; i++)
		{
			ipt[i].disabled = false;
		}
		
	}
	
	function setChild(div,div1,title)
	{
       var isMove = document.getElementById("isMove").checked;
		var isResize = document.getElementById("isResize").checked;
		
		var cDiv = document.createElement;
		var backDiv = cDiv("div");
		backDiv.style.cssText = "left: 0px; top: 0px; width: 100%; height: 100%; background-color: #fff;";
		div.appendChild(backDiv);
		var topDiv = cDiv("div");
		topDiv.style.cssText = "left: 2px; top: 2px; width: 100%; height: 25px; position: absolute; background-image:url(images/divimage/idx_btnbg.gif); vertical-align: middle; z-index: 5";
		if (isMove)
		{
			topDiv.style.cursor = "move";
			topDiv.setAttribute("onmousedown", function(){setMove(this)});
		}
		else
		{
			topDiv.style.cursor = "default";
		}
		topDiv.innerHTML = "<span style='top: 5px; left:5px; font-size: 14px; font-weight: bold; color: #102548; position: relative;' onselectstart='return false'>"+title+"</span>";
		div.appendChild(topDiv);
        var closeDiv = cDiv("div");
		closeDiv.style.cssText = "right: 8px; top : 5px;position:absolute;text-align: center; vertical-align: middle; cursor: pointer; z-index: 10";
		closeDiv.setAttribute("onclick", function() {eCloseDiv()});
		closeDiv.innerHTML = "<img src='images/divimage/close.gif'border='0'/>";
		div.appendChild(closeDiv);
    	var contentDiv =document.getElementById(div1);
		contentDiv.style.cssText = "left: 2px; top: 30px; width: 100%; position: absolute; overflow: auto";
		contentDiv.style.height = (parseInt(div.style.height) - 40) + "px";
		div.appendChild(contentDiv);
        var reDiv = cDiv("div");
		reDiv.style.cssText = "right: 0px; bottom: 0px; width: 5px; height: 5px; position: absolute;";
		if (isResize)
		{
			reDiv.style.cursor = "se-resize";
			reDiv.setAttribute("onmousedown", function(){setResize(this)});
		}
		else
		{
			reDiv.style.cursor = "default";
		}
		div.appendChild(reDiv);
		
		return div;
	}
	
	var oX, oY, oLeft, oTop, oWidth, oHeight;
	var divClone, oDiv;		
	var oTime;
	function setMove(obj)
	{
		if (event.button == 1)
		{
			if (oTime)
			{
				clearTimeout(oTime);
				divClone.parentNode.removeChild(divClone);
			}
			oDiv = obj.parentNode;
			divClone = oDiv.cloneNode(true);
			divClone.style.filter = "Alpha(opacity=50)";
			divClone.childNodes[1].setAttribute("onmousemove", function(){startMove(this)});
			divClone.childNodes[1].setAttribute("onmouseup", function(){endMove()});
			oX = parseInt(event.clientX);
			oY = parseInt(event.clientY);
			oLeft = parseInt(divClone.style.left);
			oTop = parseInt(divClone.style.top);
			document.body.appendChild(divClone);
			divClone.childNodes[1].setCapture();
			eventType = "move";
		}
	}
	function startMove(obj)
	{
		if (eventType == "move" && event.button == 1)
		{
			var moveDiv = obj.parentNode;
			moveDiv.style.left = (oLeft + event.clientX - oX) + "px";
			moveDiv.style.top = (oTop + event.clientY - oY) + "px";
		}
	}
	function endMove()
	{
		if (eventType == "move")
		{
			divClone.childNodes[1].releaseCapture();
            move(parseInt(divClone.style.left), parseInt(divClone.style.top));
			eventType = "";
		}
	}
	function move(aimLeft, aimTop)
	{
		var nowLeft = parseInt(oDiv.style.left);
		var nowTop = parseInt(oDiv.style.top);
		var moveSize = 30;
		if (nowLeft > aimLeft + moveSize || nowLeft < aimLeft - moveSize || nowTop > aimTop + moveSize || nowTop < aimTop - moveSize)
		{
			oDiv.style.left = aimLeft > nowLeft + moveSize ? (nowLeft + moveSize) + "px" : aimLeft < nowLeft - moveSize ? (nowLeft - moveSize) + "px" : nowLeft + "px";
			oDiv.style.top = aimTop > nowTop + moveSize ? (nowTop + moveSize) + "px" : aimTop < nowTop - moveSize ? (nowTop - moveSize) + "px" : nowTop + "px";
			oTime = setTimeout("move(" + aimLeft + ", " + aimTop + ")", 1);
		}
		else
		{
			oDiv.style.left = divClone.style.left;
			oDiv.style.top = divClone.style.top;
			divClone.parentNode.removeChild(divClone);
			divClone == null;
		}
	}
	function setResize(obj)
	{
		if (event.button == 1)
		{
			if (oTime)
			{
				clearTimeout(oTime);
				divClone.parentNode.removeChild(divClone);
			}
			oDiv = obj.parentNode;
			divClone = oDiv.cloneNode(true);
			divClone.style.filter = "Alpha(opacity=50)";
			divClone.childNodes[4].setAttribute("onmousemove", function(){startResize(this)});
			divClone.childNodes[4].setAttribute("onmouseup", function(){endResize()});
			oX = parseInt(event.clientX);
			oY = parseInt(event.clientY);
			oWidth = parseInt(divClone.style.width);
			oHeight = parseInt(divClone.style.height);
			document.body.appendChild(divClone);
			divClone.childNodes[4].setCapture();
			eventType = "resize";
		}
	}
    function startResize(obj)
	{
		if (eventType == "resize" && event.button == 1)
		{
			var nX = event.clientX;
			var nY = event.clientY;
			if (nX > oX - oWidth && nY > oY - oHeight + 40)
			{
				var resizeDiv = obj.parentNode;
				resizeDiv.style.width = (oWidth + event.clientX - oX) + "px";
				resizeDiv.style.height = (oHeight + event.clientY - oY) + "px";
				resizeDiv.childNodes[3].style.height = (parseInt(resizeDiv.style.height) - 40) + "px";
			}
		}
	}
	function endResize()
	{
		if (eventType == "resize")
		{
			divClone.childNodes[4].releaseCapture();
            resize(parseInt(divClone.style.width), parseInt(divClone.style.height));
			eventType = "";
		}
	}
	function resize(aimWidth, aimHeight)
	{
		var nowWidth = parseInt(oDiv.style.width);
		var nowHeight = parseInt(oDiv.style.height);
		var resizeSize = 30;
		if (nowWidth > aimWidth + resizeSize || nowWidth < aimWidth - resizeSize || nowHeight > aimHeight + resizeSize || nowHeight < aimHeight - resizeSize)
		{
			oDiv.style.width = aimWidth > nowWidth + resizeSize ? (nowWidth + resizeSize) + "px" : aimWidth < nowWidth - resizeSize ? (nowWidth - resizeSize) + "px" : nowWidth + "px";
			oDiv.style.height = aimHeight > nowHeight + resizeSize ? (nowHeight + resizeSize) + "px" : aimHeight < nowHeight - resizeSize ? (nowHeight - resizeSize) + "px" : nowHeight + "px";
			oDiv.childNodes[3].style.height = (parseInt(oDiv.style.height) - 40) + "px";
			oTime = setTimeout("resize(" + aimWidth + ", " + aimHeight + ")", 1);
		}
		else
		{
			oDiv.style.width = divClone.style.width;
			oDiv.style.height = divClone.style.height;
			oDiv.childNodes[3].style.height = (parseInt(oDiv.style.height) - 40) + "px";
			divClone.parentNode.removeChild(divClone);
			divClone == null;
		}
	}
   function eCloseDiv()
	{
		if (div)
		{
			div.style.display="none";
			var ipt = document.getElementsByTagName("input");
			for(var i = 0; i < ipt.length; i++)
			{
				ipt[i].disabled = false;
			}
			div = null;
		}
	}
 	function saveDiv()
	{
		if (div)
		{
			saveLeft = div.style.left;
			saveTop = div.style.top;
			saveWidth = div.style.width;
			saveHeight = div.style.height;
		}
	}
    document.onkeydown = function()
	{
		event.keyCode == 27 ? eCloseDiv() : null;		
		event.ctrlKey && (event.keyCode == 83 || event.keyCode == 115) ? saveDiv() : null;	
		event.ctrlKey && event.keyCode == 13 ? setDiv() : null 
		!event.ctrlKey && (event.keyCode == 37 || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) ? arrowMove(event.keyCode) : null;
		event.ctrlKey && (event.keyCode == 37  || event.keyCode == 38 || event.keyCode == 39 || event.keyCode == 40) ? arrowResize(event.keyCode) : null;
	}
	function arrowMove(eKeyCode)
	{
		if (div)
		{
			var isMove = document.getElementById("isMove").checked;
			if (isMove)
			{
				switch(eKeyCode)
				{
					case 37:
						div.style.left = (parseInt(div.style.left) - 1) + "px";	//left
						break
					case 38:
						div.style.top = (parseInt(div.style.top) - 1) + "px";	//up
						break
					case 39:
						div.style.left = (parseInt(div.style.left) + 1) + "px";	//right
						break
					case 40:
						div.style.top = (parseInt(div.style.top) + 1) + "px";	//down
						break
				}
			}
		}
	}
	function arrowResize(eKeyCode)
	{
		if (div)
		{
			var isResize = document.getElementById("isResize").checked;
			if (isResize)
			{
				switch(eKeyCode)
				{
					case 37:
						div.style.width = (parseInt(div.style.width) - 1) + "px";	//left
						break
					case 38:
						div.style.height = (parseInt(div.style.height) - 1) + "px";	//up
						break
					case 39:
						div.style.width = (parseInt(div.style.width) + 1) + "px";	//right
						break
					case 40:
						div.style.height = (parseInt(div.style.height) + 1) + "px";	//down
						break
				}
			}
		}
	}