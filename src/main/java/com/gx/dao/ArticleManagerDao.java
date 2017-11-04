package com.gx.dao;

import java.util.List;

import com.gx.po.WebArticle;

public interface ArticleManagerDao {
	
	//新增网络文章
	void insertArticle(WebArticle article);
	//查询全部的文章
	List<WebArticle> selectAllArticle();

}
