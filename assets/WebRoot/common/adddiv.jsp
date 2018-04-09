<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style>
  .mm {
	float: left;
	font-size: 17px;
	font-weight: bold;
	color: #686D83;
	}
  </style>
  </head>

<body>
<!-- 
 <div id="addModal" class="modal fade hide " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div id= "closeaddModal"><div class="mm"></div><a  class="close" href="javascript:closeadd()" >×&nbsp;</a></div>
  	<div id="inneraddModal"></div>
 </div>
 -->
 <div id="addModal" class="modal fade hide " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  	<div id= "closeaddModal" style="height:40px;font-size:20px;line-height:40px;background:#ebf0f5 url(../images/pageHeader_bg.png) repeat-x;border-bottom: 1px solid #D9D6DB;padding-left:10px"><a  class="close" href="javascript:closeadd()" style="font-size:35px">×&nbsp;</a></div>
  	<div id="inneraddModal"></div>
 </div>
 <div id="adddModal" class="modal fade hide " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 900px;left: 35%">
  	<div id= "closeadddModal" style="height:40px;font-size:20px;line-height:40px;background:#ebf0f5 url(../images/pageHeader_bg.png) repeat-x;border-bottom: 1px solid #D9D6DB;padding-left:10px"><a  class="close" href="javascript:closeaddd()" style="font-size:35px">×&nbsp;</a></div>
  	<div id="inneradddModal"></div>
 </div>
  <div id="addddModal" class="modal fade hide " tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:680px;">
  	<div id= "closeaddddModal" style="height:40px;font-size:20px;line-height:40px;background:#ebf0f5 url(../images/pageHeader_bg.png) repeat-x;border-bottom: 1px solid #D9D6DB;padding-left:10px"><a  class="close" href="javascript:closeadddd()" style="font-size:35px">×&nbsp;</a></div>
  	<div id="inneraddddModal"></div>
 </div>
   <script>
	  function openadd(url,hh,title){
	  	document.getElementById('inneraddModal').innerHTML="" ;
		if(""!==title)
		{
			$('#closeaddModal').html(title+'<a  class="close" href="javascript:closeadd()" style="font-size:35px">×&nbsp;</a>');
		}
		else
			$('#closeaddModal').html('<a  class="close" href="javascript:closeadd()" style="font-size:35px">×&nbsp;</a>');
		$("#inneraddModal").append("<iframe scrolling=\"auto\" frameborder=\"0\" width=\"628\" height=\""+hh+"\" src=\""+url+"\"></iframe>");
		$("#addModal").modal('show');		
	  }
	  function openaddd(url,hh,title){
	  	document.getElementById('inneradddModal').innerHTML="" ;
	  	if(""!==title)
		{
			$('#closeadddModal').html(title+'<a  class="close" href="javascript:closeaddd()" style="font-size:35px">×&nbsp;</a>');
		}
		else
			$('#closeadddModal').html('<a  class="close" href="javascript:closeaddd()" style="font-size:35px">×&nbsp;</a>');
		$("#inneradddModal").append("<iframe scrolling=\"auto\" frameborder=\"0\" width=\"898\" height=\""+hh+"\" src=\""+url+"\"></iframe>");
		$("#adddModal").modal('show');		
	  }
	  function openadddd(url,hh,title){
	  	document.getElementById('inneraddddModal').innerHTML="" ;
		if(""!==title)
		{
			$('#closeaddddModal').html(title+'<a  class="close" href="javascript:closeadddd()" style="font-size:35px">×&nbsp;</a>');
		}
		else
			$('#closeaddddModal').html('<a  class="close" href="javascript:closeadddd()" style="font-size:35px">×&nbsp;</a>');	  	
		$("#inneraddddModal").append("<iframe scrolling=\"auto\" frameborder=\"0\" width=\"678\" height=\""+hh+"\" src=\""+url+"\"></iframe>");
		$("#addddModal").modal('show');		
	  }
	  function closeadd(){
	  	$("#addModal").modal('hide');
	  }
	  function closeaddd(){
	  	$("#adddModal").modal('hide');
	  }
	  function closeadddd(){
	  	$("#addddModal").modal('hide');
	  }
	  function formsubmit(id){	
		$("#"+id).submit();
	  }
   </script>	
</body>
</html>