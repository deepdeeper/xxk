package com.lzzyyy.xxk.user.dao.impl;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.lzzyyy.xxk.user.dao.EntityDao;
import com.lzzyyy.xxk.user.pojo.Pager;


/** *//**
 * Dao层接口的实现类
 * 许多人习惯根据不多的业务逻辑定义不同的DAO层接口，如UserDao,NewsDao,CompanyDao等等，
 * 这样往往使得编码量十分庞大，而且带来了维护的困难，因此，抽取此DAO层接口，收录大部分
 * DAO层必须的方法，以供Service层调用。
 * @author rongxinhua
 * @version 1.0
 * @param <T> 范型，指实体类
 * @param <PK> 范型，指实体类主键的数据类型，如Integer,Long
 * @see rong.common.dao.EntityDao
 */

@Repository(value="entityDao")
public class EntityDaoImpl<T,PK extends Serializable> extends HibernateDaoSupport implements EntityDao<T, PK>{

    /** *//**
     * 保存实体   
     * 包括添加和修改
     * @param t 实体对象
     * @throws Exception a
     */
    public void saveOrUpdate(T t) throws Exception{
    	try{
    		
           getHibernateTemplate().saveOrUpdate(t);

    	}catch (Exception e) {
			throw e;
		}
    }
    
