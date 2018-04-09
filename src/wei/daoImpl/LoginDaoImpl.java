package wei.daoImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import wei.dao.LoginDao;
import wei.entity.User;

public class LoginDaoImpl extends HibernateDaoSupport implements LoginDao{

	
	//通过用户名和密码判断用户是否存在
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

	
	//通过用户名 返回一个user对象
	@Override
	public User findUserByUname(String uname) {
		
		String hql = "from User where uname = ?";
		List<?> list = this.getHibernateTemplate().find(hql, uname);
		
		if(list.size()>0){
			
			return (User)list.get(0);
			
		}
		
		return null;
	}

	
	//通过用户名 返回一个userList
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
