/*!
 * bootstrap-select v1.5.4
 * http://silviomoreto.github.io/bootstrap-select/
 *
 * Copyright 2013 bootstrap-select
 * Licensed under the MIT license
 */

!function($) {
$.fn.checkboxChange = function(option, event) {
		return this.each(function(i,elem){
			       var $file = $(this);
			       $file.wrap('<div class="checker"></div>');
			       var html = '<span class="';
			       if($file.attr("checked"))
			       	html+="checked";
			       html +='"></span>';
			       $file.wrap(html);
			       $file.css("display","none");
				   $file.parent('span:first').click(function() 
				   {  
				   		$file.parent('span:first').removeClass('checked');
				   		if(!$file.attr("checked"))
				   		{
				   			$file.attr("checked",true);
				   			$file.parent('span:first').addClass('checked'); 
				   		}
				   		else
				   			$file.attr("checked",false);
				   }); 
				   var call = $file.attr("call");
				   if(call)
				   {
				   		call();
				   }	   
		});
	};
}(window.jQuery);