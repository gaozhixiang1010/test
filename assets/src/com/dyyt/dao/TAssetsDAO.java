/**
 * @author 高志祥
 * 资产类型<t_assets_type>数据操作接口
 */
package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TAssets;

public interface TAssetsDAO {
	public List<TAssets> queryAssetsPage(TAssets assetsBean);//根据条件查询固定资产
	public int addAsstes(TAssets assetsBean);//新增固定资产
	public TAssets getAssetsBean(String assets_id);//通过ID获取固定资产信息
	public int updateAsstes(TAssets assetsBean);//修改固定资产
	public int deleteAssets(String assets_id);//根据ID删除固定资产信息
	public List<TAssets> queryAssets(TAssets assetsBean);
}
