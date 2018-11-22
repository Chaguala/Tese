$(document).ready(function(){
		//	#animation-1 	
		$("#animation-1 li a").hover(
		function(){
			$(this).animate({ textIndent: "30px" }, 500 );

		},function(){
			$(this).animate({ textIndent: "0px" }, 500 );
		});
			//#navegation		
			$("#vmenu li a").hover(
		function(){
			$(this).animate({ textIndent: "5px" }, 100 );

		},function(){
			$(this).animate({ textIndent: "0px" }, 100 );
		});
	});