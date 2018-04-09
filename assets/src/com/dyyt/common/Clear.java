package com.dyyt.common;

import javax.servlet.http.HttpServletRequest;

public class Clear {
	public static void clearAll(HttpServletRequest request)
	{
//		request.getSession().setAttribute("client_ip", null);
//		request.getSession().setAttribute("login_id", null);
//		request.getSession().setAttribute("member_id", null);
//		request.getSession().setAttribute("login_flag", null); //直接登录服务器 flag 为 1 ，通过服务器交互登录 flag 为 2	
//		request.getSession().setAttribute("hy_sql",null);
//		request.getSession().setAttribute("jg_sql",null);
//		request.getSession().setAttribute("jj_sql",null);
//		request.getSession().setAttribute("qd_sql",null);
//		request.getSession().setAttribute("zd_sql",null);
//		request.getSession().setAttribute("hy_objectid",null);
//		request.getSession().setAttribute("jg_objectid",null);
//		request.getSession().setAttribute("jj_objectid",null);
//		request.getSession().setAttribute("qd_objectid",null);
//		request.getSession().setAttribute("zd_objectid",null);
		request.getSession().invalidate();
	}
}
