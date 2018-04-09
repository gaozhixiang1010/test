package com.dyyt.common;

import java.util.HashMap;
import java.util.List;

/**
 * 分页参数类
 * 
 */
public class PageParameter {

    public static final String DEFAULT_PAGE_SIZE = "10";

    private String numPerPage;                //每页条数
    private String pageNum;						 //当前页面
   // private int prePage;                 //
   // private int nextPage;
    private String totalPage;              //总页数
    private String totalCount;				//总数量
    
    private String order;					 //排列顺序

    public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public PageParameter() {
        this.pageNum = "1";
        this.numPerPage = DEFAULT_PAGE_SIZE;
    }

    /**
     * 
     * @param currentPage
     * @param pageSize
     */
    public PageParameter(String currentPage, String pageSize) {
        this.pageNum = currentPage;
        this.numPerPage = pageSize;
    }

    public String getPageNum() {
        return pageNum;
    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }


    public String getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(String numPerPage) {
		this.numPerPage = numPerPage;
	}

	/*
    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }
	*/
    public String getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(String totalPage) {
        this.totalPage = totalPage;
    }

    public String getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(String totalCount) {
        this.totalCount = totalCount;
    }
    
    public void setClass(PageParameter a)
    {
    	if(a == null)
    	{
    		a = new PageParameter();
    	}
    	this.totalCount = a.getTotalCount();
    	this.numPerPage = a.getNumPerPage();            //每页条数
    	this.pageNum= a.getPageNum();			 		//当前页面
    	this.totalPage = a.getTotalPage();              //总页数
    }
    
    public PageParameter getClass(List mm)
    {
    	PageParameter b = new PageParameter();
		if(mm.size()>0)
		{
			PageParameter a =(PageParameter)mm.get(0);
			b.setClass(a);
		}else
		{
			PageParameter a = new PageParameter();
			b.setClass(a);
		}
    	return b;
    }
    public PageParameter getHashMap(List mm)
    {
    	PageParameter b = new PageParameter();
		PageParameter a = new PageParameter();
		if(mm.size()>0)
		{
			HashMap m = (HashMap)mm.get(0);
			a.setNumPerPage(m.get("numPerPage").toString());
			a.setPageNum(m.get("pageNum").toString());
			a.setTotalCount(m.get("totalCount").toString());
			a.setTotalPage(m.get("totalPage").toString());
			b.setClass(a);
		}else
		{
			b.setClass(a);
		}
    	return b;
    }
}
