package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.LoginDao;
import wei.entity.User;
import wei.service.LoginService;

@Transactional
public class LoginServiceImpl implements LoginService{

	//注入loginDao
	private LoginDao loginDao;

	public LoginDao getLoginDao() {
		return loginDao;
	}

	public void setLoginDao(LoginDao loginDao) {
		this.loginDao = loginDao;
	}

	@Override
	public User findUserByNameAndPw(String uname, String password) {
		// TODO Auto-generated method stub
		return loginDao.findExistUser(uname,password);
	}

	
	//返回一个user对象
	@Override
	public User findUserByUname(String uname) {
		
		return loginDao.findUserByUname(uname);
	}

	//返回一个userlist
	@Override
	public List<User> findUserListByUname(String uname) {
				
		return loginDao.findUserListByUname(uname);
	}

	
}
