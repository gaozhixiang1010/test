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
				<th style="width:20%">序号</th>
				<th style="width:60%">类型名称</th>
				<th style="width:20%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${assetsTypeBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.type_id }" >
				<td style="width:20%">${status.index + 1 }</td>
				<td style="width:60%">${rows.type_name }</td>
				<td style="width:20%">
				<a href="javascript:openadd('<%=request.getContextPath() %>/assets_type/getAssetsTypeBean.action?type_id=${rows.type_id }',200,'修改')" >修改</a> | 
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/assets_type/deleteAssetsType.action?type_id=${rows.type_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/assets_type/queryAssetsType.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<input type="hidden" name="type_name"  value="${assetsTypeBean.type_name }"/>
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

