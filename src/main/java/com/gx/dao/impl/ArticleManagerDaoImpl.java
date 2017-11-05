package com.gx.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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

	public List<WebArticle> selectAllArticle() {
		// TODO Auto-generated method stub
		return (List<WebArticle>) hibernateTemplate.find("from WebArticle");
	}

	public WebArticle findArticleByID(int id) {
		// TODO Auto-generated method stub
		WebArticle article=hibernateTemplate.get(WebArticle.class, id);
		return article;
	}

	public void updateArticle(WebArticle webArticle) {
		hibernateTemplate.update(webArticle);
		
	}

	public void deleteArticle(WebArticle webArticle) {
		// TODO Auto-generated method stub
		hibernateTemplate.delete(webArticle);
	}

	public List<WebArticle> selectArticleByMultipleConditionsCombined(WebArticle webArticle) {
		String hql="from WebArticle where 1=1";
		List<Object> prams=new ArrayList<Object>();
		if(webArticle.getAttributes().getBasicAttributesId()!=0){
			hql+=" and attributes.basicAttributesId=?";
			prams.add(webArticle.getAttributes().getBasicAttributesId());
		}
		if(!webArticle.getWTitle().equals("")){
			hql+=" and WTitle like ?";
			prams.add("%"+webArticle.getWTitle()+"%");
		}
		List<WebArticle> articleList=(List<WebArticle>) hibernateTemplate.find(hql,prams.toArray());
		//多条件组合查询-离线对象方式实现
/*		DetachedCriteria criteria=DetachedCriteria.forClass(WebArticle.class);
		if(webArticle.getAttributes().getBasicAttributesId()!=0){
			criteria.add(Restrictions.eq("WebArticle.attributes.basicAttributesId", webArticle.getAttributes().getBasicAttributesId()));
		}
		if(!webArticle.getWTitle().equals("")){
			criteria.add(Restrictions.eq("WebArticle.WTitle like", "%"+webArticle.getWTitle()+"%"));
		}
		List<WebArticle> articleList=(List<WebArticle>) hibernateTemplate.findByCriteria(criteria);*/
		
		return articleList;

	}

}
