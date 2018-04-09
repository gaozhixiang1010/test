/**
 * Copyright：Copyright (c)  2014
 * Company：龙门科技
 * @author 高志祥
 * 2014-06-11
 *@version  1.0
 */
package com.dyyt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dyyt.common.PageParameter;
import com.dyyt.model.TAssetsParentType;
import com.dyyt.model.TAssetsType;
import com.dyyt.model.TForum;
import com.dyyt.model.TNotice;
import com.dyyt.model.TOrder;
import com.dyyt.model.TUser;
import com.dyyt.service.TAssetsTypeService;
import com.dyyt.service.TForumService;
import com.dyyt.service.TNoticeService;
import com.dyyt.service.TOrderService;
import com.dyyt.service.TUserService;
/**
 * <pre>论坛控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/forum/*")
public class ForumController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tForumServiceImpl")
	private TForumService forumService;
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		return "management/forum/forum_operate";
	}
	
	/**
	 * 查询资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryForum")
	public String queryForum(HttpServletRequest request,TForum forumBean,PageParameter page) {
		forumBean.setClass(page);
		List<TForum> forumBeans = new ArrayList();
		forumBeans = forumService.queryForum(forumBean);
		page = forumBean.getClass(forumBeans);
		request.setAttribute("forumBeans", forumBeans);
		request.setAttribute("forumBean", forumBean);
		request.setAttribute("page", page);
		return "management/forum/forum_query";
	}
	
	
	/**
	 * 根据ID删除资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteForum")
	public String deleteForum(HttpServletRequest request) {
		String forum_id = request.getParameter("forum_id");
		boolean b = forumService.deleteForum(forum_id);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "删除成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "删除失败");
		}
		return "common/ajax";
	}
}
