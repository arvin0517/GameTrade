package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.UserDao;
import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;

@Transactional
public class UserServiceImpl implements wei.service.UserService {
  
	 //ע��userDao
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		
		this.userDao = userDao;
	}

	@Override
	public User findExistUser(User user) {
		
		System.out.println("UserServiceImpl: findExistUser������ִ��..");		
		return userDao.findExistUser(user);
	}

	@Override
	public void save(User user) {
		
		userDao.save(user);
		
	}

	@Override
	public PageBean<User> findByPage(int currPage) {
		
		PageBean<User> pageBean = new PageBean<User>();
		
		pageBean.setCurrPage(currPage);  //��װ��ǰҳ
		
		int size = 6;
		pageBean.setPageSize(size);     //��װÿҳ�ļ�¼��
		
	    int totalCount = userDao.findCount();
	    pageBean.setTotalCount(totalCount);//��װ�ܼ�¼��
	    
	    double count = totalCount;
	    double totalPage = Math.ceil(count/size);
	    pageBean.setTotalPage((int)totalPage);  //��װ��ҳ��
	    
	    int begin = (currPage-1) * size;
	    List<User> list = userDao.findByPage(begin,size);
	    pageBean.setList(list);               //��װÿҳҪ��ʾ������
	    
		return pageBean;
	}

	@Override
	public User findUserById(Integer uid) {
		
		
		return userDao.fingUserById(uid);
	}

	@Override
	public void deleteUser(User user) {
		
		userDao.deleteUser(user);
		
	}

	@Override
	public void editUser(User user) {
		
		userDao.editUser(user);
		
	}

	@Override
	public List<GoldGood> findGoodListByUser(int tempId) {
		
		return userDao.findGoodListByUser(tempId);
	}

	@Override
	public void updateGoldGood(GoldGood goldGood) {
		
		userDao.updateGoldGood(goldGood);
		
	}

	@Override
	public List<Form> findFormBySellerId(int tempId) {
		
		return userDao.findFormBySellerId(tempId);
	}

	@Override
	public void updateForm(Form tempForm) {
		
		userDao.updateForm(tempForm);
		
	}

	@Override
	public GoldGood findGoldGoodByGid(int fgid) {
		
		return userDao.findGoldGoodByGid(fgid);
	}

	@Override
	public List<Form> findFormByBuyerId(int tempId) {
		
		return userDao.findFormByBuyerId(tempId);
	}
}
