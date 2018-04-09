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
import com.dyyt.model.TAssets;
import com.dyyt.model.TAssetsParentType;
import com.dyyt.model.TAssetsType;
import com.dyyt.model.TForum;
import com.dyyt.model.TNotice;
import com.dyyt.model.TOrder;
import com.dyyt.model.TUser;
import com.dyyt.service.TAssetsService;
import com.dyyt.service.TAssetsTypeService;
import com.dyyt.service.TForumService;
import com.dyyt.service.TNoticeService;
import com.dyyt.service.TOrderService;
import com.dyyt.service.TUserService;
/**
 * <pre>资产类型控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/index/*")
public class IndexController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tAssetsTypeServiceImpl")
	private TAssetsTypeService assetsTypeService;//演唱会类型
	@Autowired
	@Qualifier("tAssetsServiceImpl")
	private TAssetsService assetsService;//演唱会
	@Autowired
	@Qualifier("tUserServiceImpl")
	private TUserService userService;//会员
	@Autowired
	@Qualifier("tNoticeServiceImpl")
	private TNoticeService noticeService;//公告
	@Autowired
	@Qualifier("tOrderServiceImpl")
	private TOrderService orderService;//订单
	@Autowired
	@Qualifier("tForumServiceImpl")
	private TForumService forumService;//论坛
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/index")
	public String index(HttpServletRequest request,TAssets assetsBean) {
		List<TAssets> assetsBeans = assetsService.getAssets(assetsBean);
		request.setAttribute("assetsBeans", assetsBeans);//演唱会
		List<TAssetsType> assetsTypeBeans = assetsTypeService.queryAssetsType();
		request.setAttribute("assetsTypeBeans", assetsTypeBeans);//演唱会类型
		List<TNotice> noticeBeans = noticeService.queryNotice();
		request.getSession().setAttribute("noticeBeans", noticeBeans);
		return "qiantai/index";
	}
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request,TUser userBean) {
		if("admin".equals(userBean.getUser_name())) {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "登录失败");
			return "common/ajax";
		}
		TUser user = userService.login(userBean);
		if(user != null ){
			request.getSession().setAttribute("sessionUser", user);
			request.setAttribute("result", 200);
			request.setAttribute("reason", "登录成功");
		}else{
			request.setAttribute("result", 300);
			request.setAttribute("reason", "登录失败");
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="/addUser")
	public String addUser(HttpServletRequest request,TUser userBean) {
		if(userService.existNameAdd(userBean)) {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "用户名已经存在");
		} else {
			boolean b = userService.addUser(userBean);
			if(b) {
				request.setAttribute("result", 200);
				request.setAttribute("reason", "添加成功,请登录！");
			} else {
				request.setAttribute("result", 300);
				request.setAttribute("reason", "添加失败");
			}
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="/updateUser")
	public String updateUser(HttpServletRequest request,TUser userBean) {
		boolean b = userService.updateUser(userBean);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "修改成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "修改失败");
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="/getNoticeBean")
	public String getNoticeBean(HttpServletRequest request) {
		String notice_id = request.getParameter("notice_id");
		TNotice noticeBean = noticeService.getNoticeBean(notice_id);
		request.setAttribute("noticeBean", noticeBean);
		return "qiantai/gonggao/gonggaoDetailQian";
	}
	
	@RequestMapping(value="/queryForum")
	public String queryForum(HttpServletRequest request) {
		List<TForum> forumBeans =  forumBeans = forumService.queryForum();
		request.setAttribute("forumBeans", forumBeans);
		return "qiantai/liuyan/liuyanAll";
	}
	
	@RequestMapping(value="/addForum")
	public String addForum(HttpServletRequest request,TForum forumBean) {
		TUser userBean = (TUser)request.getSession().getAttribute("sessionUser");
		forumBean.setUser_id(userBean.getUser_id());
		boolean b = forumService.addForum(forumBean);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "留言成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "留言失败");
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="/getAssetsByType")
	public String getAssetsByType(HttpServletRequest request,TAssets assetsBean) {
		String type_id = request.getParameter("type_id");
		assetsBean.setAssets_type_id(type_id);
		List<TAssets> assetsBeans = assetsService.getAssets(assetsBean);
		request.setAttribute("assetsBeans", assetsBeans);
		return "qiantai/qch/qchByCatelog";
	}
	
	@RequestMapping(value="/getAssetsBean")
	public String getAssetsBean(HttpServletRequest request,TAssets assetsBean) {
		String assets_id = request.getParameter("assets_id");
		assetsBean = assetsService.getAssetsBean(assets_id);
		request.setAttribute("assetsBean", assetsBean);
		return "qiantai/qch/qchDetailQian";
	}
	
	@RequestMapping(value="/addOrder")
	public String addOrder(HttpServletRequest request,TOrder orderBean) {
		String assets_id = request.getParameter("assets_id");
		TUser userBean = (TUser)request.getSession().getAttribute("sessionUser");
		orderBean.setUser_id(userBean.getUser_id());
		orderBean.setAssets_id(assets_id);
		boolean b = orderService.addOrder(orderBean);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "订购成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "订购失败");
		}
		return "common/ajax";
	}
	
	@RequestMapping(value="/myOrder")
	public String myOrder(HttpServletRequest request) {
		TUser userBean = (TUser)request.getSession().getAttribute("sessionUser");
		String user_id = userBean.getUser_id();
		List<TOrder> orderBeans = orderService.myOrders(user_id);
		request.setAttribute("orderBeans", orderBeans);
		return "qiantai/inc/myYudingMana";
	}
	
	@RequestMapping(value="/deleteOrder")
	public String deleteOrder(HttpServletRequest request) {
		String order_id = request.getParameter("order_id");
		boolean b = orderService.deleteOrder(order_id);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "订购成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "订购失败");
		}
		return "common/ajax";
	}
	
}
