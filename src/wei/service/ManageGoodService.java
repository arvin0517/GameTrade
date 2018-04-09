package wei.service;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;

public interface ManageGoodService {

	void testManage();

	PageBean<GoldGood> findAllGoods(int currPage);

	GoldGood findGoodById(int tempId);

	void updateGood(GoldGood gg);

	PageBean<GoldGood> findGoodListByUid(int userId, int currPage);

	void deleteGoldGood(GoldGood gg);

	void updateUser(User user);

	Form findFormByFGid(int tempId);

	void updateForm(Form ff);

	User findUserByUser(int userId);


}
