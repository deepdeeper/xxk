	function openMainPage(pageUrl,title)
	{
	  var	jxnewwin = window.open(pageUrl,"jxmain","menubar=no,scrollbars=yes,status=no,location=no,resizable=no,channelmode=0");
		if (document.all)
		{			
			try {		
				jxnewwin.moveTo(0,0);
				jxnewwin.resizeTo(screen.width, screen.height);
			}catch(e){
			}
		}
		TimeInterval = "100";				
		timerID = window.setTimeout("closeParentWindow()", TimeInterval); 				
	}
	
	function closeParentWindow()
	{
		if (typeof(window.parent.window.opener) == "undefined")
		{
			window.parent.open("","_self");
			window.parent.top.opener=null;
			window.parent.top.close();			
		}
		else if (typeof(window.parent.window.opener) == "object")
		{
	       window.parent.open("","_self");
           window.parent.top.opener=null;
           window.parent.top.close();		
		}
		else
		{
			window.opener = null;
			window.close();			
		}	
	}