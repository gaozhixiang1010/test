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
				<th style="width:10%">序号</th>
				<th style="width:25%">资产类型</th>
				<th style="width:25%">资产名称</th>
				<th style="width:20%">资产归属</th>
				<th style="width:10%">总数量</th>
				<th style="width:10%">剩余数量</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${stockBeans}" varStatus="status" var="rows">
			<tr >
				<td style="width:10%">${status.index + 1 }</td>
				<td style="width:25%">${rows.parent_name }</td>
				<td style="width:25%">${rows.assets_type_name }</td>
				<td style="width:20%">${rows.assets_owner_name }</td>
				<td style="width:10%">${rows.total_num }</td>
				<td style="width:10%">${rows.over_num }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/stock/queryStock.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<input type="hidden" name="parent_id"  value="${stockBean.parent_id }"/>
<input type="hidden" name="assets_type_id"  value="${stockBean.assets_type_id }"/>
<input type="hidden" name="assets_owner"  value="${stockBean.assets_owner }"/>
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

