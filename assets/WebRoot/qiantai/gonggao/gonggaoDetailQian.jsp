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

								<div class="list pic_news">
									<div class="list_bar">
										&nbsp;公告详情
									</div>
									<div class="ctitle ctitle1">
										${noticeBean.notice_title}
									</div>
									<div class="ctitleinfo">
										${noticeBean.create_date }
										&nbsp;&nbsp;&nbsp;
										<%--查看次数：5 次--%>
									</div>
									<div class="pbox">
										${noticeBean.notice_content }
									</div>
									<div class="page_no">
										<div class="pg-3">
											<%--分页--%>
										</div>
									</div>
									<div class="arti_ref">
										<%--【上一篇】: <a href="#" title="">应需而生 长安铃木全新天语SX4突破升级</a>
				                &nbsp;&nbsp;
				                 【下一篇】: <span>没有了</span>--%>
									</div>
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

