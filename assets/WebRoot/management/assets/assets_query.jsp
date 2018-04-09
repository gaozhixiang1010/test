<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function returnPlan_del(json){	
	if(json.result == 200) {
	//	$("#tr_"+json.id).remove();
		alert(json.reason);
		$("#alertBackground").hide();
		$("#return_plan").submit();	
	} else {
		alert(json.reason);
		$("#alertBackground").hide();
	}
}
</script>
<div class="pageContent" style="height:auto;  ">
	<table class="tablelist" >
		<thead>
			<tr style="background: #F5F8FA;">
				<th style="width:10%">序列号</th>
				<th style="width:10%">产品类型</th>
				<th style="width:40%">产品名称</th>
				<th style="width:10%">价格(￥)</th>
				<th style="width:10%">创建时间</th>
				<th style="width:10%">品牌</th>
				<th style="width:10%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${assetsBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.assets_id }" >
			<!--<td style="width:10%">${status.index + 1 }</td>-->
				<td style="width:10%">${rows.assets_id }</td>
				<td style="width:10%">${rows.assets_type_name }</td>
				<td style="width:40%">${rows.assets_name }</td>
				<td style="width:10%">${rows.assets_price }</td>
				<td style="width:10%">${rows.create_time }</td>
				<td style="width:10%">${rows.pinpai }</td>
				<td style="width:10%">
				<a href="javascript:openadd('<%=request.getContextPath() %>/assets/getAssetsBean.action?assets_id=${rows.assets_id }',300,'修改')" >修改</a> | 
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/assets/deleteAssets.action?assets_id=${rows.assets_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/assets/queryAssets.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<input type="hidden" name="assets_type_id"  value="${assetsBean.assets_type_id }"/>
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

