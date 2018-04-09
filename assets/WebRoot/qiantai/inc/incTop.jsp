<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%
	String path2 = request.getContextPath();
%>
<script type="text/javascript" src="<%=path2%>/js/public.js"></script>
<script type="text/javascript">
         function myxinxi(){
                <c:if test="${sessionScope.userType!=1}">
	               alert("请先登录");
	               location.href='<%=path2%>/qiantai/logpage.jsp';
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
	                var url="<%=path2%>/qiantai/userinfo/userXinxi.jsp";
	                var n="";
	                var w="480px";
	                var h="500px";
	                var s="resizable:no;help:no;status:no;scroll:yes";
				    openWin(url,n,w,h,s);
	            </c:if>
         }
         function liuyanAll(){
        	 if(${sessionUser == null}) {
        		 alert("请先登录");
        	 } else {
        		 var targetWinUrl="<%=path2 %>/index/queryForum.action";
 				 var targetWinName="newWin";
 				 var features="width=700,height=800,toolbar=no, top=0, left=0, menubar=no, scrollbars=no, resizable=no,location=no, status=no"
 				 var new_win=window.open(targetWinUrl,targetWinName,features);
        	 }
         }
         
         function reg(){
                var url="<%=path2%>/qiantai/userinfo/userReg.jsp";
                var n="";
                var w="480px";
                var h="500px";
                var s="resizable:no;help:no;status:no;scroll:yes";
			    openWin(url,n,w,h,s);
         }
         
         function myzl(){
        	 if(${sessionUser == null}) {
        		 alert("请先登录");
        	 } else {
        		 window.location.href="<%=path2%>/index/myOrder.action";
        	 }
         }         
     </script>
<div class="header">
	<div class="headertop_desc">
		<div class="wrap">
			<div class="nav_list">
				<ul>
					<li>
						<A href="<%=path2%>/qiantai/default.jsp">首页</A>
					</li>
					<li>
						<A href="<%=path2%>/qiantai/userpage.jsp"> 会员中心</A>
					</li>
					<li>
						<A href="#" onclick="myzl()">订单管理</A>
					</li>
					<li>
						<A href="#" onclick="liuyanAll()">网站论坛</A>
					</li>
				</ul>
			</div>
			<div class="account_desc">
				<ul>

					<li>
						<A href="<%=path2%>/qiantai/regpage.jsp"> 会员注册</A>
					</li>
					<li>
						<A href="<%=path2%>/qiantai/logpage.jsp"> 会员登录</A>
					</li>
					<li>
						<a target="_blank" href="<%=path2%>/management/login.jsp">管理登录</a>
					</li>


				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="wrap">
		<div class="header_top">
			<div class="logo">
				<A href="<%=path2%>/qiantai/default.jsp"><img
						src="<%=path2%>/images/logo.png" alt="" /> </a>
			</div>
			<!-- 
			<div class="header_top_right">
			 
				<div class="search_box">
				
					<form id="searchForm" action="<%=path2 %>/qchByKeySearch.action" method="post">
		
						<input name="qcbh"  type="text" value="Search" onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = 'Search';}">
						<input type="submit" value="">
						 
				
					</form>
				</div>
				<div class="clear"></div>
			</div>
	 		 -->
			<div class="clear"></div>
		</div>
		 <div class="header_bottom">
		 
				<!------ Slider ------------>
				<div class="slider">
					<div class="slider-wrapper theme-default">
						<div id="slider" class="nivoSlider">
							<img src="<%=path2%>/images/1-1.jpg" data-thumb="images/1-1.jpg"
								alt="" />
							<img src="<%=path2%>/images/2-1.jpg" data-thumb="images/2-1.jpg"
								alt="" />
							<img src="<%=path2%>/images/3-1.jpg" data-thumb="images/3-1.jpg"
								alt="" />
							<img src="<%=path2%>/images/4-1.jpg" data-thumb="images/4-1.jpg"
								alt="" />
							<img src="<%=path2%>/images/5-1.jpg" data-thumb="images/5-1.jpg"
								alt="" />
						</div>
					</div>
				</div>

 
			<div class="clear"></div>
		</div>
	</div>
</div>