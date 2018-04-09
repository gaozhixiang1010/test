<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<%@ include file="../../common/link.jsp"%>
<script type="text/javascript">
function return_back(json) {
	if(json.result == 200){
		alert(json.reason);
		$("#alertBackground").hide();
		window.parent.formsubmit("return_plan");
		window.parent.closeadd();
	}
	else{
		alert(json.reason);
		$("#alertBackground").hide();
	}
}
function soncloseadd(){
	window.parent.closeadd();
}
</script>
<body>
<div class="page">
<div class="pageHeader" style="width:630px;height:200px">
<form id="return_plan" method="post" action="<%=path %>/notice/addNotice.action" onsubmit="return validateCallback(this, return_back);">
<div class="pageFormContent" layoutH="0" >
	<div class="searchBar" style="height: 90px;">
		<ul class="opendialog">
		<li><label>标题:</label>	   
		<input name="notice_title" type="text" size="30" id="text" value="" class="form-control"  check-type="required" />
		</li>
		<li><label>内容:</label>	   
		<textarea cols="50" rows="3" name="notice_content" size="4" class="form-control" style="width: 415px;"></textarea>
		</li>
		</ul>
	</div>
	<div class="formBar">
		<ul class="toolbarDialog">	
			<li><button type="submit" class="btn btn-primary" id="ins">确定</button></li>
			<li><a type="button" class="btn btn-danger" href="javascript:soncloseadd()">关闭</a></li>
		</ul>
	</div>
</div>
</form>

</div>
</div>
</body>
</html>