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
<div class="pageHeader" style="width:630px;height:300px">
<form id="return_plan" method="post" action="<%=path %>/outstock/updateOutStock.action" onsubmit="return validateCallback(this, return_back);">
<div class="pageFormContent" layoutH="0" >
	<div class="searchBar" style="height: 200px;">
		<ul class="opendialog">
		<input type="hidden" name="outstock_id" value="${outStockBean.outstock_id }"/>
		<li><label>出库时间：</label>
		<input name="out_time" type="text" value="${outStockBean.out_time }" readonly class="form-control form_datetime" data-date-format="yyyy-mm-dd" data-start-view="2" data-min-view="3" check-type="required">
		</li>
		<li><label>数量:</label>	   
		<input name="assets_num" type="text" size="30" value="${outStockBean.assets_num }"  class="form-control"  check-type="required number"/>
		</li>
		<li><label>资产名称:</label>	
		<select name="assets_type_id" class="selectpicker relevance" data-size="5" check-type="required">
			<c:forEach items="${assetsTypeBeans}" var="rows">
			<c:if test="${outStockBean.assets_type_id == rows.type_id}"><option value="${rows.type_id }" selected>${rows.type_name }</option></c:if>
			<c:if test="${outStockBean.assets_type_id != rows.type_id}"><option value="${rows.type_id }">${rows.type_name }</option></c:if>
			</c:forEach>
		</select> 
		</li>
		<li><label>资产归属:</label>	
		<select name="assets_owner" class="selectpicker relevance" data-size="5" check-type="required">
			<c:if test="${outStockBean.assets_owner == 1}">
			<option value="1" selected>市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 2}">
			<option value="1">市场推广部</option>
			<option value="2" selected>财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 3}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3" selected>人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 4}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4" selected>营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 5}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5" selected>办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 6}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6" selected>运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 7}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7" selected>商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 8}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8" selected>客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 9}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9" selected>工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 10}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10" selected>孵化器</option>
			<option value="11">公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 11}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11" selected>公开面积</option>
			<option value="12">咖啡厅</option>
			</c:if>
			<c:if test="${outStockBean.assets_owner == 12}">
			<option value="1">市场推广部</option>
			<option value="2">财务部</option>
			<option value="3">人力行政部</option>
			<option value="4">营销部</option>
			<option value="5">办公室</option>
			<option value="6">运营中心</option>
			<option value="7">商务中心</option>
			<option value="8">客服部</option>
			<option value="9">工程部</option>
			<option value="10">孵化器</option>
			<option value="11">公开面积</option>
			<option value="12" selected>咖啡厅</option>
			</c:if>
		</select> 
		</li>
		<li><label>使用部门:</label>	   
		<input name="department" type="text" size="30" value="${outStockBean.department }"  class="form-control"  check-type="required"/>
		</li>
		<li><label>负责人:</label>	   
		<input name="charge" type="text" size="30" value="${outStockBean.charge }"  class="form-control"  check-type="required"/>
		</li>
		<li><label>描述:</label>	   
		<textarea cols="50" rows="3" name="outstock_desc" size="4" class="form-control" style="width: 415px;">${outStockBean.outstock_desc }</textarea>
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