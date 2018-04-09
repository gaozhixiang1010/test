
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
		<script type="text/javascript"
			src="<%=path%>/js/jquery.nivo.slider.js"></script>
		<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
        <script type="text/javascript">
	        function yuding(assets_id)
	        {
	        	if(${sessionUser == null}) {
	        		alert("请先登录");
	        	} else {
	        		$.ajax({
						async : true,
						cache : false,
						type : 'POST',
						dataType:"json",
						url : "<%=request.getContextPath() %>/index/addOrder.action?assets_id="+assets_id, //请求的action路径
						error : function() {//请求失败处理函数);
							alert("访问服务器失败");
						},
						success : function(json) { //请求成功后处理函数
							if(json.result == 300) {
								alert(json.reason);
							} else {
								alert(json.reason);
							}
						}
					});
	        	}
	        } 
	        
	        function pinglunAll(id)
	        {
	            var url="<%=path %>/pinglunAll.action?qchId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:650,height:450});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","评论");
	            pop.build();
	            pop.show();
	        }
       
	       function pinglunAdd(id)
	       {
	            var url="<%=path %>/qiantai/qch/pinglunAdd.jsp?qchId="+id;
	            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:700,height:400});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","写评论");
	            pop.build();
	            pop.show();
	       }
	       
	       function back()
	       {
	           window.history.back();
	       }
	    </script>

	</head>

	<body>
		<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>

		<div class="main">
			<div class="wrap">
				<div class="header_bottom">
					<div class="header_bottom_left">
						<div class="left_row">
							<div class="list">
								<div class="list_bar">
									用户中心
								</div>
								<div class="list_content">
									<div id="div">
										<jsp:include flush="true"
											page="/qiantai/userlogin/userlogin.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
						<div class="categories">
							<h3>
								演唱会公告
							</h3>
							<c:forEach items="${assetsTypeBeans}" var="rows">

							<li>
								<a href="<%=path %>/index/getAssetsByType.action?type_id=${rows.type_id}">${rows.type_name}</a>
							</li>
						</c:forEach>
						</div>
					</div>
					<div class="header_bottom_right">

						<div class="left_row">
							<div class="list">





								<div class="list_bar">
									演唱会门票详细介绍
								</div>
								<div id="tw" class="list_content" style="line-height:26px;">
									<table width="100%" border="0" cellpadding="9" cellspacing="9">

										<tr>
											<td align="left" style="line-height:26px;">
												演唱会门票名称：${assetsBean.assets_name }
											</td>
										</tr>
										<!-- 
										<tr>
											<td align="left" style="line-height:26px;">
												<img src="<%=path%>/${requestScope.qch.fujian }"
													width="260" />
											</td>
										</tr>
										 -->
										<tr>
											<td align="left" style="line-height:26px;">
												门票品牌：${assetsBean.pinpai }
											</td>
										</tr>
										<tr>
											<td align="left" style="line-height:26px;">
												介绍：${assetsBean.assets_desc }
											</td>
										</tr>
										<tr>
											<td align="left" style="line-height:26px;">
												演唱会门票价格：${assetsBean.assets_price } 元
											</td>
										</tr>
										<!-- 
										<tr>
											<td align="left" style="line-height:26px;">
												<a href="javascript:void(0);" style="color: red"
													onclick="pinglunAll(${assetsBean.assets_id })">评论</a> &nbsp;
												<a href="javascript:void(0);" style="color: red"
													onclick="pinglunAdd(${assetsBean.assets_id })">我要评论</a>
											</td>
										</tr>
										 -->
										<tr>
											<td align="center">
												<a href="javascript:void(0);" onclick="yuding(${assetsBean.assets_id })"><img
														src="<%=path%>/img/yuding.jpg" width="80" height="35" />
												</a> &nbsp;&nbsp;
												<a href="javascript:void(0);" onclick="back();"><img
														src="<%=path%>/img/123.jpg" width="80" height="35" />
												</a>
											</td>
										</tr>
									</table>
								</div>


							</div>
						</div>
					</div>

				</div>
				<div class="clear"></div>

			</div>

		</div>



		<jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>

	</body>
</html>

