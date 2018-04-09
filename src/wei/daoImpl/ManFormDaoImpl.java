package wei.daoImpl;

import wei.entity.Form;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.ManFormDao;
import wei.entity.GoldGood;
import wei.entity.User;


public class ManFormDaoImpl extends HibernateDaoSupport implements ManFormDao{

	@Override
	public void manFormTest() {
		
		System.out.println("formTest运行了");
	}

	@Override
	public GoldGood getGoodByGid(int goodId) {
		
		GoldGood good = this.getHibernateTemplate().get(GoldGood.class, goodId);
		
		System.out.println("getGoodByGid 商品名称：" +good.getGname() + "商品状态：" + good.getState());
		
		return good;
	}

	
	//查询订单的数量
	@Override
	public int findFormCount() {
		
		List<?> list = this.getHibernateTemplate().loadAll(Form.class);
		
		if(list.size()>0){
			
			 return list.size();
		}
		
		return 0;
	}

	//更新某个商品的信息
	@Override
	public void updateGood(GoldGood good) {
		
		System.out.println("updateGood 商品名称：" +good.getGname() + "商品状态：" + good.getState());
		  this.getHibernateTemplate().update(good);
		
	}

	@Override
	public void saveForm(Form goodForm) {
		
		this.getHibernateTemplate().save(goodForm);
		
	}

	@Override
	public int findCountByUid(int userId) {
		
		String hql = "from Form where buid = ?";
		
		List<?> list = this.getHibernateTemplate().find(hql, userId);
		
		if(list.size()>0){
			
			return list.size();
		}
		
		return 0;
	}

	@Override
	public List<Form> findFormByUidAndPage(int userId, int begin, int size) {
		
		String hql = "from Form where buid = "+userId;
		
		Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query query = session.createQuery(hql);
		query.setFirstResult(begin);
	    query.setMaxResults(size);
	    
	    List <?> list = query.list();
	    System.out.println("list.size:" + list.size());
	    
	    List<Form> formList = new ArrayList<Form>();
	    Iterator<?> it = list.iterator();
	    
	    while(it.hasNext()){
	    	
	    	Form f = (Form)it.next();
	    	formList.add(f);
	    	
	    //	System.out.println("f.getSellName():"+f.getSellName()+"  f.getGoodName():"+f.getGoodName());
	    }
	    
		
		return formList;
	}

	@Override
	public List<Form> findAllFormByPage(int begin, int size) {
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Form.class);
		List<?> list = this.getHibernateTemplate().findByCriteria(criteria, begin, size);
		
		List<Form> formList = new ArrayList<Form>();
		Iterator<?> it = list.iterator();
		
		while(it.hasNext()){
			
			Form f= (Form)it.next();
			formList.add(f);
			
			System.out.println("f.getGoodName():"+f.getGoodName()+"  f.getSellName():"+f.getSellName());
			
		}
		
		return formList;
	}

	@Override
	public Form getFormByFid(int tempformId) {
		
		Form ff = this.getHibernateTemplate().get(Form.class,tempformId);
		
		return ff;
	}

	@Override
	public void updateForm(Form ff) {
		
		this.getHibernateTemplate().update(ff);
		
	}

	@Override
	public User getUserByUid(int suid) {
		
		User user = this.getHibernateTemplate().get(User.class, suid);
		return user;
	}

	@Override
	public void updateUser(User user) {
		
		this.getHibernateTemplate().update(user);
		
	}

	@Override
	public void deleteForm(Form ff) {
		
		this.getHibernateTemplate().delete(ff);
		
	}


}
