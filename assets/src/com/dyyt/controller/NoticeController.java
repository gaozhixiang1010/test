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
import com.dyyt.service.TAssetsTypeService;
import com.dyyt.service.TNoticeService;
/**
 * <pre>资产类型控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tNoticeServiceImpl")
	private TNoticeService noticeService;
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		return "management/notice/notice_operate";
	}
	
	/**
	 * 查询资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryNotice")
	public String queryNotice(HttpServletRequest request,TNotice noticeBean,PageParameter page) {
		noticeBean.setClass(page);
		List<TNotice> noticeBeans = new ArrayList();
		noticeBeans = noticeService.queryNotice(noticeBean);
		page = noticeBean.getClass(noticeBeans);
		request.setAttribute("noticeBeans", noticeBeans);
		request.setAttribute("noticeBean", noticeBean);
		request.setAttribute("page", page);
		return "management/notice/notice_query";
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
	
	/**
	 * 新增资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/addNotice")
	public String addNotice(HttpServletRequest request,TNotice noticeBean) {
		boolean b = noticeService.addNotice(noticeBean);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "添加成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "添加失败");
		}
		return "common/ajax";
	}
	
	/**
	 * 通过ID获取资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/getNoticeBean")
	public String getNoticeBean(HttpServletRequest request) {
		String notice_id = request.getParameter("notice_id");
		System.out.println("notice_id======"+notice_id);
		TNotice noticeBean = noticeService.getNoticeBean(notice_id);
		request.setAttribute("noticeBean", noticeBean);
		return "management/notice/notice_edit";
	}
	
	/**
	 * 修改资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateNotice")
	public String updateNotice(HttpServletRequest request,TNotice noticeBean) {
		boolean b = noticeService.updateNotice(noticeBean);
		if(b) {
			request.setAttribute("result", 200);
			request.setAttribute("reason", "修改成功");
		} else {
			request.setAttribute("result", 300);
			request.setAttribute("reason", "修改失败");
		}
		return "common/ajax";
	}
	
	/**
	 * 根据ID删除资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteNotice")
	public String deleteNotice(HttpServletRequest request) {
		String notice_id = request.getParameter("notice_id");
		boolean b = noticeService.deleteNotice(notice_id);
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
