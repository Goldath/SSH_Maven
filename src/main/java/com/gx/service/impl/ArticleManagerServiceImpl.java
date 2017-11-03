package com.gx.service.impl;

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
}
