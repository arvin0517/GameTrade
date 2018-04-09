package wei.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.UserDao;
import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public User findExistUser(User user) {

		System.out.println("UserDaoImpl:findExistUser方法被执行。。");
		String sql = "from User where uname = ? and password = ?";
		List<?> list = this.getHibernateTemplate().find(sql, user.getUname(), user.getPassword());

		if (list.size() > 0) {

			return (User) list.get(0);
		}
		return null;
	}

	@Override
	public void save(User user) {

		this.getHibernateTemplate().save(user);

	}

	@Override
	public int findCount() {

		// String hql = "select count(*) from user";
		// List<?> list = this.getHibernateTemplate().find(hql);
		List<User> list = getHibernateTemplate().loadAll(User.class);
		if (list.size() > 0) {

			return list.size();
		}

		return 0;
	}

	@Override
	public List<User> findByPage(int begin, int size) {
           
	//	System.out.println(" UserDaoImpl:size" + size);
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		List<?> list = this.getHibernateTemplate().findByCriteria(criteria, begin, size);
		List<User> userList = new ArrayList<User>();
		Iterator<?> it = list.iterator();

		while (it.hasNext()) {

			userList.add((User) it.next());
		}
		return userList;
	}

	@Override
	public User fingUserById(Integer uid) {

		User user = this.getHibernateTemplate().get(User.class, uid);
		return user;
	}

	@Override
	public void deleteUser(User user) {
		
		this.getHibernateTemplate().delete(user);
		
	}

	@Override
	public void editUser(User user) {
		
		this.getHibernateTemplate().update(user);
		
	}

	@Override
	public List<GoldGood> findGoodListByUser(int tempId) {
		
		String hql = "from GoldGood where uid = ?";
		List<?> list = this.getHibernateTemplate().find(hql, tempId);
		
		List<GoldGood> goodList = new ArrayList<GoldGood>();
		
		if(list.size()>0){
			
			Iterator<?> it = list.iterator();
			
			while(it.hasNext()){
				
				goodList.add((GoldGood)it.next());
			}
			
			return goodList;
		}

		
		return null;
	}

	@Override
	public void updateGoldGood(GoldGood goldGood) {
		
		this.getHibernateTemplate().update(goldGood);
		
	}

	@Override
	public List<Form> findFormBySellerId(int tempId) {
		
		String hql = "from Form where suid = ?";
		List<?> list = this.getHibernateTemplate().find(hql, tempId);
		List<Form> formOfSeller = new ArrayList<Form>();
		
		if(list.size()>0){
			
			Iterator<?> it =list.iterator();
			while(it.hasNext()){
				
				formOfSeller.add((Form)it.next());
				
			}
			
			return formOfSeller;
		}
		
		return null;
	}

	@Override
	public void updateForm(Form tempForm) {
		
		this.getHibernateTemplate().update(tempForm);
		
	}

	@Override
	public GoldGood findGoldGoodByGid(int fgid) {
		
		GoldGood gg= this.getHibernateTemplate().get(GoldGood.class, fgid);
		return gg;
	}

	@Override
	public List<Form> findFormByBuyerId(int tempId) {
		
		String hql = "from Form where buid = ?";
		List<?> list = this.getHibernateTemplate().find(hql, tempId);
		List<Form> formOfBuyer = new ArrayList<Form>();
		
		if(list.size()>0){
			
			Iterator<?> it = list.iterator();
			
			while(it.hasNext()){
				
				formOfBuyer.add((Form)it.next());
				
			}
			
			return formOfBuyer;
			
		}
		
		return null;
	}

}
