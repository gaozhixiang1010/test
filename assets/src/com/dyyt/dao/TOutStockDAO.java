/**
 * @author 高志祥
 * 资产类型<t_assets_type>数据操作接口
 */
package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TOutStock;
import com.dyyt.model.TStock;

public interface TOutStockDAO {
	public List<TOutStock> queryOutStockPage(TOutStock outStockBean);//根据条件查询固定资产出库信息
	public int addOutStock(TOutStock outStockBean);//新增出库信息
	public TStock getStockInformation(TOutStock outStockBean);//根据条件获取库存信息
	public TOutStock getOutStockBean(String outstock_id);//通过ID获取出库信息
	public int updateOutStock(TOutStock outStockBean);//修改出库信息
	public int deleteOutStock(String outstock_id);//根据ID删除出库信息
}
