package wei.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.ManageGoodDao;
import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.User;

public class ManageGoodDaoImpl extends HibernateDaoSupport implements ManageGoodDao{

	
	//测试
	@Override
	public void testManage() {
		// TODO Auto-generated method stub
		System.out.println("manageDao运行了");
	}

	
	//返回商品的总个数
	@Override
	public int findTotalCount() {
		
		String hql = "from GoldGood where state= ? or state= ? or  state= ? or  state= ? or state= ? or state= ?";
		List<?> list = this.getHibernateTemplate().find(hql, "审核中","已上架","已购买","买家请求退货","卖家拒绝退货","已被强制退货");
	//	List<GoldGood> list = this.getHibernateTemplate().loadAll(GoldGood.class);
		
		if(list.size()>0){
			
			return list.size();
		}else{
			
			return 0;
		}
		
	}

   
	//返回当前页的所有商品
	@Override
	public List<GoldGood> findGoodByPage(int begin, int size) {
		
//		DetachedCriteria criteria = DetachedCriteria.forClass(GoldGood.class);
//		List<?> list = this.getHibernateTemplate().findByCriteria(criteria, begin, size);
		
		String hql = "from GoldGood where state='审核中' or state='已上架' or state='已购买' or state='买家请求退货' or state='卖家拒绝退货' or state='已被强制退货' ";
		Session session  =this.getHibernateTemplate().getSessionFactory().getCurrentSession();
	    Query query = session.createQuery(hql);
		query.setFirstResult(begin);
		query.setMaxResults(size);
		
		 List <?> list = query.list();
		List<GoldGood> goodList = new ArrayList<GoldGood>();
		Iterator<?> it = list.iterator();
		
		while(it.hasNext()){
			
			goodList.add((GoldGood)it.next());
		}
		
		return goodList;
	}


	@Override
	public GoldGood findGoodById(int tempId) {
	
		GoldGood gg = this.getHibernateTemplate().get(GoldGood.class, tempId);
		return gg;
	}


	@Override
	public void updateGood(GoldGood gg) {
		
		this.getHibernateTemplate().update(gg);
	}


	@Override
	public int findCountByUid(int userId) {
		
		String hql = "from GoldGood where uid = ?";
		List<?> list = this.getHibernateTemplate().find(hql, userId);
		
		if(list.size()>0){
			
			return list.size();
		}
		
		return 0;
	}


	@Override
	public List<GoldGood> findByUidAndPage(int userId, int begin, int size) {
	
		
	    String hql = "from GoldGood where uid = " + userId;
	    System.out.println("ManageGoodDao:hql:"+hql);
	    Session session  =this.getHibernateTemplate().getSessionFactory().getCurrentSession();
	    Query query = session.createQuery(hql);
	    query.setFirstResult(begin);
	    query.setMaxResults(size);
	    
	    List <?> list = query.list();
	    System.out.println("ManageGoodDao: list.size():"+list.size());
	    
	    List<GoldGood> goodByUserList = new ArrayList<GoldGood>();
	    Iterator<?> it = list.iterator();
	    
	    while(it.hasNext()){   
	    	
	    	GoldGood gg = (GoldGood)it.next();  //在这个循环里面,it.next()最好只能用好一次，不然会出现越界.
	    	goodByUserList.add(gg);
	    	
	    	//System.out.println("ManageGoodDao: goodName:"+ gg.getGname()+" "+ gg.getGgtype().getTypename());
	    }
	  
	    
		return goodByUserList;
	}


	@Override
	public void deleteGoldGood(GoldGood gg) {
		
		this.getHibernateTemplate().delete(gg);
		
	}


	@Override
	public void updateUser(User user) {
		
		this.getHibernateTemplate().update(user);
		
	}


	@Override
	public Form findFormByFGid(int tempId) {
		
		String hql = "from Form where fgid = ?";	
		List<?> list = this.getHibernateTemplate().find(hql, tempId);
		
		if(list.size()>0){
			
			return (Form)list.get(0);
			
		}
		
		return null;
	}


	@Override
	public void updateForm(Form ff) {
		
		this.getHibernateTemplate().update(ff);
		
	}


	@Override
	public User findUserByUid(int userId) {
		
		User user = this.getHibernateTemplate().get(User.class, userId);
		return user;
	}

	

	
}
