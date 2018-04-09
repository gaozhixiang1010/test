<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme() + "://"
   + request.getServerName() + ":" + request.getServerPort()
   + path + "/";
%>
<!doctype html>
<html>
 <head>
 <!--window.top.location.href="<%=basePath%>index.jsp";-->
  <script type="text/javascript">
		window.top.location.href="<%=basePath%>/qiantai/default.jsp";
  </script>
 </head>
</html>
