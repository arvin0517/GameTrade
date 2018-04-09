package wei.service;

import java.util.List;

import wei.entity.User;

public interface LoginService {

	User findUserByNameAndPw(String uname, String password);

	User findUserByUname(String uname);

	List<User> findUserListByUname(String uname);


}
