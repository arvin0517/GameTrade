package wei.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.RegisterDao;
import wei.entity.User;
import wei.service.RegisterService;

@Transactional
public class RegisterServiceImpl implements RegisterService{

	 //注入registerDao
     private RegisterDao registerDao;
     
	public RegisterDao getRegisterDao() {
		return registerDao;
	}

	public void setRegisterDao(RegisterDao registerDao) {
		this.registerDao = registerDao;
	}

	@Override
	public void registerGo() {
		// TODO Auto-generated method stub
		System.out.println("registerService运行了");
		registerDao.registerGo();
	}

	@Override
	public User checkUserByName(String checkName) {
		
		
		return registerDao.checkUserByName(checkName);
	}

	@Override
	public void save(User user) {
		
		registerDao.save(user);
		
	}
     
	  
}
