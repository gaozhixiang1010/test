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

import com.dyyt.model.TNotice;
@Service
public interface TNoticeService {
	public List<TNotice> queryNotice(TNotice noticeBean);//查询资产类型
	public boolean addNotice(TNotice noticeBean);//新增资产类型
	public TNotice getNoticeBean(String notice_id);//通过ID获取资产类型
	public boolean updateNotice(TNotice noticeBean);//修改资产类型
	public boolean deleteNotice(String notice_id);//根据ID删除资产类型
	public List<TNotice> queryNotice();
}
