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
				<th style="width:10%">资产类型</th>
				<th style="width:10%">资产名称</th>
				<th style="width:10%">资产归属</th>
				<th style="width:10%">使用部门</th>
				<th style="width:10%">负责人</th>
				<th style="width:5%">数量</th>
				<th style="width:10%">出库时间</th>
				<th style="width:15%">描述</th>
				<th style="width:10%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${outStockBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.outstock_id }" >
			<!--<td style="width:10%">${status.index + 1 }</td>-->
				<td style="width:10%">${rows.outstock_id }</td>
				<td style="width:10%">${rows.parent_name }</td>
				<td style="width:10%">${rows.assets_type_name }</td>
				<td style="width:10%">${rows.assets_owner_name }</td>
				<td style="width:10%">${rows.department }</td>
				<td style="width:10%">${rows.charge }</td>
				<td style="width:5%">${rows.assets_num }</td>
				<td style="width:10%">${rows.out_time }</td>
				<td style="width:15%">${rows.outstock_desc }</td>
				<td style="width:10%">
				<a href="javascript:openadd('<%=request.getContextPath() %>/outstock/getOutStockBean.action?parent_id=${rows.parent_id }&outstock_id=${rows.outstock_id }',300,'修改')" >修改</a> | 
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/outstock/deleteOutStock.action?outstock_id=${rows.outstock_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/outstock/queryOutStock.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<input type="hidden" name="assets_type_id"  value="${outStockBean.assets_type_id }"/>
<input type="hidden" name="assets_owner"  value="${outStockBean.assets_owner }"/>
<input type="hidden" name="begin_time"  value="${outStockBean.begin_time }"/>
<input type="hidden" name="end_time"  value="${outStockBean.end_time }"/>
<input type="hidden" name="parent_id"  value="${outStockBean.parent_id }"/>
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

