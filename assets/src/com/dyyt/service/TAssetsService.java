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

import com.dyyt.model.TAssets;
@Service
public interface TAssetsService {
	public List<TAssets> queryAssets(TAssets assetsBean);//根据条件查询固定资产
	public boolean addAsstes(TAssets assetsBean);//新增固定资产
	public TAssets getAssetsBean(String assets_id);//通过ID获取固定资产信息
	public boolean updateAsstes(TAssets assetsBean);//修改固定资产
	public boolean deleteAssets(String assets_id);//根据ID删除固定资产信息
	public List<TAssets> getAssets(TAssets assetsBean);
}
