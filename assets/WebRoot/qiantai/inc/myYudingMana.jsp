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
	    function yudingDel(order_id) {
	    	$.ajax({
				async : true,
				cache : false,
				type : 'POST',
				dataType:"json",
				url : "<%=request.getContextPath() %>/index/deleteOrder.action?order_id="+order_id, //请求的action路径
				error : function() {//请求失败处理函数);
					alert("访问服务器失败");
				},
				success : function(json) { //请求成功后处理函数
					if(json.result == 300) {
						alert(json.reason)
					} else {
						window.location.href="<%=path%>/index/myOrder.action";
					}
				}
			});
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
							<c:forEach items="${noticeBeans}" var="rows">
								<li>
									<a href="<%=path %>/index/getNoticeBean.action?notice_id=${rows.notice_id}">${rows.notice_title}</a>
								</li>
							</c:forEach>
						</div>
					</div>
					<div class="header_bottom_right">

						<div class="left_row">
							<div class="list">

								<!--新入博主  -->
								<div class="list_bar">
									我购买的产品
								</div>
								<div id="tw" class="list_content">
									<table width="98%" border="0" cellpadding="2" cellspacing="1"
										bgcolor="#2c9a29" align="center" style="margin-top: 8px">
										<tr bgcolor="#abe1a9">
											<td height="30" colspan="5"
												background="<%=path%>/img/tbg.gif">
												&nbsp;我产品销售的产品管理&nbsp;
											</td>
										</tr>
										<tr align="center" bgcolor="#FAFAF1">
											<td width="20%" height="30">
												产品名称
											</td>
											<td width="20%">
												购买数量
											</td>
											<td width="20%">
												联系方式
											</td>
											<td width="20%">
												产品购买时间
											</td>
											<td width="10%">
												操作
											</td>
										</tr>
										<c:forEach items="${orderBeans}" var="rows">
											<tr align='center' bgcolor="#FFFFFF"
												onMouseMove="javascript:this.bgColor='red';"
												onMouseOut="javascript:this.bgColor='#FFFFFF';" height="30">
												<td bgcolor="#FFFFFF" align="center" height="30">
													${rows.assets_name }
												</td>
												<td bgcolor="#FFFFFF" align="center">
													${rows.num }
												</td>
												<td bgcolor="#FFFFFF" align="center">
													${rows.tel }
												</td>
												<td bgcolor="#FFFFFF" align="center">
													${rows.create_date }
												</td>
												<td bgcolor="#FFFFFF" align="center">
													<a style="color: red" href="#"
														onclick="yudingDel(${rows.order_id})"
														class="pn-loperator">删除订单</a>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<!-- 新入博主 -->

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





