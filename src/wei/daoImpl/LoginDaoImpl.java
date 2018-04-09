package wei.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.LoginDao;
import wei.entity.User;

public class LoginDaoImpl extends HibernateDaoSupport implements LoginDao{

	
	//ͨ���û����������ж��û��Ƿ����
	@Override
	public User findExistUser(String uname, String password) {
	   
		System.out.println("LoginDao:"+uname+";"+password);
		String sql = "from User where uname = ? and password = ?";
		List<?> list = this.getHibernateTemplate().find(sql, uname, password);
		
		if(list.size()>0){
			
//			User u = (User)list.get(0);
//			System.out.println(u.getPassword());
			return (User)list.get(0);
		}

		return null;
	}

	
	//ͨ���û��� ����һ��user����
	@Override
	public User findUserByUname(String uname) {
		
		String hql = "from User where uname = ?";
		List<?> list = this.getHibernateTemplate().find(hql, uname);
		
		if(list.size()>0){
			
			return (User)list.get(0);
			
		}
		
		return null;
	}

	
	//ͨ���û��� ����һ��userList
	@Override
	public List<User> findUserListByUname(String uname) {
		
		String hql = "from User where uname = ?";
		List<?> list = this.getHibernateTemplate().find(hql, uname);
		
		List<User> userList = new ArrayList<User>();
		Iterator<?> it = list.iterator();
		
		if(list.size()>0){
			
			while(it.hasNext()){
				
			       	userList.add((User)it.next());
				
			}
			
			return userList;
		}
		
		
		return null;
	}


}
