package wei.dao;

import java.util.List;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.User;

public interface ManageGoodDao {

	void testManage();

	int findTotalCount();

	List<GoldGood> findGoodByPage(int begin, int size);

	GoldGood findGoodById(int tempId);

	void updateGood(GoldGood gg);

	int findCountByUid(int userId);

	List<GoldGood> findByUidAndPage(int userId, int begin, int size);

	void deleteGoldGood(GoldGood gg);

	void updateUser(User user);

	Form findFormByFGid(int tempId);

	void updateForm(Form ff);

	User findUserByUid(int userId);

}
