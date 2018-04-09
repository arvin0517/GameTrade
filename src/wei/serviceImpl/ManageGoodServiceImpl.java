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

	 //ע��dao
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
		System.out.println("manageGoodService������");
		
	}

	@Override
	public PageBean<GoldGood> findAllGoods(int currPage) {

		PageBean<GoldGood> pageBean = new PageBean<GoldGood>();
		
		pageBean.setCurrPage(currPage); //��װ��ǰҳ
		
		int size = 5;
		pageBean.setPageSize(size);        //��װÿҳ�ļ�¼��
		
		int totalCount = manageGoodDao.findTotalCount();
		pageBean.setTotalCount(totalCount);  //��װ�ܼ�¼��
		
		double count = totalCount;
		double totalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)totalPage);  //��װ��ҳ��
		
		int begin = (currPage-1) * size;
		List<GoldGood> list = manageGoodDao.findGoodByPage(begin,size);
		pageBean.setList(list);   //��װÿҳ������
		
		
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
		
		pageBean.setCurrPage(currPage); //��װ��ǰҳ
		
		int size = 5;
		pageBean.setPageSize(size);  //��װÿҳ�ļ�¼��
		
		int totalCount = manageGoodDao.findCountByUid(userId);
		pageBean.setTotalCount(totalCount);
		System.out.println("totalCountByUid:"+totalCount);  //��װ�ܼ�¼��
		
		double count = totalCount;
		double tatalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)tatalPage);    //��װ��ҳ��
		
		int begin = (currPage-1) * size;
		List<GoldGood> list = manageGoodDao.findByUidAndPage(userId,begin,size);
		pageBean.setList(list);               //��װÿҳ������
		
		
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
