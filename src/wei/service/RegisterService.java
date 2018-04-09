package wei.service;

import wei.entity.User;

public interface RegisterService {

	void registerGo();

	User checkUserByName(String checkName);

	void save(User user);

}
