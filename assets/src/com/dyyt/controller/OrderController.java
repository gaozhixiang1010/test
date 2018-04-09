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
import com.dyyt.model.TNotice;
import com.dyyt.model.TOrder;
import com.dyyt.model.TUser;
import com.dyyt.service.TAssetsTypeService;
import com.dyyt.service.TNoticeService;
import com.dyyt.service.TOrderService;
import com.dyyt.service.TUserService;
/**
 * <pre>资产类型控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/order/*")
public class OrderController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tOrderServiceImpl")
	private TOrderService orderService;
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		return "management/order/order_operate";
	}
	
	/**
	 * 查询资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryOrder")
	public String queryUser(HttpServletRequest request,TOrder orderBean,PageParameter page) {
		orderBean.setClass(page);
		List<TOrder> orderBeans = new ArrayList();
		orderBeans = orderService.queryOrder(orderBean);
		page = orderBean.getClass(orderBeans);
		request.setAttribute("orderBeans", orderBeans);
		request.setAttribute("orderBean", orderBean);
		request.setAttribute("page", page);
		return "management/order/order_query";
	}
	
	
	/**
	 * 根据ID删除资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteOrder")
	public String deleteOrder(HttpServletRequest request) {
		String order_id = request.getParameter("order_id");
		boolean b = orderService.deleteOrder(order_id);
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
