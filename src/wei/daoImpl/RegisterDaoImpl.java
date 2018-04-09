package wei.daoImpl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.RegisterDao;
import wei.entity.User;

public class RegisterDaoImpl extends HibernateDaoSupport  implements RegisterDao{

	@Override
	public void registerGo() {
		
		  System.out.println("registerDao‘À––¡À");
	}

	@Override
	public User checkUserByName(String checkName) {
		
		
		String sql = "from User where uname = ?";
		List<?> list = this.getHibernateTemplate().find(sql, checkName);
		
		if(list.size()>0){
			
			return (User)list.get(0);
		}
		
		
		return null;
	}

	@Override
	public void save(User user) {
		
		this.getHibernateTemplate().save(user);
		
	}

	
}
