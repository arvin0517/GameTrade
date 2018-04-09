package wei.service;

import wei.entity.Form;
import wei.entity.GoldGood;
import wei.entity.PageBean;
import wei.entity.User;

public interface ManFormService {

	void manFormTest();

	GoldGood getGoodByGid(int goodId);

	int findFormCount();

	void updateGood(GoldGood good);

	void saveForm(Form goodForm);

	PageBean<Form> findFormListByUid(int userId, int currPage);

	PageBean<Form> findAllForm(int currPage);

	Form getFormByFid(int tempformId);

	void updateForm(Form ff);

	User getUserByUid(int suid);

	void updateUser(User user);

	void deleteForm(Form ff);

}
