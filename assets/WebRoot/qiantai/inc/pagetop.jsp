<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<%
	String path1 = request.getContextPath();
%>
<script type="text/javascript" src="<%=path1%>/js/public.js"></script>
<script type="text/javascript">
         function myxinxi(){
                <c:if test="${sessionScope.userType!=1}">
	               alert("请先登录");
	            </c:if>
	            <c:if test="${sessionScope.userType==1}">
	                var url="/qiantai/userinfo/userXinxi.jsp";
	              
	              
	                window.location.href="<%=path1%>/myYudingMana.action"; 
	            </c:if>
         }
         function liuyanAll(){
        	 if(${sessionUser == null}) {
        		 alert("请先登录");
        	 } else {
        		 var targetWinUrl="<%=path1%>/index/queryForum.action";
 				 var targetWinName="newWin";
 				 var features="width=700,height=800,toolbar=no, top=0, left=0, menubar=no, scrollbars=no, resizable=no,location=no, status=no"
 				 var new_win=window.open(targetWinUrl,targetWinName,features);
        	 }
         }
         
     
         
         function myzl(){
        	 if(${sessionUser == null}) {
        		 alert("请先登录");
        	 } else {
        		 window.location.href="<%=path1%>/index/myOrder.action";
        	 }
         }         
     </script>
<div class="header">
	<div class="headertop_desc">
		<div class="wrap">
			<div class="nav_list">
				<ul>
					<li>
						<A href="<%=path1%>/qiantai/default.jsp">首页</A>
					</li>
					<li>
						<A href="<%=path1%>/qiantai/userpage.jsp"> 会员中心</A>
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
						<A href="<%=path1%>/qiantai/regpage.jsp"> 会员注册</A>
					</li>
					<li>
						<A href="<%=path1%>/qiantai/logpage.jsp"> 会员登录</A>
					</li>
					<li>
						<a target="_blank" href="<%=path1%>/management/login.jsp">管理登录</a>
					</li>


				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="wrap">
		<div class="header_top">
			<div class="logo">
				<A href="<%=path1%>/qiantai/default.jsp"><img
						src="<%=path1%>/images/logo.png" alt="" /> </a>
			</div>
			<!-- 
			<div class="header_top_right">
			 
				<div class="search_box">
					 <form id="searchForm" action="<%=path1 %>/qchByKeySearch.action" method="post">
		
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
			<div class="header_bottom_left">
				<div class="categories">
					<ul>
						<h3>
							演唱会分类
						</h3>
						<c:forEach items="${assetsTypeBeans}" var="rows">

							<li>
								<a href="<%=path1%>/index/getAssetsByType.action?type_id=${rows.type_id}">${rows.type_name}</a>
							</li>
						</c:forEach>

					</ul>
				</div>

				<!-- 右边的用户登录。留言。投票 -->

				<div class="categories">
					<h3>
						演唱会公告
					</h3>
					<c:forEach items="${noticeBeans}" var="rows">
						<li>
							<a href="<%=path1%>/index/getNoticeBean.action?notice_id=${rows.notice_id}">${rows.notice_title}</a>
						</li>
					</c:forEach>
				</div>
				<!-- 右边的用户登录。留言。投票 -->

			</div>
			<div class="header_bottom_right">
				<!------ Slider ------------>
				<div class="slider">
					<div class="slider-wrapper theme-default">
						<div id="slider" class="nivoSlider">
							<img src="<%=path1%>/images/1.jpg" data-thumb="images/1.jpg"
								alt="" />
							<img src="<%=path1%>/images/2.jpg" data-thumb="images/2.jpg"
								alt="" />
							<img src="<%=path1%>/images/3.jpg" data-thumb="images/3.jpg"
								alt="" />
							<img src="<%=path1%>/images/4.jpg" data-thumb="images/4.jpg"
								alt="" />
							<img src="<%=path1%>/images/5.jpg" data-thumb="images/5.jpg"
								alt="" />
						</div>
					</div>
				</div>


				<!------End Slider ------------>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>