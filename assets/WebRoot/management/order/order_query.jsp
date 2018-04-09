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
				<th style="width:40%">产品名称</th>
				<th style="width:10%">会员姓名</th>
				<th style="width:10%">联系方式</th>
				<th style="width:10%">销售时间</th>
				<th style="width:10%">销售数量</th>
				<th style="width:10%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${orderBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.order_id }" >
				<td style="width:10%">${status.index + 1 }</td>
				<td style="width:40%">${rows.assets_name }</td>
				<td style="width:10%">${rows.user_name }</td>
				<td style="width:10%">${rows.tel }</td>
				<td style="width:10%">${rows.create_date }</td>
				<td style="width:10%">${rows.num }</td>
				<td style="width:10%">
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/order/deleteOrder.action?order_id=${rows.order_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/order/queryOrder.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

