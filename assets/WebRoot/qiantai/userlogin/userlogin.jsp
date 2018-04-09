<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script src="<%=path %>/content/js/jquery-1.8.2.min.js"></script>
	
	<script type="text/javascript">
	        function reg()
	        {
	                var url="<%=path %>/qiantai/regpage.jsp";
	                window.location.href=url;
	        }
	        function login() {
	        	if($("#user_name").val() == "") {
	        		alert("请输入用户名");
		            return;
	        	}
	        	if($("#user_pwd").val() == "") {
	        		alert("请输入密码");
		            return;
	        	}
				var params = $("form[id=loginForm]").serialize();
				$.ajax({
					async : true,
					cache : false,
					type : 'POST',
					data : params,
					dataType:"json",
					url : "<%=request.getContextPath() %>/index/login.action", //请求的action路径
					error : function() {//请求失败处理函数);
						alert("访问服务器失败");
					},
					success : function(json) { //请求成功后处理函数
						if(json.result == 300) {
							alert(json.reason);
						} else {
							window.location = "<%=path %>/qiantai/default.jsp";
						//	window.location.reload();
						}
					}
				});
			}
	        
	</script>
  </head>
  
  <body>
        <c:if test="${sessionUser == null}">
		<form id="loginForm" method="POST" action="">
		      <table cellspacing="10" cellpadding="0" width="98%" align="center" border="0">
		          <tr>
		            <td align="center" colspan="2" height="10"></td>
		          </tr>
		          <tr>
		            <td align="right" width="31%" height="30" style="font-size: 11px;">用户名：</td>
		            <td align="left" width="69%"><input class="input" id="user_name" title="用户名不能为空" size="14" name="user_name" type="text" /></td>
		          </tr>
		          <tr>
		            <td align="right" height="30" style="font-size: 11px;">密　码：</td>
		            <td align="left"><input class="input" id="user_pwd" title="密码不能为空" type="password" size="16" name="user_pwd"/></td>
		          </tr>
		          <tr>
		            <td align="center" colspan="2" height="10"><font color="red"><s:property value="#request.error"/></font></td>
		          </tr>
		          <tr>
		           <td align="right" height="30" style="font-size: 11px;"> 
		               <input type="button" value="登  录" onclick="login()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
					</td>
		            <td align="left">
					   <input type="button" value="注  册" onclick="reg()" style="border:#ccc 1px solid; background-color:#FFFFFF; font-size:12px; padding-top:3px;" />
		               <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
		            </td>
		          </tr>
		      </table>
	    </form>
	    </c:if>
	    <c:if test="${sessionUser != null}">
	        <br/>
		     欢迎您：${sessionUser.user_name } &nbsp;&nbsp;
		    <a href="<%=path %>/login/loginOut.action">安全退出</a> &nbsp;&nbsp;
		    <br/><br/><br/>
		</c:if>
  </body>
</html>
