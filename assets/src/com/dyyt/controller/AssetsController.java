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
import com.dyyt.model.TAssetsType;
import com.dyyt.service.TAssetsService;
import com.dyyt.service.TAssetsTypeService;
/**
 * <pre>固定资产控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/assets/*")
public class AssetsController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tAssetsTypeServiceImpl")
	private TAssetsTypeService assetsTypeService;
	@Autowired
	@Qualifier("tAssetsServiceImpl")
	private TAssetsService assetsService;
	
	/**
	 * 获取资产类型，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		String parent_id = request.getParameter("parent_id");
		List<TAssetsType> assetsTypeBeans = new ArrayList();
		assetsTypeBeans = assetsTypeService.getAssetsType();
		request.setAttribute("assetsTypeBeans", assetsTypeBeans);
		return "management/assets/assets_operate";
	}
	
	/**
	 * 根据条件查询固定资产
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryAssets")
	public String queryAssets(HttpServletRequest request,TAssets assetsBean,PageParameter page) {
		assetsBean.setClass(page);
		List<TAssets> assetsBeans = new ArrayList();
		assetsBeans = assetsService.queryAssets(assetsBean);
		page = assetsBean.getClass(assetsBeans);
		request.setAttribute("assetsBeans", assetsBeans);
		request.setAttribute("assetsBean", assetsBean);
		request.setAttribute("page", page);
		return "management/assets/assets_query";
	}
	
	/**
	 * 获取资产类型，跳转至固定资产新增页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/passAdd")
	public String passAdd(HttpServletRequest request) {
//		String parent_id = request.getParameter("parent_id");
		List<TAssetsType> assetsTypeBeans = new ArrayList();
		assetsTypeBeans = assetsTypeService.getAssetsType();
		request.setAttribute("assetsTypeBeans", assetsTypeBeans);
		return "management/assets/assets_add";
	}
	
	/**
	 * 新增固定资产
	 * @throws Exception 
	 */
	@RequestMapping(value="/addAsstes")
	public String addAsstes(HttpServletRequest request,TAssets assetsBean) {
		assetsBean.setUser_id(request.getSession().getAttribute("user_id").toString());
		assetsBean.setPinpai("大麦网");
		boolean b = assetsService.addAsstes(assetsBean);
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
	 * 通过ID获取固定资产信息
	 * @throws Exception 
	 */
	@RequestMapping(value="/getAssetsBean")
	public String getAssetsBean(HttpServletRequest request) {
		String assets_id = request.getParameter("assets_id");
		TAssets assetsBean = assetsService.getAssetsBean(assets_id);
		request.setAttribute("assetsBean", assetsBean);
		List<TAssetsType> assetsTypeBeans = new ArrayList();
		assetsTypeBeans = assetsTypeService.getAssetsType();
		request.setAttribute("assetsTypeBeans", assetsTypeBeans);
		return "management/assets/assets_edit";
	}
	
	/**
	 * 修改固定资产信息
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateAsstes")
	public String updateAsstes(HttpServletRequest request,TAssets assetsBean) {
		assetsBean.setUser_id(request.getSession().getAttribute("user_id").toString());
		boolean b = assetsService.updateAsstes(assetsBean);
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
	 * 根据ID删除固定资产信息
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAssets")
	public String deleteAssets(HttpServletRequest request) {
		String assets_id = request.getParameter("assets_id");
		boolean b = assetsService.deleteAssets(assets_id);
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
