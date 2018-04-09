package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.ManageGoodDao;
import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;
import wei.service.ManageGoodService;

@Transactional
public class ManageGoodServiceImpl implements ManageGoodService{

	 //注入dao
	 private ManageGoodDao manageGoodDao;

	public ManageGoodDao getManageGoodDao() {
		return manageGoodDao;
	}

	public void setManageGoodDao(ManageGoodDao manageGoodDao) {
		this.manageGoodDao = manageGoodDao;
	}

	
	@Override
	public void testManage() {
		
		manageGoodDao.testManage();
		System.out.println("manageGoodService运行了");
		
	}

	@Override
	public PageBean<GoldGood> findAllGoods(int currPage) {

		PageBean<GoldGood> pageBean = new PageBean<GoldGood>();
		
		pageBean.setCurrPage(currPage); //封装当前页
		
		int size = 5;
		pageBean.setPageSize(size);        //封装每页的记录数
		
		int totalCount = manageGoodDao.findTotalCount();
		pageBean.setTotalCount(totalCount);  //封装总记录数
		
		double count = totalCount;
		double totalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)totalPage);  //封装总页数
		
		int begin = (currPage-1) * size;
		List<GoldGood> list = manageGoodDao.findGoodByPage(begin,size);
		pageBean.setList(list);   //封装每页的数据
		
		
		return pageBean;
	}

	@Override
	public GoldGood findGoodById(int tempId) {
		// TODO Auto-generated method stub
		return manageGoodDao.findGoodById(tempId);
	}

	@Override
	public void updateGood(GoldGood gg) {
		
		manageGoodDao.updateGood(gg);
	}

	@Override
	public PageBean<GoldGood> findGoodListByUid(int userId, int currPage) {
		
		PageBean<GoldGood> pageBean = new PageBean<GoldGood>();
		
		pageBean.setCurrPage(currPage); //封装当前页
		
		int size = 5;
		pageBean.setPageSize(size);  //封装每页的记录数
		
		int totalCount = manageGoodDao.findCountByUid(userId);
		pageBean.setTotalCount(totalCount);
		System.out.println("totalCountByUid:"+totalCount);  //封装总记录数
		
		double count = totalCount;
		double tatalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)tatalPage);    //封装总页数
		
		int begin = (currPage-1) * size;
		List<GoldGood> list = manageGoodDao.findByUidAndPage(userId,begin,size);
		pageBean.setList(list);               //封装每页的数据
		
		
		return pageBean;
	}

	@Override
	public void deleteGoldGood(GoldGood gg) {
	    
		manageGoodDao.deleteGoldGood(gg); 
		
	}

	@Override
	public void updateUser(User user) {
		
		manageGoodDao.updateUser(user);
		
	}

	@Override
	public Form findFormByFGid(int tempId) {
		
		return manageGoodDao.findFormByFGid(tempId);
	}

	@Override
	public void updateForm(Form ff) {
		
		manageGoodDao.updateForm(ff);
		
	}

	@Override
	public User findUserByUser(int userId) {
		
		return manageGoodDao.findUserByUid(userId);
	}

	 
}
