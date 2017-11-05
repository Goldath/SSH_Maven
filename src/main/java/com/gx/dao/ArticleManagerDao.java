package com.gx.dao;

import java.util.List;

import com.gx.po.WebArticle;

public interface ArticleManagerDao {
	
	//新增网络文章
	void insertArticle(WebArticle article);
	//查询全部的文章
	List<WebArticle> selectAllArticle();
	//根据id查询文章
	WebArticle findArticleByID(int id);
	//修改网络文章
	void updateArticle(WebArticle webArticle);
	//删除网络文章
	void deleteArticle(WebArticle webArticle);
	//多条件组合查询文章
	List<WebArticle> selectArticleByMultipleConditionsCombined(WebArticle webArticle);

}
