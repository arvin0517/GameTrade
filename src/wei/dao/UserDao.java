package wei.dao;

import java.util.List;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.User;

public interface UserDao {

	User findExistUser(User user);

	void save(User user);

	int findCount();

	List<User> findByPage(int begin, int size);

	User fingUserById(Integer uid);

	void deleteUser(User user);

	void editUser(User user);

	List<GoldGood> findGoodListByUser(int tempId);

	void updateGoldGood(GoldGood goldGood);

	List<Form> findFormBySellerId(int tempId);

	void updateForm(Form tempForm);

	GoldGood findGoldGoodByGid(int fgid);

	List<Form> findFormByBuyerId(int tempId);

}
