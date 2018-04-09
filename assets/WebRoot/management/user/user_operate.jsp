<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>资产类型</title>
    
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
    <li><a href="#">会员管理</a></li>
    <li><a href="#">会员信息管理</a></li>
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
<form id="return_plan" method="post" action="<%=path %>/user/queryUser.action" onsubmit="return divSearch(this,'jbsxBox');">
	<div class="searchBar">
		<ul class="seachform">
		</ul>
		<ul class="toolbarDialog">	
			<li><button type="submit" class="btn btn-primary" id="insquery">查询</button></li>
		<!-- 	<li><a type="button" class="btn btn-danger" href= "javascript:openadd('<%=path %>/notice/passAdd.action',200,'新增')">新增</a></li> -->
		</ul>
	</div>
</form>

<div id="jbsxBox" class="unitBox">
	<%@ include file="user_query.jsp"%>
</div>
</div>
</div>
</div>
</body>
</html>