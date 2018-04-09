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
				<th style="width:5%">序号</th>
				<th style="width:10%">用户名</th>
				<th style="width:10%">密码</th>
				<th style="width:10%">真实姓名</th>
				<th style="width:10%">性别</th>
				<th style="width:10%">联系方式</th>
				<th style="width:10%">QQ</th>
				<th style="width:10%">E-MAIL</th>
				<th style="width:20%">住址</th>
				<th style="width:5%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${userBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.user_id }" >
				<td style="width:5%">${status.index + 1 }</td>
				<td style="width:10%">${rows.user_name }</td>
				<td style="width:10%">${rows.user_pwd }</td>
				<td style="width:10%">${rows.real_name }</td>
				<td style="width:10%">${rows.sex }</td>
				<td style="width:10%">${rows.tel }</td>
				<td style="width:10%">${rows.qq }</td>
				<td style="width:10%">${rows.email }</td>
				<td style="width:20%">${rows.addr }</td>
				<td style="width:5%">
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/user/deleteUser.action?user_id=${rows.user_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/user/queryUser.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

