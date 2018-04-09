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
				<th style="width:20%">标题</th>
				<th style="width:50%">内容</th>
				<th style="width:10%">发布时间</th>
				<th style="width:10%">操作</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach items="${noticeBeans}" varStatus="status" var="rows">
			<tr id="tr_${rows.notice_id }" >
				<td style="width:10%">${status.index + 1 }</td>
				<td style="width:20%">${rows.notice_title }</td>
				<td style="width:50%">${rows.notice_content }</td>
				<td style="width:10%">${rows.create_date }</td>
				<td style="width:10%">
				<a href="javascript:openadd('<%=request.getContextPath() %>/notice/getNoticeBean.action?notice_id=${rows.notice_id }',200,'修改')" >修改</a> | 
				<a href="javascript:ajaxTodo('<%=request.getContextPath() %>/notice/deleteNotice.action?notice_id=${rows.notice_id }',returnPlan_del,'确认删除?')">删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div>
<form id="pagerForm"  action="<%=request.getContextPath() %>/notice/queryNotice.action"  method="post" onsubmit="return divSearch(this,'jbsxBox');">
<%@ include file="../../common/floor.jsp"%>
</form>
</div>
	

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

