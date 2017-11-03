package com.gx.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.gx.dao.ArticleManagerDao;
import com.gx.po.WebArticle;

public class ArticleManagerDaoImpl implements ArticleManagerDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void insertArticle(WebArticle article) {
		// TODO Auto-generated method stub
		hibernateTemplate.save(article);
	}

}