    /** *//**
     * 更新实体
     * 可用于添加、修改、删除操作
     * @param hql 更新的HQL语句
     * @param params 参数,可有项目或多项目,代替Hql中的"?"号
     */
    public void update(final String hql,final Object [] params){
        getHibernateTemplate().execute(new HibernateCallback(){
          
            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
            	
                Query query = session.createQuery(hql);
                for(int i=0; i<params.length; i++){
                    query.setParameter(i, params[i]);
                }
                query.executeUpdate();
                session.flush(); 
                session.clear(); 

                return null;
            }
        });
    }
    
    /** *//**
     * 删除实体
     * @param t 实体对象
     */
    public void delete(T t){
   
        getHibernateTemplate().delete(t);
    	
    }
    
    /** *//**
     * 删除实体
     * @param entityClass 实体类名
     * @param id 实体的ID
     * @throws Exception 
     * @throws DataAccessException 
     */
    public void delete(Class<T> entityClass,PK id) throws DataAccessException, Exception{
        getHibernateTemplate().delete(get(entityClass,id));
    }
    
    /** *//**
     * 单查实体
     * @param entityClass 实体类名
     * @param id 实体的ID
     * @return 实体对象
     * @throws Exception 
     */
    @SuppressWarnings("unchecked")
    public T get(Class<T> entityClass,PK id) throws Exception{
    	T t =null;
        try{
    	//System.out.println(r.getPermissionses().size());
         t = (T)getHibernateTemplate().get(entityClass, id);
        }catch (Exception e) {
			throw e;
		}
        
        return t;
    }
    
    /** *//**
     * 查询全部记录列表
     * @param entityClass 实体类名
     * @param propertyName 排序的参照属性
     * @param isAsc 排序方式
     * @param criterions 查询条件,可为0项或任意多项目
     * @return 记录List集
     */
    public List<T> findAll(final Class<T> entityClass,final String propertyName,final boolean isAsc,Object object){
        int firstResult = 0;
        int maxResults = 0;        //设置为0,则表示查询全部记录
        return findByCriteria(entityClass, propertyName, isAsc, firstResult, maxResults,object);
    }
    
    /** *//**
     * 查询列表
     * @param entityClass 实体类名
     * @param propertyName 排序的参照属性
     * @param isAsc 排序方式,true表示升序,false表示降序,当propertyName赋值为null时,此参数无效
     * @param firstResult 开始记录序号
     * @param maxResults 最大记录数
     * @param criterions 查询条件,可有0项或任意多项目
     * @return 记录List集
     */
   @SuppressWarnings("unchecked")
    public List<T> findByCriteria(final Class<T> entityClass,final String propertyName,final boolean isAsc,final int firstResult,final int maxResults, final Object  object){
	  
	   List<T> list = (List<T>)getHibernateTemplate().execute(new HibernateCallback(){
       
            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Criteria criteria = session.createCriteria(entityClass);
                //按属性条件查询
                 
                   criteria.add(Example.create(object).enableLike(MatchMode.ANYWHERE));
                   
                   //是否是用户对象
                 /*  if (object instanceof SysUser) {
                  	 //System.out.println(((SysUser)object).getRole().getRoleid());
                  	 criteria.add(Restrictions.eq("role.roleid",((SysUser)object).getRole().getRoleid()));
//                  	 criteria.add(Restrictions.isNotNull(((SysUser)object).getUnitname()));
//                  	 criteria.add(Restrictions.isNotNull(((SysUser)object).getUsername()));
  				  }*/
                   
                  	
                  
                //按某个属性排序          
                  
                if(null != propertyName && !"".equals(propertyName)){
                
                    if(isAsc){
                        criteria.addOrder(Order.asc(propertyName));
                    }else{
                        criteria.addOrder(Order.desc(propertyName));
                    }
                }      
                //用于分页查询
                if(maxResults != 0){
                    criteria.setFirstResult(firstResult);
                    criteria.setMaxResults(maxResults);
                }
            
                List<T> list = criteria.list();
//                for(int i=0;i<list.size();i++){
//                	getHibernateTemplate().initialize(list.get(i));
//                }
              
                return list;
              
            }
        });
       // System.out.println(list.size());
        return list;
    }
    
    /** *//**
     * 查询总记录数
     * @param entityClass 实体类名
     * @param criterions 查询条件,可有0项或任意多项
     * @return 总记录数
     */
    public int findCountsByCriteria(final Class<T> entityClass,final Object  o){
            int totalCounts = (Integer)getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Criteria criteria = session.createCriteria(entityClass);
                 
                //按属性条件查询,有问题找不，暂时不用
         //       criteria.add(Example.create(o).enableLike(MatchMode.ANYWHERE));
              
                
                int totalCounts = criteria.list().size();
                return totalCounts;
            }
        });
        return totalCounts;
    }
    
    
    /** *//**
     * 分页查询
     * @param entityClass 实体类名
     * @param propertyName 排序参照属性
     * @param isAsc 排序方式,true表示升序,false表示降序,当propertyName赋值为null时,此参数无效
     * @param firstResult 开始记录序号
     * @param maxResults 最大记录数
     * @param criterions 查询条件,可为0项或任意多项目
     * @return 封装List和totalCounts的Pager对象
     */
    @SuppressWarnings("unchecked")
    public Pager<T> findForPager(final Class<T> entityClass,final String propertyName,final boolean isAsc,final int firstResult,final int maxResults,Object object){
        int totalCounts = findCountsByCriteria(entityClass,object);
        List<T> entityList = findByCriteria(entityClass, propertyName, isAsc, firstResult, maxResults,object);
        Pager pager = new Pager();
        pager.setTotalCounts(totalCounts);
        pager.setEntityList(entityList);
        return pager;
    }
    
    /** *//**
     * 根据属性值查询列表
     * @param entityClass 实体类名
     * @param propertyName 属性名
     * @param value 属性值
     * @return List列表
     */
    public List<T> findByProperty(Class<T> entityClass,String propertyName,Object value){
    	List<T> list =null;
    	try{
        Criterion criterion = Restrictions.eq(propertyName, value);
         list = findAll(entityClass, propertyName, true,value);
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return list;
    }
    
    /** *//**
     * 根据属性值查询单个对象
     * @param entityClass 实体类名
     * @param propertyName 属性名
     * @param value 属性值
     * @return 实体对象
     */
    @SuppressWarnings("unchecked")
    public T findUniqueByProperty(final Class<T> entityClass,final String propertyName,final Object value){
        T t = (T)getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Criteria criteria = session.createCriteria(entityClass).add(Restrictions.eq(propertyName, value));
                T t = (T)criteria.uniqueResult();
            
                return t;
            }
        });
        return t;
    }
    
    /** *//**
     * 根据属性值查询实体是否存在
     * @param entityClass 实体类名
     * @param propertyName 参照的属性名
     * @param value 属性值
     * @return 存在则返回true,不存在则返回false
     */
    public boolean isPropertyExist(final Class<T> entityClass,final String propertyName,final Object value){
        boolean isExist = (Boolean)getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Criteria criteria = session.createCriteria(entityClass).add(Restrictions.eq(propertyName, value));
                boolean isEmpty = criteria.list().isEmpty();
                return ! isEmpty;
            }
        });
        return isExist;
    }
    
    /** *//**
     * 
     * @param hql 查询语句
     * 用法如：可用于登录验证时，根据用户名、密码等信息查询用户
     * @param params 参数数组,代替HQL中的"?"号,可有0项目或多项
     * @return 唯一实体，返回null则表示不存在配置的实体
     * @exception 如果查询的结果集不唯一,则抛异常
     */
    @SuppressWarnings("unchecked")
    public T findUniqueByHql(final String hql, final Object [] params ){
        
        T t = (T)getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Query query = session.createQuery(hql);
                for(int i=0; i<params.length; i++){
                    query.setParameter(i, params[i]);
                }
                T t = (T)query.uniqueResult();
                return t;
            }
        });
        return t;
    }
    
    /** *//**
     * 按HQL条件查询列表
     * @param hql 查询语句,支持连接查询和多条件查询
     * @param params 参数数组,代替hql中的"?"号
     * @return 结果集List
     */
    @SuppressWarnings("unchecked")
    public List<T> findByHql(String hql,Object [] params){
    	 List list  = new  ArrayList<T>();
    	try{
            list = getHibernateTemplate().find(hql, params);
    	}catch (Exception e) {
			e.printStackTrace();
		}
        return list;
    }
    
    /** *//**
     * 按HQL分页查询
     * @param firstResult 开始记录号
     * @param maxResults 最大记录数
     * @param hql 查询语句,支持连接查询和多条件查询
     * @param params 参数数组,代替餐hql中的"?"号
     * @return 封装List和total的Pager对象
     */
    @SuppressWarnings("unchecked")
    public Pager<T> findForPagerByHql(final int firstResult, final int maxResults, final String hql, final Object [] params){
        Pager<T> pager = (Pager<T>)getHibernateTemplate().execute(new HibernateCallback(){

            public Object doInHibernate(Session session)
                    throws HibernateException, SQLException {
                Query query = session.createQuery(hql);
                for(int position = 0; position < params.length; position ++){
                    query.setParameter(position, params[position]);
                }
                int totalCounts = query.list().size();    //总记录数
                //用于分页查询
                if(maxResults > 0){
                    query.setFirstResult(firstResult);
                    query.setMaxResults(maxResults);
                }
                List<T> list = query.list();
                Pager<T> pager = new Pager<T>();
                pager.setEntityList(list);
                pager.setTotalCounts(totalCounts);
                return pager;
            }
        });
        return pager;
    }



	public List<T>list(String hql){
		Session session=super.getSession(true);
		return session.createQuery(hql).list();
		
	}

