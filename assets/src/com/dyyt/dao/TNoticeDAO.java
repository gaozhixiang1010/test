/**
 * @author 高志祥
 * 资产类型<t_assets_type>数据操作接口
 */
package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TNotice;

public interface TNoticeDAO {
	public List<TNotice> queryNoticePage(TNotice noticeBean);//查询资产类型
	public int addNotice(TNotice noticeBean);//新增资产类型
	public TNotice getNoticeBean(String notice_id);//通过ID获取资产类型
	public int updateNotice(TNotice NoticeBean);//修改资产类型
	public int deleteNotice(String notice_id);//根据ID删除资产类型
	public List<TNotice> queryNotice();
}
