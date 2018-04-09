package wei.dao;

import java.util.List;

import wei.entity.User;

public interface LoginDao {

	User findExistUser(String uname, String password);

	User findUserByUname(String uname);

	List<User> findUserListByUname(String uname);


}
