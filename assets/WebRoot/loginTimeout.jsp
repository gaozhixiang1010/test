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
		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title></title>
		<link rel="stylesheet" type="text/css" />
		<style>
		* {
			margin: 0;
			padding: 0
		}
		
		body {
			font-family: "微软雅黑";
			background: #DAD9D7
		}
		
		img {
			border: none
		}
		
		.cont {
			margin: 0 auto;
			width: 500px;
			line-height: 20px;
		}
		
		.c1 {
			height: 360px;
			text-align: center
		}
		
		.c1 .img1 {
			margin-top: 180px
		}
		
		.cont h2 {
			text-align: center;
			color: #555;
			font-size: 18px;
			font-weight: normal;
			height: 35px
		}
		
		</style>

	</head>
	<body>
		<div class="bg">
			<div class="cont">
				<div class="c1">
					<img src="<%=path%>/content/img/01.png" class="img1" />
				</div>
				<h2>
					连接超时，重新登录
				</h2>
				<!-- 
				<div class="c2">
					<a onclick="history.go(-1)" class="re">返回网站</a><a
						href="http://www.vxinfeng.com" class="home">网站首页</a><a
						href="http://www.vxinfeng.com" class="sr">搜索一下页面相关信息</a>
				</div>
				<div class="c3">
					<a href="http://www.vxinfeng.com" class="c3">微信封</a>提醒您 -
					您可能输入了错误的网址，或者该网页已删除或移动
				</div>
				 -->
			</div>
		</div>
	</body>
</html>