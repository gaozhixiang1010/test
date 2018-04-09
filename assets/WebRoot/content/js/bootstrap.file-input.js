/*!
 * bootstrap-select v1.5.4
 * http://silviomoreto.github.io/bootstrap-select/
 *
 * Copyright 2013 bootstrap-select
 * Licensed under the MIT license
 */

!function($) {
$.fn.fileChange = function(option, event) {
		return this.each(function(i,elem){
			       var $file = $(this);
			       if(!$file.prop("id")) {
			            $file.prop("id", "file_" + i);
			        }
			       var html = '';
		       	   var valid = ($file.attr('check-type')==undefined)?null:$file.attr('check-type').split(' ');
               	   if (valid != null && valid.length > 0)
               	   {
               	   	   if($file.attr("datav")!=null &&"" !== $file.attr("datav"))
			       	   {
			       	   	 html += '<input class="form-control" style="width:150px" type="text" readonly check-type='+valid+' value="'+$file.attr("datav")+'">';
			       	   }
		       	   	   else
		       	   		 html += '<input class="form-control" style="width:150px" type="text" readonly check-type='+valid+'>';
		       	   }
		       	   else
		       	   {
		       	       if($file.attr("datav")!=null &&"" !== $file.attr("datav"))
			       	   {
		       	  	  	 html += '<input class="form-control" style="width:150px" type="text" readonly value="'+$file.attr("datav")+'">';
		       	  	   }
		       	  	   else
		       	  	  	html += '<input class="form-control" style="width:150px" type="text" readonly>';
		       	   }
		       	   		
		       	   html += '<label for="'+$file.prop("id")+'"  class="btn btn-primary"  style="width:50px" ><span>&#x4E0A;&#x4F20;</span></label>';
				   $file.wrap("<div class='input-group'></div>");
				   $file.before(html);
				   $file.addClass("file-input-opacity");
				   $file.css("width","0px");
				   $file.change(function() 
				   {  
				   		$file.parent('.input-group').children('input[type=text]:first').val($(this).val());  
				   }); 
		});
	};
}(window.jQuery);