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
	</head>

	<body>
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<s:iterator value="#request.gonggaoList" id="gonggao">
				<tr>
					<td height="28" id="roll-line-1607838439" width="100%">
						<div class="" style="padding: 2px 0px;">
							<div class="f-left">
								<img src="<%=path%>/img/head-mark3.gif" align="middle"
									class="img-vm" border="0" />
								<a
									href="<%=path%>/gonggaoDetailQian.action?gonggaoId=<s:property value="#gonggao.gonggaoId"/>"
									title=""><span style=""><s:property
											value="#gonggao.gonggaoTitle" />…</span>
								</a>
							</div>
							<div class="clear"></div>
						</div>
					</td>
				</tr>
			</s:iterator>
		</table>
	</body>
</html>
