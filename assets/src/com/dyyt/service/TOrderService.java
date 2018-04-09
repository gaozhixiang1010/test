package com.dyyt.service;

import java.util.List;

import com.dyyt.model.TOrder;
/**
 * 用户登录
 * @author wyy
 *
 */

public interface TOrderService {
	 public List<TOrder> queryOrder(TOrder orderBean);
	 public boolean deleteOrder(String order_id);
	 public boolean addOrder(TOrder orderBean);
	 public List<TOrder> myOrders(String user_id);
}
