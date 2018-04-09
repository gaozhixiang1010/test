package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TNotice;
import com.dyyt.model.TOrder;

public interface TOrderDAO {
	/** 用户登录 */
	public List<TOrder> queryOrderPage(TOrder orderBean);
	public int deleteOrder(String order_id);
	public int addOrder(TOrder orderBean);
	public List<TOrder> myOrders(String user_id);
}
