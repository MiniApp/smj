package com.smj.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.smj.dao.IBaseDao;
import com.smj.orm.Affiche;
import com.smj.orm.Brand;
import com.smj.orm.Cateory;
import com.smj.orm.Comm_info;
import com.smj.orm.CommdAppr;
import com.smj.orm.CommdArchives;
import com.smj.orm.Leaveword;
import com.smj.orm.Region;
import com.smj.orm.StoreInfo;

/**
 * IBaseDao接口实现类
 * 
 * */
@Repository("dao")
public class IBaseDaoImpl extends HibernateDaoSupport implements IBaseDao {
	@Resource(name = "sessionFactory")
	public void setSuperSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	/**
	 * 查询
	 * */
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz, Integer id) {
		return this.getHibernateTemplate().get(clazz, id);
	}

	/**
	 * 新增
	 * */
	@SuppressWarnings("rawtypes")
	public void save(Object po) {
		try {
			this.getHibernateTemplate().save(po);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 修改
	 * 
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public void merge(Object po) {
		try {
			this.getHibernateTemplate().merge(po);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 删除
	 * 
	 * 
	 * */
	@SuppressWarnings("rawtypes")
	public void delete(Object po) {
		try {
			getHibernateTemplate().delete(po);
		} catch (RuntimeException e) {
			throw e;
		}
	}

	/**
	 * 根据对象名，外键名，id查询分页对象
	 * 
	 * 
	 * */

	@SuppressWarnings("rawtypes")
	public List findByIdList(String calssname, Integer id, String s,
			int pageNo, int pageSize) {
		final String name = calssname;
		final String ss = s;
		final int pNo = pageNo;
		final int PS = pageSize;
		final Integer i = id;
		List list = this.getHibernateTemplate().executeFind(
				new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query queryObject = session.createQuery("FROM " + name
								+ " as a WHERE " + ss + " =:p1");
						queryObject.setInteger("p1", i);
						// 设置页数
						queryObject.setFirstResult((pNo - 1) * PS);
						// 设置每页数据
						queryObject.setMaxResults(PS);
						return queryObject.list();
					}
				});
		return list;
	}

	/**    
	 * Method：	findPaginated
	 * Description：	
	 *			分页查询
	 * @param  	Class clazz
	 *			传入实体 
	 * @param  	int pageNo
	 *			当前页数
	 * @param  	int pageSize
	 *			当前每页数据大小
	 * @param  	Map map
	 *			存放查询参数
	 * @return	List<?>
	 * @since   
	 */
	@SuppressWarnings("rawtypes")
	public List<?> findPaginated(Class clazz, int pageNo, int pageSize, Map map) {
		try {
			final String name = clazz.getName();
			final int pNo = pageNo;
			final int PS = pageSize;
			final StringBuffer sql = new StringBuffer();
			sql.append("FROM " + name);
			if (map != null && map.get("schList") != null) {
				List sch = (List) map.get("schList");
				sql.append(" WHERE ");
				Boolean flag = false;
				for (Object str : sch) {
					if (flag == true) {
						sql.append("AND");
					}
					Map schmap = (Map) str;
					sql.append(" " + schmap.get("field") + " ");
					if ("like".equals(schmap.get("condition"))) {
						sql.append(" like '%" + schmap.get("value") + "%' ");
					} else if ("eq".equals(schmap.get("condition"))) {
						sql.append(" = '" + schmap.get("value") + "'");
					} else if ("lt".equals(schmap.get("condition"))) {
						sql.append(" < '" + schmap.get("value") + "'");
					} else if ("gt".equals(schmap.get("condition"))) {
						sql.append(" > '" + schmap.get("value") + "'");
					} else if ("leq".equals(schmap.get("condition"))) {
						sql.append(" <= '" + schmap.get("value") + "'");
					} else if ("geq".equals(schmap.get("condition"))) {
						sql.append(" >= '" + schmap.get("value") + "'");
					} else if ("neq".equals(schmap.get("condition"))) {
						sql.append(" <> '" + schmap.get("value") + "'");
					}
					flag = true;
				}
			}
			if (map != null && map.get("sortname") != null
					&& map.get("sortorder") != null) {
				if ((!"".equals(map.get("sortname")) && null != map
						.get("sortname"))) {
					sql.append(" order by " + map.get("sortname"));
					sql.append(" " + map.get("sortorder"));
				}
			}
			List<?> list = this.getHibernateTemplate().executeFind(
					new HibernateCallback() {

						public Object doInHibernate(Session session)
								throws HibernateException, SQLException {
							
							Query queryObject = session.createQuery(sql
									.toString());
							// 设置页数
							queryObject.setFirstResult((pNo - 1) * PS);
							// 设置每页数据
							queryObject.setMaxResults(PS);
							return queryObject.list();
						}
					});
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@SuppressWarnings("rawtypes")
	public Integer getCount(Class clazz, Map map) {
		try {
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) FROM " + name);
			if (map != null && map.get("schList") != null) {
				List sch = (List) map.get("schList");
				sql.append(" WHERE ");
				Boolean flag = false;
				for (Object str : sch) {
					if (flag == true) {
						sql.append("AND");
					}
					Map schmap = (Map) str;
					sql.append(" " + schmap.get("field") + " ");
					if ("like".equals(schmap.get("condition"))) {
						sql.append(" like '%" + schmap.get("value") + "%' ");
					} else if ("eq".equals(schmap.get("condition"))) {
						sql.append(" = '" + schmap.get("value") + "'");
					} else if ("lt".equals(schmap.get("condition"))) {
						sql.append(" < '" + schmap.get("value") + "'");
					} else if ("gt".equals(schmap.get("condition"))) {
						sql.append(" > '" + schmap.get("value") + "'");
					} else if ("leq".equals(schmap.get("condition"))) {
						sql.append(" <= '" + schmap.get("value") + "'");
					} else if ("geq".equals(schmap.get("condition"))) {
						sql.append(" >= '" + schmap.get("value") + "'");
					} else if ("neq".equals(schmap.get("condition"))) {
						sql.append(" <> '" + schmap.get("value") + "'");
					}
					flag = true;
				}
			}

			System.out.println(sql.toString());

			Long count = (Long) this.getHibernateTemplate()
					.find(sql.toString()).listIterator().next();
			return count.intValue();
		} catch (RuntimeException re) {
			throw re;
		}
	}


	@Override
	@SuppressWarnings("rawtypes")
	public List<Cateory> findCateory(Map map) {
		// TODO Auto-generated method stub
		
		final StringBuffer sql = new StringBuffer();
		sql.append("from Cateory ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
		sql.append(" and deleted = 1");
		System.out.println(sql.toString());
		List<Cateory> lisCate= this.getHibernateTemplate().find(sql.toString());
		
		return lisCate;
	}
	
	@Override
	@SuppressWarnings("rawtypes")
	public Object findObjectByField(Class clazz, Object field, Object value) {
		try {
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append(" FROM " + name);
			sql.append(" WHERE " + field + "='" + value + "'");
			Object obj = this.getHibernateTemplate().find(sql.toString()).listIterator().next();	
			return obj;
		} catch (RuntimeException re) {
			throw re;
		}
	}
     
	@Override
	@SuppressWarnings("rawtypes")
	public Object findMaxId(Class clazz,String column, Map map) {
		// TODO Auto-generated method stub
		Object objId;
		try
		{
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append("select max(" + column + ") from " + name);	
			
			if (map != null && map.get("schList") != null) {
				List sch = (List) map.get("schList");
				sql.append(" WHERE ");
				Boolean flag = false;
				for (Object str : sch) {
					if (flag == true) {
						sql.append("AND");
					}
					Map schmap = (Map) str;
					sql.append(" " + schmap.get("field") + " ");
					if ("like".equals(schmap.get("condition"))) {
						sql.append(" like '%" + schmap.get("value") + "%' ");
					} else if ("eq".equals(schmap.get("condition"))) {
						sql.append(" = '" + schmap.get("value") + "'");
					} else if ("lt".equals(schmap.get("condition"))) {
						sql.append(" < '" + schmap.get("value") + "'");
					} else if ("gt".equals(schmap.get("condition"))) {
						sql.append(" > '" + schmap.get("value") + "'");
					} else if ("leq".equals(schmap.get("condition"))) {
						sql.append(" <= '" + schmap.get("value") + "'");
					} else if ("geq".equals(schmap.get("condition"))) {
						sql.append(" >= '" + schmap.get("value") + "'");
					} else if ("neq".equals(schmap.get("condition"))) {
						sql.append(" <> '" + schmap.get("value") + "'");
					}
					flag = true;
				}
			}
			
			System.out.println("sqlStr"  + sql.toString());
			
			objId = (Object)this.getHibernateTemplate().find(sql.toString()).listIterator().next();
		}
		catch (RuntimeException re) {
			throw re;
		}
		return objId;
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Object find(Class clazz, String column, String propertyName,
			Object value) {
		// TODO Auto-generated method stub
		Object obj = null;
		
		try{
		
			final String name = clazz.getName();
			final String columns = column;
			final String properName  = propertyName;
			final String values = value.toString();
			final StringBuffer sql = new StringBuffer();			
			if(column == "*"){
				sql.append(" from "  + name);
			}
			else{
				sql.append("select " + columns  + " from "  + name);
			}
			sql.append(" where  "  + properName + " = '" + values + "'");
			
			System.out.println("sqlStr"  + sql.toString());
			
			obj = this.getHibernateTemplate().find(sql.toString()).listIterator().next();
			
			
		}catch(Exception e ){
			e.fillInStackTrace();
		}
		
		return obj;
	}

	@Override
	@SuppressWarnings("rawtypes")
	public List<StoreInfo> findStoreInfo(Map map) {
		// TODO Auto-generated method stub
		
		final StringBuffer sql = new StringBuffer();
		sql.append("from StoreInfo ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
		System.out.println(sql.toString());
		List<StoreInfo> lisStore= this.getHibernateTemplate().find(sql.toString());
		
		return lisStore;
	}

	@Override
	public List<Affiche> findAfficeInfo(Map map) {
		// TODO Auto-generated method stub
		final StringBuffer sql = new StringBuffer();
		sql.append("from Affiche ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
       List<Affiche> lisAffiche= this.getHibernateTemplate().find(sql.toString());
	   return lisAffiche;
	}

	@Override
	public List<Region> findRegion(Map map) {
		final StringBuffer sql = new StringBuffer();
		sql.append("from Region ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
       List<Region> lisRegion = this.getHibernateTemplate().find(sql.toString());
	   return lisRegion;
	}

	@Override
	public Object findObjectByField(Class clazz, Map map) {
		// TODO Auto-generated method stub
		try {
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append("FROM " + name);
			if (map != null && map.get("schList") != null) {
				List sch = (List) map.get("schList");
				sql.append(" WHERE ");
				Boolean flag = false;
				for (Object str : sch) {
					if (flag == true) {
						sql.append("AND");
					}
					Map schmap = (Map) str;
					sql.append(" " + schmap.get("field") + " ");
					if ("like".equals(schmap.get("condition"))) {
						sql.append(" like '%" + schmap.get("value") + "%' ");
					} else if ("eq".equals(schmap.get("condition"))) {
						sql.append(" = '" + schmap.get("value") + "'");
					} else if ("lt".equals(schmap.get("condition"))) {
						sql.append(" < '" + schmap.get("value") + "'");
					} else if ("gt".equals(schmap.get("condition"))) {
						sql.append(" > '" + schmap.get("value") + "'");
					} else if ("leq".equals(schmap.get("condition"))) {
						sql.append(" <= '" + schmap.get("value") + "'");
					} else if ("geq".equals(schmap.get("condition"))) {
						sql.append(" >= '" + schmap.get("value") + "'");
					} else if ("neq".equals(schmap.get("condition"))) {
						sql.append(" <> '" + schmap.get("value") + "'");
					}
					flag = true;
				}
			}

			System.out.println(sql.toString());

			Object obj = this.getHibernateTemplate().find(sql.toString()).listIterator().next();
			return obj;
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public List findByName(Class clazz,String proertyName, int value) {
		// TODO Auto-generated method stub
		List list = null;
		
		try {
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append(" FROM " + name);
			sql.append(" WHERE " + proertyName + "='" + value + "'");
			list = this.getHibernateTemplate().find(sql.toString());	
			
		} catch (RuntimeException re) {
			throw re;
		}
		
		return list;
	}

	@Override
	public void update(Class clazz,Map mapCondition,Map map) {
		//update table1  set com1 = value1.....  where .....
		// TODO Auto-generated method stub
		try {
			final String name = clazz.getName();
			final StringBuffer sql = new StringBuffer();
			sql.append("update " + name);
			//拼接需要修改的字段和值
			if(mapCondition != null && mapCondition.get("sconList") != null){
				List scon = (List)mapCondition.get("sconList");
				sql.append(" SET ");
				Boolean flag = false;
				for(Object str : scon){
				     if(flag == true){
				    	 sql.append(",");
				     }
				     Map  socnmap = (Map)str;
				     sql.append(" " + socnmap.get("field") + " ");
				     if ("eq".equals(socnmap.get("condition"))) {
							sql.append(" = '" + socnmap.get("value") + "'");
				     }
				     flag = true;
				}
			}
			//拼接修改的条件
			if (map != null && map.get("schList") != null) {
				List sch = (List) map.get("schList");
				sql.append(" WHERE ");
				Boolean flag = false;
				for (Object str : sch) {
					if (flag == true) {
						sql.append(" AND ");
					}
					Map schmap = (Map) str;
					sql.append(" " + schmap.get("field") + " ");
					if ("like".equals(schmap.get("condition"))) {
						sql.append(" like '%" + schmap.get("value") + "%' ");
					} else if ("eq".equals(schmap.get("condition"))) {
						sql.append(" = '" + schmap.get("value") + "'");
					} else if ("lt".equals(schmap.get("condition"))) {
						sql.append(" < '" + schmap.get("value") + "'");
					} else if ("gt".equals(schmap.get("condition"))) {
						sql.append(" > '" + schmap.get("value") + "'");
					} else if ("leq".equals(schmap.get("condition"))) {
						sql.append(" <= '" + schmap.get("value") + "'");
					} else if ("geq".equals(schmap.get("condition"))) {
						sql.append(" >= '" + schmap.get("value") + "'");
					} else if ("neq".equals(schmap.get("condition"))) {
						sql.append(" <> '" + schmap.get("value") + "'");
					}
					flag = true;
				}
			}

			System.out.println("aaaaaaaaaaaaaaaaaaa:"+sql.toString());
            this.getHibernateTemplate().bulkUpdate(sql.toString());
		} catch (RuntimeException re) {
			throw re;
		}
	}

	@Override
	public List<Comm_info> findCommInfo(Map map) {
		// TODO Auto-generated method stub
		final StringBuffer sql = new StringBuffer();
		sql.append("from Comm_info ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append(" AND ");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				} else if("other".equals(schmap.get("condition"))){
					sql.append(" in " + "(" +  schmap.get("value") + ")");
				}
				flag = true;
			}
		}
		
		sql.append(" and uses = 1 order by commdName asc LIMIT 0, 10");
		System.out.println("sql" + sql.toString());
		List<Comm_info> lisComm= this.getHibernateTemplate().find(sql.toString());
		
		return lisComm;
	}

	@Override
	public List<Cateory> findCateory(Object field, Object value,String condition) {
		// TODO Auto-generated method stub
		
		 StringBuffer sql = new StringBuffer();

		sql.append("from Cateory where parentId <> -1 and " + field + condition  + value);
		List<Cateory> lisCate = this.getHibernateTemplate().find(sql.toString());
		return lisCate;
	}

	@Override
	public List<Brand> findBrand(Object field, Object value, String condition) {
		// TODO Auto-generated method stub
		 StringBuffer sql = new StringBuffer();
		 if(value != ""){
		 sql.append("from Brand where " + field + " " + condition + " " + "(" +value + ")" +  "order by recommend desc");
		 }
		 else{
			 sql.append("from Brand order by recommend desc"); 
		 }
		 System.out.println(sql.toString());
		 List<Brand> lisBrand = this.getHibernateTemplate().find(sql.toString());
		 return lisBrand;
	}

	@Override
	public List<Leaveword> findAllLeave() {
		// TODO Auto-generated method stub
		 String sql = "from Leaveword ";
		 List<Leaveword> lisleave = this.getHibernateTemplate().find(sql);
		return lisleave;
	}

	@Override
	public List<CommdAppr> findCommdAppr(Map map) {
		// TODO Auto-generated method stub
		final StringBuffer sql = new StringBuffer();
		sql.append("from CommdAppr ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
		 List<CommdAppr> lisCommdAppr = this.getHibernateTemplate().find(sql.toString());
		 return lisCommdAppr;
	}

	@Override
	public List<CommdArchives> findCommdArchives(Map map) {
		// TODO Auto-generated method stub
		
		final StringBuffer sql = new StringBuffer();
		sql.append("from CommdArchives ");
		
		if (map != null && map.get("schList") != null) {
			List sch = (List) map.get("schList");
			sql.append(" WHERE ");
			Boolean flag = false;
			for (Object str : sch) {
				if (flag == true) {
					sql.append("AND");
				}
				Map schmap = (Map) str;
				sql.append(" " + schmap.get("field") + " ");
				if ("like".equals(schmap.get("condition"))) {
					sql.append(" like '%" + schmap.get("value") + "%' ");
				} else if ("eq".equals(schmap.get("condition"))) {
					sql.append(" = '" + schmap.get("value") + "'");
				} else if ("lt".equals(schmap.get("condition"))) {
					sql.append(" < '" + schmap.get("value") + "'");
				} else if ("gt".equals(schmap.get("condition"))) {
					sql.append(" > '" + schmap.get("value") + "'");
				} else if ("leq".equals(schmap.get("condition"))) {
					sql.append(" <= '" + schmap.get("value") + "'");
				} else if ("geq".equals(schmap.get("condition"))) {
					sql.append(" >= '" + schmap.get("value") + "'");
				} else if ("neq".equals(schmap.get("condition"))) {
					sql.append(" <> '" + schmap.get("value") + "'");
				}
				flag = true;
			}
		}
		
		List<CommdArchives> lisCommArchives = this.getHibernateTemplate().find(sql.toString());
		return lisCommArchives;
	}
}
