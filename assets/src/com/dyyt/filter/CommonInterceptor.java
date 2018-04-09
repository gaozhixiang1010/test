package com.dyyt.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class CommonInterceptor implements HandlerInterceptor {

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String url = arg0.getRequestURL().toString();
		String path = url.substring(url.lastIndexOf("/"));
		System.out.println("path======"+path);
		if(path.indexOf(".action") != -1 || path.indexOf(".jsp") != -1) {
			if(arg0.getSession(false) == null) {
				arg0.getRequestDispatcher("/session.jsp").forward(arg0, arg1); 
				return false;
			}
		}
		return true;
	}
	
}
