 $(document).ready(function(){
    	var currentPosition = parseInt($("#quickmenu").css("top"));
    	$(window).scroll(function()
    	{       var position = $(window).scrollTop();
    	       $("#quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
    	 });
    	
    	$("#member").click(function(){
    		var url = document.getElementsById("memurl")
    		console.log(url);
    	});
    	
    	  });