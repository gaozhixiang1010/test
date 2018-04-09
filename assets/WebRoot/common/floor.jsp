<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="<%=request.getContextPath()%>/content/js/jquery.twbsPagination.js"></script> -->
<script type="text/javascript">
$(document).ready(function () {
    $('#pagination-demo-v1_0').twbsPagination({
        totalPages: ${page.totalPage},
        startPage: ${page.pageNum},
        version: '1.0'
    });
});
function doChange() {
	$('#pageNum').val('1');
	$('#numPerPage').val($('#aaa').val());
	$('#pagerForm').submit();
}
</script>
<input type="hidden" name="pageNum" id="pageNum" value="${page.pageNum}" />
<input type="hidden" name="numPerPage" id="numPerPage" value="${page.numPerPage}"/>
<div class="panelBar">
	<div class="pages">
		<span>每页</span>
		<select id = "aaa" onchange="doChange()">
			<c:if test="${page.numPerPage == '' || page.numPerPage == null}">
			<option value="10" selected>10</option>
			<option value="20" >20</option>
			<option value="50" >50</option>
			<option value="100" >100</option>
			</c:if>
			<c:if test="${page.numPerPage == 10}">
				<option value="10" selected>10</option>
				<option value="20" >20</option>
				<option value="50" >50</option>
				<option value="100" >100</option>
			</c:if>
			<c:if test="${page.numPerPage == 20}">
				<option value="10" >10</option>
				<option value="20" selected>20</option>
				<option value="50" >50</option>
				<option value="100" >100</option>
			</c:if>
			<c:if test="${page.numPerPage == 50}">
				<option value="10" >10</option>
				<option value="20" >20</option>
				<option value="50" selected>50</option>
				<option value="100" >100</option>
			</c:if>
			<c:if test="${page.numPerPage == 100}">
				<option value="10" >10</option>
				<option value="20" >20</option>
				<option value="50" >50</option>
				<option value="100" selected>100</option>
			</c:if>				
		</select>
		<c:if test="${page.totalCount == '' || page.totalCount == null}">
		<span>条，共 0 条</span>
		</c:if>
		<c:if test="${page.totalCount != '' && page.totalCount != null}">
		<span>条，共 ${page.totalCount} 条</span>
		</c:if>
	</div>
	<div class="text-right">
        <ul id="pagination-demo-v1_0" class="pagination-sm"></ul>
    </div>
    <!-- 
	<div class="pagination" rel="jbsxBox" targetType="navTab" totalCount="${page.totalCount}" numPerPage="${page.numPerPage}" pageNumShown="5" currentPage="${page.pageNum}">
	</div>
	 -->
</div>
