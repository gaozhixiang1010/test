package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TNoticeDAO;
import com.dyyt.model.TNotice;
import com.dyyt.service.TNoticeService;
@Service("tNoticeServiceImpl")
public class TNoticeServiceImpl implements TNoticeService {
	@Resource
	private TNoticeDAO noticeDAO;
	
	public boolean addNotice(TNotice noticeBean) {
		// TODO Auto-generated method stub
		return noticeDAO.addNotice(noticeBean) > 0;
	}

	public List<TNotice> queryNotice(TNotice noticeBean) {
		// TODO Auto-generated method stub
		return noticeDAO.queryNoticePage(noticeBean);
	}
	
	public List<TNotice> queryNotice() {
		// TODO Auto-generated method stub
		return noticeDAO.queryNotice();
	}

	public TNotice getNoticeBean(String notice_Id) {
		// TODO Auto-generated method stub
		return noticeDAO.getNoticeBean(notice_Id);
	}

	public boolean updateNotice(TNotice noticeBean) {
		// TODO Auto-generated method stub
		return noticeDAO.updateNotice(noticeBean) > 0;
	}

	public boolean deleteNotice(String notice_Id) {
		// TODO Auto-generated method stub
		return noticeDAO.deleteNotice(notice_Id) > 0;
	}

}
