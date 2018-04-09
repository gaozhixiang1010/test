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
	    function check() {
	    	if($("#title").val == "") {
	    		alert("标题不能为空");
	    		return;
	    	}
	    	var params = $("form[id=form1]").serialize();
			$.ajax({
				async : true,
				cache : false,
				type : 'POST',
				data : params,
				dataType:"json",
				url : "<%=request.getContextPath() %>/index/addForum.action", //请求的action路径
				error : function() {//请求失败处理函数);
					alert("访问服务器失败");
				},
				success : function(json) { //请求成功后处理函数
					if(json.result == 300) {
						alert(json.reason);
					} else {
						window.location = "<%=path %>/index/queryForum.action";
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


								<TABLE cellSpacing=1 cellPadding=4 width="100%" border=0>
									<c:forEach items="${forumBeans}" var="rows">
										<TR>
											<TD>
												<TABLE class=tpt width="100%" border=0>
													<TBODY>
														<TR bgColor=#cccccc>
															<TD align=middle width="10%">
																<STRONG>留言人：</STRONG>
															</TD>
															<TD width="47%">
																<FONT color=#000000>&nbsp;${rows.user_name }
																</FONT>
															</TD>
															<TD align=middle width="14%">
																<STRONG>留言时间：</STRONG>
															</TD>
															<TD width="29%">
																<FONT color=#000000>&nbsp;${rows.create_date }
																</FONT>
															</TD>
														</TR>
														<TR>
															<TD align=middle>
																<STRONG>标题：</STRONG>
															</TD>
															<TD colSpan=3>
																<FONT color=#000000>&nbsp;${rows.title }
																</FONT>
															</TD>
														</TR>
														<TR>
															<TD vAlign=top align=middle>
																<STRONG>内容：</STRONG>
															</TD>
															<TD colSpan=3>
																${rows.content }
															</TD>
														</TR>
													</TBODY>
												</TABLE>
											</TD>
										</TR>
									</c:forEach>
								</TABLE>
								<BR>
								<form action="" id="form1" >
									<table border="0">
										<tr>
											<td style="font-size: 11px;">
												标题
											</td>
											<td>
												<input type="text" name="title" id="title" size="50" />
											</td>
										</tr>
										<tr>
											<td style="font-size: 11px;">
												内容
											</td>
											<td>
												<textarea cols="50" rows="3" name="content" size="4" style="width: 415px;"></textarea>
											</td>
										</tr>
										<tr>
											<td style="font-size: 11px;">
												&nbsp;
											</td>
											<td>
												<input type="button" name="" value="提交留言" onclick="check();">
											</td>
										</tr>
									</table>
								</form>



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

