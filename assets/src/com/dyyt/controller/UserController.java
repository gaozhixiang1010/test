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
import com.dyyt.model.TUser;
import com.dyyt.service.TAssetsTypeService;
import com.dyyt.service.TNoticeService;
import com.dyyt.service.TUserService;
/**
 * <pre>资产类型控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/user/*")
public class UserController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tUserServiceImpl")
	private TUserService userService;
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		return "management/user/user_operate";
	}
	
	/**
	 * 查询资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryUser")
	public String queryUser(HttpServletRequest request,TUser userBean,PageParameter page) {
		userBean.setClass(page);
		List<TUser> userBeans = new ArrayList();
		userBeans = userService.queryUser(userBean);
		page = userBean.getClass(userBeans);
		request.setAttribute("userBeans", userBeans);
		request.setAttribute("userBean", userBean);
		request.setAttribute("page", page);
		return "management/user/user_query";
	}
	
	/**
	 * 获取资产大类，跳转至资产类型新增页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/passAdd")
	public String passAdd(HttpServletRequest request) {
//		List<TAssetsParentType> parentTypeBeans = new ArrayList();
//		parentTypeBeans = assetsTypeService.getAssetsParentType();
//		request.setAttribute("parentTypeBeans", parentTypeBeans);
		return "management/notice/notice_add";
	}
	
	@RequestMapping(value="/updatePwd")
	public String updatePwd(HttpServletRequest request,TUser userBean) {
		userBean.setUser_name("admin");
		TUser tu = userService.selectAdmin(userBean);
		if(tu != null && userBean.getOld_pwd().equals(tu.getUser_pwd())) {
			boolean b = userService.updatePwd(userBean);
			if(b) {
				request.setAttribute("result", 200);
				request.setAttribute("reason", "密码修改成功");
			} else {
				request.setAttribute("result", 300);
				request.setAttribute("reason", "密码修改失败");
			}
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "原密码填写错误");
		}
//		boolean b = noticeService.addNotice(noticeBean);
//		if(b) {
//			request.setAttribute("result", 200);
//			request.setAttribute("reason", "添加成功");
//		} else {
//			request.setAttribute("result", 300);
//			request.setAttribute("reason", "添加失败");
//		}
		return "common/ajax";
	}
	
	/**
	 * 新增资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/addUser")
	public String addUser(HttpServletRequest request,TNotice noticeBean) {
//		boolean b = noticeService.addNotice(noticeBean);
//		if(b) {
//			request.setAttribute("result", 200);
//			request.setAttribute("reason", "添加成功");
//		} else {
//			request.setAttribute("result", 300);
//			request.setAttribute("reason", "添加失败");
//		}
		return "common/ajax";
	}
	
	/**
	 * 通过ID获取资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/getUserBean")
	public String getUserBean(HttpServletRequest request) {
//		String notice_id = request.getParameter("notice_id");
//		System.out.println("notice_id======"+notice_id);
//		TNotice noticeBean = noticeService.getNoticeBean(notice_id);
//		request.setAttribute("noticeBean", noticeBean);
		return "management/notice/notice_edit";
	}
	
	/**
	 * 修改资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateUser")
	public String updateUser(HttpServletRequest request,TNotice noticeBean) {
//		boolean b = noticeService.updateNotice(noticeBean);
//		if(b) {
//			request.setAttribute("result", 200);
//			request.setAttribute("reason", "修改成功");
//		} else {
//			request.setAttribute("result", 300);
//			request.setAttribute("reason", "修改失败");
//		}
		return "common/ajax";
	}
	
	/**
	 * 根据ID删除资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteUser")
	public String deleteUser(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		boolean b = userService.deleteUser(user_id);
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
