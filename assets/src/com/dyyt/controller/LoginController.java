/**
 * Copyright：Copyright (c)  2014
 * Company：龙门科技
 * @author 高志祥
 * 2014-06-11
 *@version  1.0
 */
package com.dyyt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dyyt.model.TUser;
import com.dyyt.service.TUserService;
/**
 * <pre>登录控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/login/*")
public class LoginController {
	/**
	 * 业务逻辑实现类注入
	 * tUserServiceImpl
	 */
	@Autowired
	@Qualifier("tUserServiceImpl")
	private TUserService userService;
	/**
	 * 登录信息验证,并获取会员信息
	 * @throws Exception 
	 * @throws Exception 
	 */
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request,TUser userBean) {
		if(!"admin".equals(userBean.getUser_name())) {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "登录失败");
			return "common/ajax";
		}
		TUser user = userService.login(userBean);
		if(user != null ){
			request.getSession().setAttribute("user_id", user.getUser_id());
			request.getSession().setAttribute("real_name", user.getReal_name());
			request.setAttribute("result", 200);
			request.setAttribute("reason", "登录成功");
		}else{
			request.setAttribute("result", 300);
			request.setAttribute("reason", "登录失败");
		}
		return "common/ajax";
	}
	
	/**
	 * 退出系统，清掉session记录
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/loginOut")
	public String loginOut(HttpServletRequest request) {
		request.getSession().invalidate();
		return "session";
	}
}
