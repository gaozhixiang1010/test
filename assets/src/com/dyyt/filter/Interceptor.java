/**
 * 
 */
package com.dyyt.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import com.dyyt.common.Context;

public class Interceptor implements Filter  {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	
	/*
	private static TServerService sever ;
	public static TServerService getSever() {
		return sever;
	}

	public static void setSever(TServerService sever) {
		Interceptor.sever = sever;
	}
	*/

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		/*
		HttpServletRequest servletRequest = (HttpServletRequest) arg0;
		System.out.println("servletRequest.getRequestURL().toString()------>"+servletRequest.getRequestURL().toString());
		if(servletRequest.getRequestURL().toString().indexOf("/dyyt/story/selectStory1.action")>0)
		{
			arg2.doFilter(arg0, arg1);
			return ;
		}
		if(servletRequest.getRequestURL().toString().indexOf(".action")>0)
		{
			arg2.doFilter(arg0, arg1);
			return ;
		}
		HttpServletResponse httpResponse = (HttpServletResponse) arg1;  
		String login_flag = servletRequest.getSession().getAttribute("login_flag")==null?"":servletRequest.getSession().getAttribute("login_flag").toString();//直接登录服务器 flag 为 1 ，通过服务器交互登录 flag 为 2
		System.out.println("login_flag---------------->"+login_flag);
		if(login_flag.equals("2"))
		{
			arg2.doFilter(arg0, arg1);
			return ;
		}
		String ip = arg0.getRemoteAddr();//获取客户端ip
		System.out.println("ip---------------->"+ip);
		TServer m = new TServer();
		m.setIp(ip);
		TServer s = sever.getCount(m);
		if(s==null)
		{
			System.out.println("--------------------------->is null");
			httpResponse.sendRedirect(servletRequest.getContextPath()+"/loginFlagError.jsp");  
			return ;
		}	
		servletRequest.getSession().setAttribute("member_id", s.getMember_id());
		servletRequest.getSession().setAttribute("login_flag", "2"); //直接登录服务器 flag 为 1 ，通过服务器交互登录 flag 为 2
		servletRequest.getSession().setAttribute("authority", "2");	//2 会
		
		arg2.doFilter(arg0, arg1);
		*/
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}


}
