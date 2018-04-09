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
  
	 //注入userDao
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		
		this.userDao = userDao;
	}

	@Override
	public User findExistUser(User user) {
		
		System.out.println("UserServiceImpl: findExistUser方法被执行..");		
		return userDao.findExistUser(user);
	}

	@Override
	public void save(User user) {
		
		userDao.save(user);
		
	}

	@Override
	public PageBean<User> findByPage(int currPage) {
		
		PageBean<User> pageBean = new PageBean<User>();
		
		pageBean.setCurrPage(currPage);  //封装当前页
		
		int size = 6;
		pageBean.setPageSize(size);     //封装每页的记录数
		
	    int totalCount = userDao.findCount();
	    pageBean.setTotalCount(totalCount);//封装总记录数
	    
	    double count = totalCount;
	    double totalPage = Math.ceil(count/size);
	    pageBean.setTotalPage((int)totalPage);  //封装总页数
	    
	    int begin = (currPage-1) * size;
	    List<User> list = userDao.findByPage(begin,size);
	    pageBean.setList(list);               //封装每页要显示的数据
	    
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
