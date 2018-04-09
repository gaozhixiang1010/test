<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 


<div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
			 
			</div>
			 <div class="copy_right">
				<p>Copyright &copy;  演唱会门票销售系统的设计与实现  </p>
		   </div>			
        </div>
    </div>
    
     <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>