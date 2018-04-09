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
	$('#return_plan').submit();
}
</script>
<body>
<div class="page">
<div class="pageHeader" layoutH="0" style="height: 100%;">
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">演唱会门票信息管理</a></li>
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
<form id="return_plan" method="post" action="<%=path %>/assets/queryAssets.action" onsubmit="return divSearch(this,'jbsxBox');">
	<div class="searchBar">
		<ul class="seachform">
		<li><label>资产名称:</label>	
			<select name="assets_type_id" class="selectpicker relevance" data-size="3">
				<option value="" selected>请选择类型名称</option>
				<c:forEach items="${assetsTypeBeans}" var="rows">
				<option value="${rows.type_id }">${rows.type_name }</option>
				</c:forEach>
			</select> 
		</li>
		</ul>
		<ul class="toolbarDialog">	
			<li><button type="button" class="btn btn-primary" id="insquery" onclick="search()">查询</button></li>
			<li><a type="button" class="btn btn-danger" href= "javascript:openadd('<%=path %>/assets/passAdd.action',300,'新增')">新增</a></li>
		<!-- 	<li><a type="button" class="btn btn-export" href= "<%=path %>/management/assets/assets_download.jsp">导出</a></li>
			<li><button type="button" class="btn btn-export" onclick="download()">导出</button></li> -->
		</ul>
	</div>
</form>

<div id="jbsxBox" class="unitBox">
	<%@ include file="assets_query.jsp"%>
</div>
</div>
</div>
</div>
</body>
</html>