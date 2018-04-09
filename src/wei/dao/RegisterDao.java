package wei.dao;

import wei.entity.User;

public interface RegisterDao {

	void registerGo();

	User checkUserByName(String checkName);

	void save(User user);

}
