package com.gx.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	private static  Configuration cfg=null;
	private static SessionFactory sessionFactory=null;
	//静态代码块实现
	static{
		//加载核心配置文件
		 cfg=new Configuration().configure();
		 sessionFactory=cfg.buildSessionFactory();
	}
	
	//提供方法返回sessionFactory
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	

}
