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

	
	//����
	@Override
	public void testManage() {
		// TODO Auto-generated method stub
		System.out.println("manageDao������");
	}

	
	//������Ʒ���ܸ���
	@Override
	public int findTotalCount() {
		
		String hql = "from GoldGood where state= ? or state= ? or  state= ? or  state= ? or state= ? or state= ?";
		List<?> list = this.getHibernateTemplate().find(hql, "�����","���ϼ�","�ѹ���","��������˻�","���Ҿܾ��˻�","�ѱ�ǿ���˻�");
	//	List<GoldGood> list = this.getHibernateTemplate().loadAll(GoldGood.class);
		
		if(list.size()>0){
			
			return list.size();
		}else{
			
			return 0;
		}
		
	}

   
	//���ص�ǰҳ��������Ʒ
	@Override
	public List<GoldGood> findGoodByPage(int begin, int size) {
		
//		DetachedCriteria criteria = DetachedCriteria.forClass(GoldGood.class);
//		List<?> list = this.getHibernateTemplate().findByCriteria(criteria, begin, size);
		
		String hql = "from GoldGood where state='�����' or state='���ϼ�' or state='�ѹ���' or state='��������˻�' or state='���Ҿܾ��˻�' or state='�ѱ�ǿ���˻�' ";
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
	    	
	    	GoldGood gg = (GoldGood)it.next();  //�����ѭ������,it.next()���ֻ���ú�һ�Σ���Ȼ�����Խ��.
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