/*	@Override
	public List<T> findByCriteria(Class<T> entityClass, String propertyName,
			boolean isAsc, int firstResult, int maxResults, Object object) {
		// TODO Auto-generated method stub
		return null;
	}*/

/*	@Override
	public int findCountsByCriteria(Class<T> entityClass, Object o) {
		// TODO Auto-generated method stub
		return 0;
	}*/
	
	  public Integer countDayByYear(String qualityStatus,String year){
    	 String sql = "select count(distinct a.addDate) from AirQualityReport a where a.qualityStatus =? and to_char(a.addDate,'yyyy') like ? ";
    		
    	 Long count ;
    	 if(this.getHibernateTemplate()==null){
    		 this.setHibernateTemplate( new HibernateTemplate());
    	
    		   SessionFactory factory = this.getHibernateTemplate().getSessionFactory();
    		   System.out.println("factory"+factory);
    	    	Session session =  factory.openSession();
    	    	count=(Long)session.createQuery(sql).setString(0, qualityStatus).setString(1, year).uniqueResult();
    	    
    	 }else{
    		 count =(Long) super.getSession(true).createQuery(sql).setString(0, qualityStatus).setString(1, year).uniqueResult();
    	 }
    	 // hibernateTemplate = new HibernateTemplate();
     
   	
        return  Integer.parseInt(count.toString());
    }


	

}
