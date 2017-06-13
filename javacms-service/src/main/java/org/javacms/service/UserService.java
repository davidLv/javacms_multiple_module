package org.javacms.service;

import org.javacms.beans.User;

import java.util.List;

public interface UserService {
	
	boolean checkUserWithIdAndPassword(String userId, String password);
	
	boolean changePassword(String newPassword, String userId, String oldPassword);
	
	User getUserByUsername(String username);
	
	List<User> getUserList();
}
