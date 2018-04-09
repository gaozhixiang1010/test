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

import com.dyyt.model.TOutStock;
@Service
public interface TOutStockService {
	public List<TOutStock> queryOutStock(TOutStock outStockBean);//根据条件查询固定资产出库信息
	public boolean addOutStock(TOutStock outStockBean);//新增出库信息
	public int overStock(TOutStock outStockBean);//查询剩余库存数量
	public TOutStock getOutStockBean(String outstock_id);//通过ID获取出库信息
	public boolean updateOutStock(TOutStock outStockBean);//修改出库信息
	public boolean deleteOutStock(String outstock_id);//根据ID删除出库信息
}
