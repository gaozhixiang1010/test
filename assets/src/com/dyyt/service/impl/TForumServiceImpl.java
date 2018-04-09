package com.dyyt.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dyyt.dao.TForumDAO;
import com.dyyt.model.TForum;
import com.dyyt.service.TForumService;
@Service("tForumServiceImpl")
public class TForumServiceImpl implements TForumService {
 
	@Resource
	private TForumDAO tforumDAO;
	
	
	public List<TForum> queryForum(TForum ForumBean) {
		// TODO Auto-generated method stub
		return tforumDAO.queryForumPage(ForumBean);
	}
	
	public boolean deleteForum(String forum_Id) {
		// TODO Auto-generated method stub
		return tforumDAO.deleteForum(forum_Id) > 0;
	}
	
	public List<TForum> queryForum() {
		// TODO Auto-generated method stub
		return tforumDAO.queryForum();
	}
	
	public boolean addForum(TForum ForumBean) {
		// TODO Auto-generated method stub
		return tforumDAO.addForum(ForumBean) > 0;
	}

}
