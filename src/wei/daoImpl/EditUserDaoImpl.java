package wei.daoImpl;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.EditUserDao;
import wei.entity.User;

public class EditUserDaoImpl extends HibernateDaoSupport implements EditUserDao{

	@Override
	public void check() {
		// TODO Auto-generated method stub
		System.out.println("dao‘À––¡À");
	}

	@Override
	public void editForPAT(User user) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(user);
	}

}
