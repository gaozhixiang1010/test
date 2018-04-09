 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="<%=path%>/css/layout.css" type="text/css" rel="stylesheet" />
		<script language="JavaScript" src="<%=path%>/js/public.js"
			type="text/javascript"></script>
		<script type="text/javascript">
	    </script>


		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css"
			media="all" />
		<link href="<%=path%>/css/slider.css" rel="stylesheet" type="text/css"
			media="all" />
		<script type="text/javascript" src="<%=path%>/js/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
		<script type="text/javascript" src="<%=path%>/js/easing.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery.nivo.slider.js"></script>
		<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>

	</head>

	<body>
	
 <jsp:include flush="true" page="/qiantai/inc/pagetop.jsp"></jsp:include> 




		<div class="main">
			<div class="wrap">
				<div class="content">
					<div class="content_top">
						<div class="heading">
							<h3>
								最新演唱会
							</h3>
						</div>
					</div>
					<div class="section group">

						<c:forEach items="${assetsBeans}" var="rows"
							varStatus="sta">
							<div class="grid_1_of_5 images_1_of_5">
								<!-- 
								<a href="<%=path%>/qchDetailQian.action?id=${rows.assets_id}"> <img
										src="<%=path%>/${qch.fujian}" /> </a>
								 -->
								<h2>
									<a href="<%=path%>/index/getAssetsBean.action?assets_id=${rows.assets_id}"
										title="${rows.assets_name}"> ${rows.assets_name} </a>
								</h2>
								<div class="price-details">
									<div class="price-number">
										<p>
											<span class="rupees">￥ ${rows.assets_price} </span>
										</p>
									</div>
									<div class="add-cart">
										<h4>
											<a href="<%=path%>/index/getAssetsBean.action?assets_id=${rows.assets_id}"> 详情</a>
										</h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="content_bottom">
						<div class="heading">
							<h3>
								热门演唱会
							</h3>
						</div>
					</div>
					<div class="section group">

						<!-- 
						<c:forEach items="${requestScope.qchListTop}" var="qch1"
							varStatus="sta1">

							<div class="grid_1_of_5 images_1_of_5">
								<a href="/qchDetailQian.action?id=${qch1.id}"> <img
										src="<%=path%>/${qch1.fujian}" /> </a>
								<h2>
									<a href="<%=path%>/qchDetailQian.action?id=${qch1.id}"
										title="${qch1.qcbh}"> ${qch1.qcbh} </a>
								</h2>
								<div class="price-details">
									<div class="price-number">
										<p>
											<span class="rupees">￥ ${qch1.qianshu} </span>
										</p>
									</div>
									<div class="add-cart">
										<h4>
											<a href="<%=path%>/qchDetailQian.action?id=${qch1.id}">
												详情</a>
										</h4>
									</div>
									<div class="clear"></div>
								</div>
							</div>

						</c:forEach>
						 -->

					</div>
				</div>
			</div>
		</div>


 
		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include> 

	</body>
</html>
