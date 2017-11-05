package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.ArticleManagerDao;
import com.gx.po.WebArticle;
import com.gx.service.ArticleManagerService;

@Transactional
public class ArticleManagerServiceImpl implements ArticleManagerService {

	@Autowired
	private ArticleManagerDao articleManagerDao;

	public void insertArticle(WebArticle article) {
		// TODO Auto-generated method stub
		articleManagerDao.insertArticle(article);
	}

	public List<WebArticle> selectAllArticle() {
		// TODO Auto-generated method stub
		return articleManagerDao.selectAllArticle();
	}

	public WebArticle findArticleByID(int id) {
		// TODO Auto-generated method stub
		return articleManagerDao.findArticleByID(id);
	}

	public void updateArticle(WebArticle webArticle) {
		// TODO Auto-generated method stub
		articleManagerDao.updateArticle(webArticle);
		
	}

	public void deleteArticle(WebArticle webArticle) {
		// TODO Auto-generated method stub
		articleManagerDao.deleteArticle(webArticle);
		
	}

	public List<WebArticle> selectArticleByMultipleConditionsCombined(WebArticle webArticle) {
		// TODO Auto-generated method stub
		return articleManagerDao.selectArticleByMultipleConditionsCombined(webArticle);
	}

}
