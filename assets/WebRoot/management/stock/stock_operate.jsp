<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>固定资产</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<%@ include file="../../common/link.jsp"%>
<%@ include file="../../common/adddiv.jsp"%>
<body>
<div class="page">
<div class="pageHeader" layoutH="0" style="height: 100%;">
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">库存</a></li>
    <li><a href="#">库存查询</a></li>
    </ul>
</div>
<div class="pageFormContent" style="
    /* height: 700px; */
    /* width: 1010px; */
    /* TEXT-ALIGN: center; */
    margin: 0 auto;
    margin-top: 10px;
    /* border: 1px solid #D9D6DB; */
">
<form id="return_plan" method="post" action="<%=path %>/stock/queryStock.action" onsubmit="return divSearch(this,'jbsxBox');">
	<div class="searchBar">
		<ul class="seachform">
		<li><label>资产类型:</label>	
			<select name="parent_id" class="selectpicker relevance" data-size="3" ref="assets_type_id" refUrl="<%=path %>/stock/getAssetsTypeByParentId.action?parent_id={value}">
				<option value="" selected>全部类型</option>
				<c:forEach items="${parentTypeBeans}" var="rows">
				<option value="${rows.parent_id }">${rows.parent_name }</option>
				</c:forEach>
			</select> 
		</li>
		<li><label>资产名称:</label>	
			<select name="assets_type_id" id="assets_type_id" class="selectpicker relevance" data-size="3">
				<option value="" selected>请选择资产名称</option>
			</select> 
		</li>
		<li><label>资产归属:</label>	   
			<select name="assets_owner" class="selectpicker relevance" data-size="3">
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
				<option value="12">咖啡厅</option>
			</select> 
		</li>
		</ul>
		<ul class="toolbarDialog">	
			<li><button type="submit" class="btn btn-primary" id="insquery">查询</button></li>
		</ul>
	</div>
</form>

<div id="jbsxBox" class="unitBox">
	<%@ include file="stock_query.jsp"%>
</div>
</div>
</div>
</div>
</body>
</html>