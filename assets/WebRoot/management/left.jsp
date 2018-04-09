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
<title>无标题文档</title>
<link href="<%=path %>/management/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="<%=path %>/management/js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>演唱会门票销售系统</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title"><span><img src="<%=path %>/management/images/leftico02.png" /></span>演唱会门票信息管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/assets_type/operate.action" target="rightFrame">演唱会门票信息类型</a><i></i></li>
        <li><cite></cite><a href="<%=path %>/assets/operate.action" target="rightFrame">演唱会门票信息管理</a><i></i></li>
        </ul>     
    </dd> 
    <dd>
    <div class="title"><span><img src="<%=path %>/management/images/leftico02.png" /></span>公告信息</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/notice/operate.action" target="rightFrame">公告信息管理</a><i></i></li>
        </ul>     
    </dd> 
    <dd>
    <div class="title"><span><img src="<%=path %>/management/images/leftico02.png" /></span>会员信息</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/user/operate.action" target="rightFrame">会员信息管理</a><i></i></li>
        </ul>     
    </dd> 
    <dd>
    <div class="title"><span><img src="<%=path %>/management/images/leftico02.png" /></span>订单管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/order/operate.action" target="rightFrame">订单管理</a><i></i></li>
        </ul>     
    </dd> 
    <dd>
    <div class="title"><span><img src="<%=path %>/management/images/leftico02.png" /></span>论坛</div>
    <ul class="menuson">
        <li><cite></cite><a href="<%=path %>/forum/operate.action" target="rightFrame">论坛管理</a><i></i></li>
        </ul>     
    </dd> 
    
    </dl>
    
</body>
</html>
