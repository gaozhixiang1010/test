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
import com.dyyt.service.TAssetsTypeService;
/**
 * <pre>资产类型控制类</pre>
 * <b>功能描述：</b>
 * 分发请求
 */
@Controller
@RequestMapping("/assets_type/*")
public class AssetsTypeController {
	/**
	 * 业务逻辑实现类注入
	 * tAssetsTypeServiceImpl
	 */
	@Autowired
	@Qualifier("tAssetsTypeServiceImpl")
	private TAssetsTypeService assetsTypeService;
	
	/**
	 * 获取资产大类，跳转至条件查询页面
	 * @throws Exception 
	 */
	@RequestMapping(value="/operate")
	public String operate(HttpServletRequest request) {
		List<TAssetsParentType> parentTypeBeans = new ArrayList();
		parentTypeBeans = assetsTypeService.getAssetsParentType();
		request.setAttribute("parentTypeBeans", parentTypeBeans);
		return "management/assets_type/assets_type_operate";
	}
	
	/**
	 * 查询资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/queryAssetsType")
	public String queryAssetsType(HttpServletRequest request,TAssetsType assetsTypeBean,PageParameter page) {
		assetsTypeBean.setClass(page);
		List<TAssetsType> assetsTypeBeans = new ArrayList();
		assetsTypeBeans = assetsTypeService.queryAssetsType(assetsTypeBean);
		page = assetsTypeBean.getClass(assetsTypeBeans);
		request.setAttribute("assetsTypeBeans", assetsTypeBeans);
		request.setAttribute("assetsTypeBean", assetsTypeBean);
		request.setAttribute("page", page);
		return "management/assets_type/assets_type_query";
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
		return "management/assets_type/assets_type_add";
	}
	
	/**
	 * 新增资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/addAsstesType")
	public String addAsstesType(HttpServletRequest request,TAssetsType assetsTypeBean) {
		boolean exit = assetsTypeService.existTypeNameAdd(assetsTypeBean);
		if(exit){
			request.setAttribute("result", 300);
			request.setAttribute("reason", "您所添加的资产类型已经存在");
		} else {
			boolean b = assetsTypeService.addAsstesType(assetsTypeBean);
			if(b) {
				request.setAttribute("result", 200);
				request.setAttribute("reason", "添加成功");
			} else {
				request.setAttribute("result", 300);
				request.setAttribute("reason", "添加失败");
			}
		}
		return "common/ajax";
	}
	
	/**
	 * 通过ID获取资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/getAssetsTypeBean")
	public String getAssetsTypeBean(HttpServletRequest request) {
		String type_id = request.getParameter("type_id");
		TAssetsType assetsTypeBean = assetsTypeService.getAssetsTypeBean(type_id);
		request.setAttribute("assetsTypeBean", assetsTypeBean);
		return "management/assets_type/assets_type_edit";
	}
	
	/**
	 * 修改资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/updateAsstesType")
	public String updateAsstesType(HttpServletRequest request,TAssetsType assetsTypeBean) {
		boolean exit = assetsTypeService.existTypeNameUpdate(assetsTypeBean);
		if(exit){
			request.setAttribute("result", 300);
			request.setAttribute("reason", "您保存的资产类型已经存在,请重新填写");
		} else {
			boolean b = assetsTypeService.updateAsstesType(assetsTypeBean);
			if(b) {
				request.setAttribute("result", 200);
				request.setAttribute("reason", "修改成功");
			} else {
				request.setAttribute("result", 300);
				request.setAttribute("reason", "修改失败");
			}
		}
		return "common/ajax";
	}
	
	/**
	 * 根据ID删除资产类型
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteAssetsType")
	public String deleteAssetsType(HttpServletRequest request) {
		String type_id = request.getParameter("type_id");
		boolean b = assetsTypeService.deleteAssetsType(type_id);
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
