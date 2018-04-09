package wei.dao;

import java.util.List;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.User;

public interface ManFormDao {

	void manFormTest();

	GoldGood getGoodByGid(int goodId);

	int findFormCount();

	void updateGood(GoldGood good);

	void saveForm(Form goodForm);

	int findCountByUid(int userId);

	List<Form> findFormByUidAndPage(int userId, int begin, int size);

	List<Form> findAllFormByPage(int begin, int size);

	Form getFormByFid(int tempformId);

	void updateForm(Form ff);

	User getUserByUid(int suid);

	void updateUser(User user);

	void deleteForm(Form ff);

}
