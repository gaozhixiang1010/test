/**
 * Copyright：Copyright (c)  2016
 * Company：龙盟科技
 * @author 高志祥
 * 2016-02-22
 * @version  1.0
 */
package com.dyyt.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dyyt.model.TAssetsParentType;
import com.dyyt.model.TAssetsType;
@Service
public interface TAssetsTypeService {
	public List<TAssetsType> queryAssetsType(TAssetsType assetsTypeBean);//查询资产类型
	public boolean addAsstesType(TAssetsType assetsTypeBean);//新增资产类型
	public boolean existTypeNameAdd(TAssetsType assetsTypeBean);//新增资产类型排重
	public boolean existTypeNameUpdate(TAssetsType assetsTypeBean);//修改资产类型排重
	public TAssetsType getAssetsTypeBean(String type_id);//通过ID获取资产类型
	public boolean updateAsstesType(TAssetsType assetsTypeBean);//修改资产类型
	public boolean deleteAssetsType(String type_id);//根据ID删除资产类型
	public List<TAssetsType> getAssetsType();//获取资产类型
	public List<TAssetsParentType> getAssetsParentType();//获取资产大类
	public List<TAssetsType> queryAssetsType();
}
