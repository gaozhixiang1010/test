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
<script type="text/javascript">
function search(){
	var end_time=$("#end_time").val();
	var begin_time=$("#begin_time").val();
	if(begin_time!=null&&begin_time!=''&&end_time!=null&&end_time!=''){
		if(end_time<begin_time){
			alert("请正确填写'时间'区间");
			$("#end_time").val("");
			return;
		}
	}
	$('#return_plan').submit();
}
</script>
<body>
<div class="page">
<div class="pageHeader" layoutH="0" style="height: 100%;">
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">出库管理</a></li>
    <li><a href="#">${title_name }</a></li>
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
<form id="return_plan" method="post" action="<%=path %>/outstock/queryOutStock.action" onsubmit="return divSearch(this,'jbsxBox');">
	<div class="searchBar">
		<ul class="seachform">
		<input type="hidden" name="parent_id"  value="${parent_id }"/><!-- 固定资产 -->
		<li><label>资产名称:</label>	
			<select name="assets_type_id" class="selectpicker relevance" data-size="3">
				<option value="" selected>请选择资产名称</option>
				<c:forEach items="${assetsTypeBeans}" var="rows">
				<option value="${rows.type_id }">${rows.type_name }</option>
				</c:forEach>
			</select> 
		</li>
		<li><label>资产归属:</label>	   
			<select name="assets_owner" class="selectpicker relevance" data-size="3">
				<option value="" selected>请选择资产归属</option>
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
		<li><label>录入时间:</label>
			<input name="begin_time" id="begin_time" type="text" readonly class="form-control form_datetime" data-date-format="yyyy-mm-dd" data-start-view="2" data-min-view="3">至
			<input name="end_time" id="end_time" type="text" readonly class="form-control form_datetime" data-date-format="yyyy-mm-dd" data-start-view="2" data-min-view="3">
		</li>
		</ul>
		<ul class="toolbarDialog">	
			<li><button type="button" class="btn btn-primary" id="insquery" onclick="search()">查询</button></li>
			<li><a type="button" class="btn btn-danger" href= "javascript:openadd('<%=path %>/outstock/passAdd.action?parent_id=${parent_id }',300,'新增')">新增</a></li>
		<!-- 	<li><a type="button" class="btn btn-export" href= "<%=path %>/assets/assets_download.jsp">导出</a></li>
			<li><button type="button" class="btn btn-export" onclick="download()">导出</button></li> -->
		</ul>
	</div>
</form>

<div id="jbsxBox" class="unitBox">
	<%@ include file="outstock_query.jsp"%>
</div>
</div>
</div>
</div>
</body>
</html>