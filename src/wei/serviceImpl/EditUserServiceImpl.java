package wei.serviceImpl;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.EditUserDao;
import wei.entity.User;
import wei.service.EditUserService;

@Transactional
public class EditUserServiceImpl implements EditUserService{
	
	//注入dao
	private EditUserDao editUserDao;

	public EditUserDao getEditUserDao() {
		return editUserDao;
	}

	public void setEditUserDao(EditUserDao editUserDao) {
		this.editUserDao = editUserDao;
	}

	@Override
	public void check() {
		// TODO Auto-generated method stub
		System.out.println("service运行了");
		editUserDao.check();
	}

	@Override
	public void editForPAT(User user) {
		// TODO Auto-generated method stub
		 editUserDao.editForPAT(user);
	}
	

}
