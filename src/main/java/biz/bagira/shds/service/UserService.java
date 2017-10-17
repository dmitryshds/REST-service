package biz.bagira.shds.service;


import biz.bagira.shds.entities.User;

public interface UserService {
	 User findUserByUsername(String username);
	 void saveUser(User user);
}
