<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin_no.js"></script>
		<script src="<%=path %>/content/js/jquery-1.8.2.min.js"></script>
		
		<script language="javascript">
            function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
		    }
            
            function closeOpen()
		    {
		         window.close();
		    }
            
		    function check1()
		    {
		    	var mail=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;  
	            var phone=/^1[34578]\d{9}$/; 
		        if($("#user_name").val().trim()=="")
		        {
		            alert("请输入用户名");
		            return;
		        }
		        if($("#user_pwd").val().trim()=="")
		        {
		            alert("请输入密码");
		            return;
		        }
		        if($("#user_pwd").val().length<6)
		        {
		            alert("密码长度不能小于6位");
		            return;
		        }
		        if($("#tel").val().trim().match(phone)==null)
		        {
		            alert("您的手机格式不正确");
		            return;
		        }
		        if($("#email").val().trim().match(mail)==null)
		        {
		            alert("您的邮箱格式不正确");
		            return;
		        }
		        
		        var params = $("form[id=form1]").serialize();
				$.ajax({
					async : true,
					cache : false,
					type : 'POST',
					data : params,
					dataType:"json",
					url : "<%=request.getContextPath() %>/index/addUser.action", //请求的action路径
					error : function() {//请求失败处理函数);
						alert("访问服务器失败");
					},
					success : function(json) { //请求成功后处理函数
						if(json.result == 300) {
							alert(json.reason);
						} else {
							window.location.href="<%=path%>/qiantai/logpage.jsp";
						}
					}
				});
		        
	//	        document.form1.submit();
		    }
		    
		    function check_userName(s)
		    {
		        if(s.trim()=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        else
		        {
		           document.getElementById("indicator").style.display="block";
		           loginService.jiance(s.trim(),callback)
		        }
		    }
		    
		    function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    if(data=="no")
			    {
			        alert("用户名被占用。请重新输入");
			        document.form1.userName.value="";
			    }
			    if(data=="yes")
			    {
			        alert("恭喜你。用户名可用");
			    }
			}
		    
		    
		    String.prototype.trim=function()
			{
			    return this.replace(/(^\s*)|(\s*$)/g,"");
			}

		    
        </script>
	</head>
	<body>
			<form action="" name="form1" id="form1">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<th height="40" colspan="2" bgcolor="#FFFFFF" class="f12b-red" style="font-size: 11px;">
							用 户 注 册
						</th>
					</tr>
					<tr>
						<td width="30%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							用户名：
						</td>
						<td width="70%" align="left" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="user_name" id="user_name" />
							<img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密 码：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="password" id="user_pwd" name="user_pwd"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							真实姓名：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" name="real_name"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							住址：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" name="addr"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="radio" name="sex" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							联系方式：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" id="tel" name="tel"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							E-mail：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" id="email" name="email"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							QQ：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" id="qq" name="qq"/>
						</td>
					</tr>
					<!-- 
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							头像：
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="text" name="fujian" id="fujian" size="30" readonly="readonly"/>
						    <input type="button" value="上传" onclick="up()"/>
						    <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
						</td>
					</tr>
					 -->
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF" align="left">
							&nbsp;
							<input type="button" value="确定" onclick="check1();"/>
						<!-- 	<input type="button" value="取消" onclick="closeOpen()"/> -->
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
