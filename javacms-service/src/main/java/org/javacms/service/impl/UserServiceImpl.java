package org.javacms.service.impl;

import org.javacms.beans.User;
import org.javacms.dao.UserDao;
import org.javacms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.AssertTrue;
import java.util.List;
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	@AssertTrue(message="{密码不正确}")
	public boolean checkUserWithIdAndPassword(String userId, String password) {
		return this.userDao.getUserByUserIdAndPassword(userId, password) > 0;
	}
	
	@Override
	public boolean changePassword(String newPassword, String userId, String oldPassword) {
		return userDao.updatePassword(newPassword, userId, oldPassword) > 0;
	}

	@Override
	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	@Override
	public List<User> getUserList() {
		// TODO Auto-generated method stub
		return userDao.getUserList();
	}
	
}
