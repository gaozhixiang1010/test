<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>演唱会门票销售系统的设计与实现 - 后台管理系统登录</title>
		<link href="<%=path %>/management/css/style.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=path %>/management/js/jquery.js"></script>
		<script src="<%=path %>/management/js/cloud.js" type="text/javascript"></script>
		<script src="<%=path %>/content/js/jquery-1.8.2.min.js"></script>
		<script language="javascript">
		$(function(){
		    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
			$(window).resize(function(){  
		    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		    })  
		});  
		</script>
	</head>
	<body style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
		<div id="mainBody">
			<div id="cloud1" class="cloud"></div>
			<div id="cloud2" class="cloud"></div>
		</div>
		<div class="loginbody">
			<span class="systemlogo"></span>
			<div class="loginbox">
			<form id="loginForm">
				<ul>
					<li>
						<input name="user_name" type="text" class="loginuser" value=""
							onclick="JavaScript:this.value=''" />
					</li>
					<li>
						<input name="user_pwd" type="password" class="loginpwd" value=""
							onclick="JavaScript:this.value=''" />
					</li>
					<li>
						<input name="" type="button" class="loginbtn" value="登录"
							onclick="login();" />
						<span id="errorMsg" style="color: red;"></span>
					</li>
				</ul>
			</form>
			</div>
		</div>
		<div class="loginbm">
			版权所有 2016
			<a href="http://www.lmfuhuaqi.com">www.lmfuhuaqi.com</a> 龙门集团固定资产管理系统
		</div>
		<script type="text/javascript">
		function login() {
			var params = $("form[id=loginForm]").serialize();
				$.ajax({
				async : true,
				cache : false,
				type : 'POST',
				data : params,
				dataType:"json",
				url : "<%=request.getContextPath() %>/login/login.action", //请求的action路径
				error : function() {//请求失败处理函数);
					alert("访问服务器失败");
				},
				success : function(json) { //请求成功后处理函数
					if(json.result == 300) {
						$("#errorMsg").html(json.reason);
					} else {
						window.location = "<%=path %>/management/main.jsp";
					}
				}
			});
		}
		</script>
	</body>
</html>