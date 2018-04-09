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
function money(){
	var moneyvalue = document.getElementById("assets_price").value;
	var money=/^(([1-9]+[0-9]+)|([0-9]+\.[0-9]{1,2}))$/;
	if(!money.exec(moneyvalue))
	{
		alert("请输入正数和不得以零开头的整数，请保持小数点后两位！");
		return false;
	}
	$('#return_plan').submit();
}
</script>
<body>
<div class="page">
<div class="pageHeader" style="width:630px;height:300px">
<form id="return_plan" method="post" action="<%=path %>/assets/addAsstes.action" onsubmit="return validateCallback(this, return_back);">
<div class="pageFormContent" layoutH="0" >
	<div class="searchBar" style="height: 200px;">
		<ul class="opendialog">
		<li><label>产品名称:</label>	   
		<input name="assets_name" type="text" size="30" id="text" value="" class="form-control"  check-type="required" />
		</li>
		<li><label>价格(￥):</label>	   
		<input name="assets_price" id="assets_price" type="text" size="30" value="0.00"  class="form-control"  check-type="required money"/>
		</li>
		<li><label>产品类型:</label>	
		<select name="assets_type_id" class="selectpicker relevance" data-size="5" check-type="required">
			<option value="" selected>请选择资产名称</option>
			<c:forEach items="${assetsTypeBeans}" var="rows">
			<option value="${rows.type_id }">${rows.type_name }</option>
			</c:forEach>
		</select> 
		</li>
		<li><label>产品介绍:</label>	   
		<textarea cols="50" rows="3" name="assets_desc" size="4" class="form-control" style="width: 415px;"></textarea>
		</li>
		</ul>
	</div>
	<div class="formBar">
		<ul class="toolbarDialog">	
			<!-- <li><button type="button" class="btn btn-primary" id="ins" onclick="money()">确定</button></li> -->
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