package com.dyyt.dao;

import java.util.List;

import com.dyyt.model.TForum;

public interface TForumDAO {
	/** 用户登录 */
	public List<TForum> queryForumPage(TForum forumBean);
	public int deleteForum(String forum_id);
	public List<TForum> queryForum();
	public int addForum(TForum forumBean);
}
