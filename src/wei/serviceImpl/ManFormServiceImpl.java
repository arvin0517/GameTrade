package wei.serviceImpl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import wei.dao.ManFormDao;
import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;
import wei.service.ManFormService;

@Transactional
public class ManFormServiceImpl implements ManFormService{

	//ע��dao
	public ManFormDao manFormDao;

	public ManFormDao getManFormDao() {
		return manFormDao;
	}

	public void setManFormDao(ManFormDao manFormDao) {
		this.manFormDao = manFormDao;
	}

	@Override
	public void manFormTest() {
		
		manFormDao.manFormTest();
		System.out.println("formTestService������");
		
	}

	@Override
	public GoldGood getGoodByGid(int goodId) {
		
		return manFormDao.getGoodByGid(goodId);
	}

	@Override
	public int findFormCount() {
		
		return manFormDao.findFormCount();
	}

	@Override
	public void updateGood(GoldGood good) {
		
		manFormDao.updateGood(good);
		
	}

	@Override
	public void saveForm(Form goodForm) {
		
		manFormDao.saveForm(goodForm);
		
	}

	@Override
	public PageBean<Form> findFormListByUid(int userId, int currPage) {
		
		PageBean<Form> pageBean = new PageBean<Form>();
		
		pageBean.setCurrPage(currPage); //��װ��ǰҳ
		
		int size = 5;
		pageBean.setPageSize(size);     //��װÿҳ�ļ�¼��
		
		int totalCount = manFormDao.findCountByUid(userId);
		//System.out.println("totalCount:"+totalCount);
		pageBean.setTotalCount(totalCount);    //��װ�ܼ�¼��
		
		double count = totalCount;
		double totalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)totalPage);   //��װ��ҳ��
		
		int begin = (currPage-1) * size;	
		List<Form> list = manFormDao.findFormByUidAndPage(userId,begin,size);
		pageBean.setList(list);                  //��װÿҳ������
		
		
		return pageBean;
	}

	@Override
	public PageBean<Form> findAllForm(int currPage) {
		
		PageBean<Form> pageBean = new PageBean<Form>();
		
        pageBean.setCurrPage(currPage); //��װ��ǰҳ
		
		int size = 5;
		pageBean.setPageSize(size);        //��װÿҳ�ļ�¼��
		
		int totalCount = manFormDao.findFormCount();
		pageBean.setTotalCount(totalCount); //��װ�ܼ�¼��
		
		double count = totalCount;
		double totalPage = Math.ceil(count/size);
		pageBean.setTotalPage((int)totalPage);  //��װ��ҳ��
		
		int begin = (currPage-1)*size;
		List<Form> list = manFormDao.findAllFormByPage(begin,size);
		pageBean.setList(list);    //��װÿҳ������
		
		return pageBean;
	}

	@Override
	public Form getFormByFid(int tempformId) {
		
		
		return manFormDao.getFormByFid(tempformId);
	}

	@Override
	public void updateForm(Form ff) {
		
		manFormDao.updateForm(ff);
		
	}

	@Override
	public User getUserByUid(int suid) {
		
		return manFormDao.getUserByUid(suid);
	}

	@Override
	public void updateUser(User user) {
		
		manFormDao.updateUser(user);
		
	}

	@Override
	public void deleteForm(Form ff) {
		
		manFormDao.deleteForm(ff);
		
	}

	
}
