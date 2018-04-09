package com.dyyt.filter;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContextEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.dyyt.common.Constant;

public class ContextLoaderListenerOverWrite extends ContextLoaderListener {
	@Override
	/**
	 * @description 重写ContextLoaderListener的contextInitialized方法
	 */
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);
		/*
		ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
		//获取bean
		TEmployyeesService server = (TEmployyeesService) applicationContext.getBean("tEmployeesServiceImpl"); 
		String ip = server.selectIP();
		Constant.ServerIp = ip;
		//读取权限 server_flag 1 交易所 2会员
		Properties prop = new Properties();
		InputStream in = getClass().getResourceAsStream("/parameter.properties");
		try {
			prop.load(in);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String server_flag = prop.getProperty("server_flag");
		TMenuService menu = (TMenuService)applicationContext.getBean("tMenuServiceImpl"); 
		List<TMenu> tmenu = menu.getMenu(server_flag);
		List<TMenu> tPosition = menu.getPosition(server_flag);
		List<TMenuConstant> a = new ArrayList();
		int  next= 0;
		for(int i = 0 ;i<tPosition.size();i++)
		{
			int now = Integer.valueOf(tPosition.get(i).getCountp());
			TMenuConstant tmp = new TMenuConstant();
			tmp.setP(tPosition.get(i).getPosition());
			List newl = new ArrayList();
			for(int j = next;j<next+now;j++)
			{
				newl.add(tmenu.get(j));
			}
			tmp.setM(newl);
			a.add(tmp);
			next+=now;
		}
		Constant.Tmenu = a;	
		
		List<TMenu> show = menu.getShow(server_flag,Constant.show);
		Constant.Showmenu = show;
		Constant.server_flag = server_flag;
		*/
	}
	
	
}