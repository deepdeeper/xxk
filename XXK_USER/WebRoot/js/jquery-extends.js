$(function(){
	$.each($(".theadBg").nextAll("tr"),function(index,node){
		var oldBgc = $(node).css("background-color");
		$(node).hover(function(){
			$(node).css("background-color","#FEF3D1");
		},function(){
			$(node).css("background-color",oldBgc);
		});
	});
})