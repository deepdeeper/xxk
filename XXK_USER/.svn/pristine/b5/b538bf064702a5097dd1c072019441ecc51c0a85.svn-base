package com.lzzyyy.xxk.user.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.lzzyyy.xxk.user.pojo.Pager;



/**
 * 
 * @author yaxiu
 * 实体类的基础借口，定义基本上全部的增加、删除、查改功能。
 * @param <T> 实体类名，继承时定义
 * @param <PK>主键的类型
 */


public interface EntityDao<T, PK> {
	 public void saveOrUpdate(T t) throws Exception; //添加、更新整个类
	 
	 public void update(final String hql,final Object [] params);//根据传入的参数更新
	 
	 public void delete(T t);
	 
	 public void delete(Class<T> entityClass,PK id) throws DataAccessException, Exception;
	 
	 public T get(Class<T> entityClass,PK id) throws Exception;
	 
	 public List<T> findAll(final Class<T> entityClass,final String propertyName,final boolean isAsc,Object object);
	 
	 public List<T> findByCriteria(final Class<T> entityClass,final String propertyName,final boolean isAsc,final int firstResult,final int maxResults,Object object);
	 
	 public int findCountsByCriteria(final Class<T> entityClass,Object o);
	
	 public Pager<T> findForPager(final Class<T> entityClass,final String propertyName,final boolean isAsc,final int firstResult,final int maxResults,final Object o);
	 
	 public List<T> findByProperty(Class<T> entityClass,String propertyName,Object value);
	
	 public T findUniqueByProperty(final Class<T> entityClass,final String propertyName,final Object value);
	
	 public boolean isPropertyExist(final Class<T> entityClass,final String propertyName,final Object value);
	 
	 public T findUniqueByHql(final String hql, final Object [] params );
	 
	 public List<T> findByHql(String hql,Object [] params);
	 
	 public Pager<T> findForPagerByHql(final int firstResult, final int maxResults, final String hql, final Object [] params);
	
	 public List<T>list(String hql);
	
	 public Integer countDayByYear(String qualityStatus,String year);
	 
	 //public Pager<T> findForPager(String hql,);
}
