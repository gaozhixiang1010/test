package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TOrderDAO;
import com.dyyt.model.TOrder;
import com.dyyt.service.TOrderService;
@Service("tOrderServiceImpl")
public class TOrderServiceImpl implements TOrderService {
 
	@Resource
	private TOrderDAO tOrderDAO;
	
	
	public List<TOrder> queryOrder(TOrder OrderBean) {
		// TODO Auto-generated method stub
		return tOrderDAO.queryOrderPage(OrderBean);
	}
	
	public boolean deleteOrder(String order_Id) {
		// TODO Auto-generated method stub
		return tOrderDAO.deleteOrder(order_Id) > 0;
	}

	public boolean addOrder(TOrder orderBean) {
		// TODO Auto-generated method stub
		return tOrderDAO.addOrder(orderBean) > 0;
	}

	public List<TOrder> myOrders(String user_id) {
		// TODO Auto-generated method stub
		return tOrderDAO.myOrders(user_id);
	}

	
}
