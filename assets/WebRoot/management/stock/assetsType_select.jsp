<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[	
	{"id":"","value":"请选择资产名称"}
	<c:if test="${!empty assetsTypeBeans}">
		<c:forEach items ="${assetsTypeBeans}" var="row">	
         	,{"id":"${row.type_id}","value":"${row.type_name}"}       	       
        </c:forEach>
	</c:if>
	
	
]